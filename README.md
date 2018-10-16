
# Compile and Install of the Icarus Verilog Tool

This repository contains make file for easy compile and install of [Icarus Verilog](http://iverilog.icarus.com).
Icarus Verilog is a verilog compilation and simulation system.


# Prerequisites

## MinGW-W64
```
FIXME: ...
```

## Cygwin 32-bit / 64-bit

```
make
gcc-g++
autoconf
gperf
flex
bison
zlib
libbz2
```

## Fedora-27 64-bit | Fedora-28 64-bit

```
dnf install gcc-c++
dnf install autoconf
dnf install gperf
dnf install flex
dnf install bison
```


# Get Source Code

## ed_iverilog

```bash
git clone https://github.com/embed-dsp/ed_iverilog.git
```

## Icarus Verilog

```bash
# Enter the ed_iverilog directory.
cd ed_iverilog

# FIXME: Only first time
# Clone the Icarus Verilog git repository.
make clone

# FIXME: Any other time
# Pull latest updates from the Icarus Verilog git repository.
make pull
```

```bash
# FIXME: Check for available versions
cd iverilog
git tag

# Edit the Makefile for selecting the Icarus Verilog source version.
vim Makefile
PACKAGE_VERSION = v10_2
```


# Build

```bash
# Checkout specific version and rebuild configure.
make prepare
```

```bash
# Configure source code for 64-bit compile (Default: M=64).
make configure
make configure M=64

# Configure source code for 32-bit compile.
make configure M=32
```

```bash
# Clean any old build artifacts before compiling.
make clean
```

```bash
# Compile source code using 4 simultaneous jobs (Default: J=4).
make compile
make compile J=4
```


# Install

```bash
# Install build products.
sudo make install
```

The Icarus Verilog package installs correctly according to the
[GNU Coding Standards](https://www.gnu.org/prep/standards/standards.html).
The build products are installed in the following locations:

```bash
opt/
└── iverilog/
    └── iverilog-v10_2/     # prefix:
        ├── include/        # includedir: Include directory.
        │   ├── iverilog
        │       ...
        ├── linux_x86_64/   # exec_prefix: 64-bit binaries and libraries for Linux
        │   ├── bin/        # bindir:
        │   │   ├── iverilog
        │   │   ├── vvp
        │   │   ...
        │   └── lib/        # libdir: Library directory.
        │       ├── libveriuser.a
        │       ├── libvpi.a
        │           ...
        ├── linux_x86/      # exec_prefix: 32-bit binaries and libraries for Linux
        │   ├── bin/        # bindir:
        │   │   ├── iverilog
        │   │   ├── vvp
        │   │   ...
        │   └── lib/        # libdir: Library directory.
        │       ├── libveriuser.a
        │       ├── libvpi.a
        │           ...
        └── share/          # datadir: Architecture independent data files.
            ...
```


# Notes

This has been testes with the following Linux distributions and compilers:
* `Fedora-27 (64-bit)`
    * `gcc-7.2.1`
    * `gcc-7.3.1`
* `Fedora-28 (64-bit)`
    * `gcc-8.1.1`
