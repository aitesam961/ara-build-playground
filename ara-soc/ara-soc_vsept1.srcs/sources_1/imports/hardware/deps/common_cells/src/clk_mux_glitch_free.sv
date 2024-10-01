//-----------------------------------------------------------------------------
// Title         : Glitch-free Clock Multiplexer
//-----------------------------------------------------------------------------
// File          : clk_mux_glitch_free.sv
// Author        : Manuel Eggimann  <meggimann@iis.ee.ethz.ch>
// Created       : 10.12.2022
//-----------------------------------------------------------------------------
// Description :
//
// This module allows glitch free clock multiplexing between N arbitrary input
// clock with completely unknown phase relation shipts. The module will make
// sure to first synchronize the clock multiplexer signal to the relevant clock
// domains and ensures glitch free switching between the source clock and the
// new target clock by silencing the output at appropriate times. The clock
// signals themselves only pass through: 1 clock-gate, 1 N-input clock-OR Gate,
// 1 2-input clock mux. All these cells are referenced from the tech_cells
// repository and thus no conventional logic gate is directly in the clock path.

// The correctness of this module is based on the following assumptions:
// 1. The select signal stays stable for a duration of at least min(clks_i
// period)
// 2. Glitches on the select signal are shorter than min(clks_i) - t_setup
// 3. During a transition from clock input a to clock input b, both clocks have
// a stable period.
//
// A clock switching procedure from clock a to clock b has the following timing behavior:
// 1. After at most NUM_SYNC_STAGES clock cycle of clock a, the output clock is
// disabled with its next falling edge.
// 2. After clock cycle of clock a and another NUM_SYNC_STAGES clock cycles of clock b, the output is
// enabled with the next rising edge of clock B.
//
// So in total, an upper bound for the worst case clock switching delay is 2x
// NUM_SYNC_STAGES x max(clock_periods)
//
// The design has a parameter (CLOCK_DURING_RESET) that allows the clock
// multiplexer to propagate the selected clock even during reset assertion.
// However, during reset assertion the glitch filtering and the synchronization
// registers are bypassed (since the are frozen in reset state). Thus no glitch
// filtering is performed during reset. This is ok if the async_sel_i signal
// stays constant during reset assertion. Once you deassert the reset, regular
// glitch fitlering and synchronization will kick in. However, you must wait for
// at least 1x max(input clock periods) before changing the async_sel_i after a
// reset to be sure the switch to regular operation has completed. During the
// transition from async_reset operation to regular operation there will be a
// short phase where the clock is gated (similar to what happens when you switch
// from one clock to the other).
//
//  IMPORTANT!!!
//
// All clock gating/logic within this design is performed by dedicated clock
// logic tech cells. By default the common_cell library uses the behavioral
// models in the `tech_cells_generic` repository. However, for synthesis these
// cells need to be mapped to dedicated cells from your standard cell library,
// preferably ones that are designed for clock logic (they have balanced rise
// and fall time). During synthesis you furthermore have to properly set
// `dont_touch` or `size_only` attributes to prevent the logic synthesizer from
// replacing those cells with regular logic gates which could end up being
// glitchty!
//
//-----------------------------------------------------------------------------
// Copyright (C) 2013-2022 ETH Zurich, University of Bologna
// Copyright and related rights are licensed under the Solderpad Hardware
// License, Version 0.51 (the "License"); you may not use this file except in
// compliance with the License. You may obtain a copy of the License at
// http://solderpad.org/licenses/SHL-0.51. Unless required by applicable law
// or agreed to in writing, software, hardware and materials distributed under
// this License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR
// CONDITIONS OF ANY KIND, either express or implied. See the License for the
// specific language governing permissions and limitations under the License.
//-----------------------------------------------------------------------------

// Helper Module to generate an N-input clock OR-gate from a tree of tc_clk_or2 cells.
module clk_or_tree #(
  parameter int unsigned NUM_INPUTS
) (
  input logic [NUM_INPUTS-1:0] clks_i,
  output logic clk_o
);

  if (NUM_INPUTS < 1) begin : gen_error
    $error("Cannot parametrize clk_or with less then 1 input but was %0d", NUM_INPUTS);
  end else if (NUM_INPUTS == 1) begin : gen_leaf
    assign clk_o          = clks_i[0];
  end else if (NUM_INPUTS == 2) begin : gen_leaf
    tc_clk_or2 i_clk_or2 (
      .clk0_i(clks_i[0]),
      .clk1_i(clks_i[1]),
      .clk_o
    );
  end else begin  : gen_recursive
    logic branch_a, branch_b;
    clk_or_tree #(NUM_INPUTS/2) i_or_branch_a (
      .clks_i(clks_i[0+:NUM_INPUTS/2]),
      .clk_o(branch_a)
    );

    clk_or_tree #(NUM_INPUTS/2 + NUM_INPUTS%2) i_or_branch_b (
      .clks_i(clks_i[NUM_INPUTS-1:NUM_INPUTS/2]),
      .clk_o(branch_b)
    );

    tc_clk_or2 i_clk_or2 (
      .clk0_i(branch_a),
      .clk1_i(branch_b),
      .clk_o
    );
  end

endmodule
