# Building pulpplatform-ara with provided Makefile

### Environment details
```
Ubuntu 22.04 LTS for AMD64 platform
Linux Kernel Version: 6.8 (GWE)
Required library dependencies installed as listed in Section 1.1
```
**Please Note:** Ubuntu 22LTS is the only known env to have the maximum success and several issues arise with newer 24.04LTS (bender not available, some deps lib versions are different)
## 1 - Prerequisites

The software packages used by `ara` including LLVM-toolchain, RISCV tools require following packages to be installed.

```
sudo apt-get install autoconf automake autotools-dev curl python3 python3-pip libmpc-dev libmpfr-dev libgmp-dev gawk build-essential bison flex texinfo gperf libtool patchutils bc zlib1g-dev libexpat-dev ninja-build git cmake libglib2.0-dev libslirp-dev device-tree-compiler libboost-regex-dev libboost-system-dev
```

## 2- Building ara for RTL simulations using Questa

### Download sources
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
- if make checkout doesnt work, use make update and then make checkout

### Build LLVM-Toolchain

```
cd ara
make toolchan-llvm
```
**Note:** `make toolchain-llvm` by default configues `make -j(nproc) to -j32 which may destabilize the environment when running in virual machines. Signs may include VM crashing, freezing or restarting itself. 

To Fix this, modify the `ara/Makefile` by replacing -j32 with (number-of-cpu-threads-on-your-vm)-2 to avoid overutilization of context switching.

ara/Makefile line: 143, 158