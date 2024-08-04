# Building pulp-platform/ara with Makefile workflow

### Environment details
```
Ubuntu 22.04 LTS for AMD64 platform
Linux Kernel Version: 6.8 (HWE)
Required library dependencies installed as listed in Section 1.1
```
**Please Note:** Ubuntu 22LTS is the only known env to have the maximum success and several issues arise with newer 24.04LTS (bender not available, some deps lib versions are different)
## 1 - Prerequisites

The software packages used by `ara` including LLVM-toolchain, RISCV tools require following packages to be installed.

```
sudo apt-get install autoconf automake autotools-dev curl python3 python3-pip libmpc-dev libmpfr-dev libgmp-dev gawk build-essential bison flex texinfo gperf libtool patchutils bc zlib1g-dev libexpat-dev ninja-build git cmake libglib2.0-dev libslirp-dev device-tree-compiler libboost-regex-dev libboost-system-dev
```

## 2- Building ara for RTL simulations using Questa

### 2.1 Download sources
```
# Clone the repository with latest release
git clone https://github.com/pulp-platform/ara.git
cd ara

# download additional requried modules
git submodule update --init --recursive
git submodule sync --recursive

# download additional Hardware dependencies using bender
cd hardware 
make checkout
```
- if `make checkout` doesn't work, use `make update` and then try `make checkout`

The results should look like this:
```
/home/runner/work/ara-build-playground/ara-build-playground/ara/hardware/../hardware/bender checkout
    Checkout common_verification (https://github.com/pulp-platform/common_verification.git)
     Cloning common_verification (https://github.com/pulp-platform/common_verification.git)
    Checkout tech_cells_generic (https://github.com/pulp-platform/tech_cells_generic.git)
     Cloning tech_cells_generic (https://github.com/pulp-platform/tech_cells_generic.git)
    Checkout common_cells (https://github.com/pulp-platform/common_cells.git)
     Cloning common_cells (https://github.com/pulp-platform/common_cells.git)
    Checkout fpu_div_sqrt_mvp (https://github.com/pulp-platform/fpu_div_sqrt_mvp.git)
     Cloning fpu_div_sqrt_mvp (https://github.com/pulp-platform/fpu_div_sqrt_mvp.git)
    Checkout axi (https://github.com/pulp-platform/axi.git)
     Cloning axi (https://github.com/pulp-platform/axi.git)
    Checkout fpnew (https://github.com/pulp-platform/cvfpu.git)
     Cloning fpnew (https://github.com/pulp-platform/cvfpu.git)
    Checkout apb (https://github.com/pulp-platform/apb.git)
     Cloning apb (https://github.com/pulp-platform/apb.git)
    Checkout cva6 (https://github.com/mp-17/cva6.git)
     Cloning cva6 (https://github.com/mp-17/cva6.git)
```


**Note:** llvm-toolchain may not be necessary as far as only RTL sims are concerned but the later steps does not succeed unless the previous steps are successfully finished. So its required.

The results upto this stage can be verified from the [Actions run](https://github.com/aitesam961/ara-build-playground/actions/runs/9795191450/job/27046776347) in this repository

### 2.2 Build LLVM-Toolchain

```
cd ara
make toolchan-llvm
```
**Note:** `make toolchain-llvm` by default configures `make -j(nproc) to -j32 which may destabilize the environment when running in virtual machines. Signs may include VM crashing, freezing or restarting itself. 

To **FIX** this, modify the `ara/Makefile` by replacing -j32 with (number-of-cpu-threads-on-your-vm)-2 to avoid overutilization of context switching.

`ara/Makefile line: 143, 158`

**Note:** The top level test bench requires riscv-tools custom built for ara to generate the binaries that are fed into tb. (At least thats what I understand. Please correct me if I'm wrong).

### 2.3 Build riscv-isa-sim 

riscv-isa-sim is involved in building the riscv-gnu-toolchain customized for pulp-ara. Proceed as follows:

```
cd ara
make riscv-isa-sim
```
Occassionaly, you may get `make: *** No rule to make target`. That appears sometimes when Makefile terminates without completion and as a prevention measure, the scripts somehow mark that task as done to avoid redoing.

To **FIX** this, slightly edit the Makefile (add another line/comment etc) and retry. If still persists, rerun `git submodule update --init --recursive`

### 2.4 Manually Install RISCV-GNU toolchain
Now, makefile scripts for some reason does not reliably build the riscv-gnu toolchain. Perhaps the assumption that most users already have it. 

To build the toolchain compatible with makefile steps, execute the following command in project `ara` home directory.

```
cd /install/riscv-gcc
# Build riscv-binutils
cd toolchain/riscv-gnu-toolchain
rm -rf build && mkdir -p build && cd build
CC=$(CC) CXX=$(CXX) ../configure --prefix="$GCC_INSTALL_DIR" --with-arch=rv64gcv --with-cmodel=medlow --enable-multilib
make -j8
```

This script should build the riscv-gcc toolchain. If fails, please fetch a pre-built toolchain from my previous attempt (https://github.com/aitesam961/soft-sky-riscv-gnu-prebuilt) and add to path using the instructions available. Ensure the riscv-toolchain path aligns with ara required binary path.


### 2.5 Install/setup  Questasim
Install Questasim using the standard installation procedure and add to path. The versions supported by Pulp-ara are `2019.3` & `2021.2`. Later is being used in this case.

**Check My Guide for installing Questasim**: https://gist.github.com/aitesam961/608ec27862e942e5ae1360fd0ba2b4d2

Now, even when Questasim installed and added to path, visible to the Makefile, still you may encounter this error.

```
Makefile:83: "Specified QuestaSim version (questa-2021.2) not found in PATH /opt/questasim/linux_x86_64:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin"
```

This refers to the following lines in ara/hardware/Makefile

```
ifeq (, $(shell which $(questa_cmd)))
  # Spaces are needed for indentation here!
  $(warning "Specified QuestaSim version ($(questa_cmd)) not found in PATH $(PATH)")
  questa_cmd =
endif
```

Even if you have Questasim successfully installed and in Path, still this warning would appear. Even the Makefile is able to launch questa during simulation attempt but still not able to find.
So, no work around, let's live with it.


### 2.6 Install Verilator
Although we plan no to use verilator but below is the process to work around the issues and intsall the required version for ara.

`make verilator` likely returns error
```
configure: error: in `/home/asus/pulp-ara/ara/toolchain/verilator':
configure: error: C compiler cannot create executables
See `config.log' for more details
make: *** [Makefile:168: /home/ara/install/verilator] Error 77
```

This is caused by the Compiler Flags. The quick workaround I could find is: modify the ara/Makefile at line # 169
```
# Replace
CC=$(CLANG_CC) CXX=$(CLANG_CXX) CXXFLAGS=$(CLANG_CXXFLAGS) LDFLAGS=$(CLANG_LDFLAGS)

# With
CC="" 
```
This allows verilator to be built with default compiler (g++ through C++ compiler) instead of CLANG for LLVM.

While sometime it works, sometimes you might be greeted by the following errors after build is complete: 
```
make[3]: Leaving directory '/home/asus/pulp-ara/ara/toolchain/verilator/src/obj_opt'
make[2]: Leaving directory '/home/asus/pulp-ara/ara/toolchain/verilator/src'
make[1]: Leaving directory '/home/asus/pulp-ara/ara/toolchain/verilator'
make: *** [Makefile:168: /home/asus/pulp-ara/ara/install/verilator] Error 2
```

I cannot find a potential fix or workaround for it. Anyways, we're not using Verilator so Let's skip it for now.

The other way to do is, in the compiler flags, replace `CLANG_CC` with `clang` and `CLANG_CXX` with `clang++` and it should build verilator just fine.

## 3 Tests and Simulations

Before compiling the examples, following python libs should be installed
```
pip3 install numpy
```

### 3.1 Compile binaries using riscv-gnu-toolchain
To compile a simple hello_world binary, the following script is used:
```
cd /ara/apps
make bin/hello_world

# To further simulate it with spike simulator
make bin/hello_world.spike
make spike-run-hello_world
```
The results should be:
```
Ariane says hello
```

But this example does not include any vector instructions so a proper vector test example should be:
```
cd /ara/apps
make bin/fft

# To further simulate it with spike simulator
make bin/fft.spike
make spike-run-fft
```
### 3.2 Simulate on Spike riscv-isa Simulator

Simulations with spike should yield
```
Performance: %f. Max perf: %f. Actual performance is %f% of max.

Comparison of the first 5 output numbers:

Out_DIF[0] == %f + (%f)j
Out_DIF[1] == %f + (%f)j
Out_DIF[2] == %f + (%f)j
Out_DIF[3] == %f + (%f)j
Out_DIF[4] == %f + (%f)j

Out_vec_DIF[0] == %f + (%f)j
Out_vec_DIF[1] == %f + (%f)j
Out_vec_DIF[2] == %f + (%f)j
Out_vec_DIF[3] == %f + (%f)j
Out_vec_DIF[4] == %f + (%f)j

Test result: PASS. The output is correct.
```

FFT binary certainly includes vector instructions. This can be verified by exploring the dump of fft binary. Later when simulating RTL, this is useful to know that which vector instructions are being executed. Analyzing the fft.dump, we can see following vector instructions in use starting at around pc: 80000568
```
800005b4: 57 f0 08 0d  	vsetvli	zero, a7, e32, m1, ta, ma
800005b8: d7 c4 b8 3c  	vslidedown.vx	v9, v11, a7, v0.t
800005bc: 57 f0 03 0d  	vsetvli	zero, t2, e32, m1, ta, ma
800005c0: 57 16 c7 0a  	vfsub.vv	v12, v12, v14
800005c4: 57 97 17 93  	vfmul.vv	v14, v17, v15
800005c8: 57 70 00 09  	vsetvli	zero, zero, e32, m1, tu, ma
800005cc: 57 17 06 bf  	vfnmsac.vv	v14, v12, v16
800005d0: 57 f0 08 01  	vsetvli	zero, a7, e32, m1, tu, mu
800005d4: 57 35 d0 9e  	vmv1r.v	v10, v13
800005d8: 57 c5 d8 3c  	vslidedown.vx	v10, v13, a7, v0.t
800005dc: 57 f0 03 0d  	vsetvli	zero, t2, e32, m1, ta, ma
800005e0: 57 18 18 93  	vfmul.vv	v16, v17, v16
800005e4: 57 70 00 09  	vsetvli	zero, zero, e32, m1, tu, ma
```
Later we will use this binary to simulate RTL using testbench.

### 3.3 Run riscv-tests 

The developers of project provide unit-tests that run on CVA6+ARA binaries. I cannot understand how they work. Likely they are not a testament as RTL simulations. To compile and run:

```
cd ara/apps
make riscv-tests
```
I cannot verify the results of this step. There is some compilation but without any solid results.


### 3.4 Simulate with Questasim

The provided set of scripts:
```
cd hardware
make compile
app=fft make sim
```
are supposed to simulate RTL using Questasim.

The first error that likely appears is
```
tb/dpi/elfloader.cc:4:10: fatal error: svdpi.h: No such file or directory
    4 | #include <svdpi.h>
      |          ^~~~~~~~~
compilation terminated.
make: *** [Makefile:257: build/work-dpi/elfloader.o] Error 1

```

The information about this error on the internet points to this issue with Questasim. I tried the following but without success:

- Tried manually placing the ["svdpi.h"](https://github.com/grg/verilator/blob/master/include/vltstd/svdpi.h) under /tb/dpi but with no luck. Seems Questasim has its own svdpi lib whose source directory is unknown.

- Tried adding checking flags in the Makefile: compile scripts, make the debug more verbose but without success.

- Tried Questasim 2021.2, 2020.4, 10.7x
- The error status differs in some variants (10.7x) but the key issue with svdpi.h persists.

- Tried recompiling all the sources with a fresh clone but the issue persists.
- Tried building on a completely new OS install with fresh installation of deps libraries and the issue persists.
- Tried an older release of ara (V2.2) and the issue persists.


Cannot find a solution or a reasonable workaround. So moving to the second approach which is collecting the RTL at a stable release point and manually compiling and testing it. The existing testbench may need slight modifications in this case.

