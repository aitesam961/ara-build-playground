# Building pulp-platform/ara with provided Makefile

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
- if `make checkout` doesnt work, use `make update` and then try `make checkout`

**Note:** llvm-toolchain may not be neccessary as far as only RTL sims are concerned but the later steps does not succeed unless the previous steps are successfully finished. So its required.

### 2.2 Build LLVM-Toolchain

```
cd ara
make toolchan-llvm
```
**Note:** `make toolchain-llvm` by default configues `make -j(nproc) to -j32 which may destabilize the environment when running in virual machines. Signs may include VM crashing, freezing or restarting itself. 

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


### Install/setup  Questasim
Install Questasim using the standard installation procedure and add to path. The versions supported by Pulp-ara are `2019.3` & `2021.2`. Later is being used in this case.

**Check My Guide for installing Questasim**: https://gist.github.com/aitesam961/608ec27862e942e5ae1360fd0ba2b4d2

Now, even when Questasim installed and added to path, visible to the Makefile, still you may encounter this error.

```
Makefile:83: "Specified QuestaSim version (questa-2021.2) not found in PATH /opt/questasim/linux_x86_64:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin"
```

This refers to 

> 
> https://github.com/pulp-platform/bender/blob/e6af4f7406d31a0555fe5a6d85948017fce02b1a/init#L329
> 

### Compile & simulate with Questasim (using Makefile automated process)

