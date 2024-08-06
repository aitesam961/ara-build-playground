STAGE-1

= PLENTY of warnings - constructs not compatible with vivado - several case-default missing - probably wont synthesize


- ARA ONLY - no SOC thing
- All the V3.0 RTL  is loaded
- deps are bender cloned - no external module added
- VLSU Quarantined (AXI-CUT has issue - cannot resolve hierarcal names ...with spill-register)
- Some changes in RTL include
    - `include path changed
    - Nrlanes = 2 in ara's top
    - nrBanks = 0 in operand requester
    - VLEN    = 128
    

STAGE-1.5
- VLSU included but only AXI-CUT line 43-56 excluded


    
