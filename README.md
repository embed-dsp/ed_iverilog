
# Compile and Install of the Icarus Verilog Tool

This repository contains a **make** file for easy compile and install of [Icarus Verilog](http://iverilog.icarus.com).
Icarus Verilog is a verilog compilation and simulation system.

This **make** file can build the GTKWave tool on the following systems:
* Linux
* Windows
    * [MSYS2](https://www.msys2.org)/mingw64
    * [MSYS2](https://www.msys2.org)/mingw32
    * **FIXME**: [Cygwin](https://www.cygwin.com)


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
# Configure source code.
make configure

# Configure source code for 32-bit compile on a 64-bit system.
# FIXME: This fails on Fedora-28 64-bit
make configure M=32
```

```bash
# Clean any old build artifacts before compiling.
make clean
```

```bash
# Compile source code using 4 simultaneous jobs (Default).
make compile

# Compile source code using 2 simultaneous jobs.
make compile J=2
```


# Install

```bash
# Install build products.
# FIXME: linux, arm, ...
sudo make install

# Install build products.
# FIXME: mingw32, mingw64, ...
make install
```

The Icarus Verilog package installs correctly according to the
[GNU Coding Standards](https://www.gnu.org/prep/standards/standards.html).
The build products are installed in the following locations:

FIXME: linux, arm, ...
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

FIXME: windows 64-bit, mingw32, mingw64


# Tested System Configurations

System  | M=                | M=32  
--------|-------------------|-------------------
linux   | Fedora-28 64-bit  | Fedora-28 64-bit
mingw64 | Windows-10 64-bit |
mingw32 | Windows-10 64-bit |
cygwin  | **FIXME**         |

This has been testes with the following Linux distributions and compilers:
* `Fedora-27 (64-bit)`
    * `gcc-7.2.1`
    * `gcc-7.3.1`
* `Fedora-28 (64-bit)`
    * `gcc-8.1.1`


# Prerequisites

## Fedora-27 64-bit | Fedora-28 64-bit

```
dnf install gcc-c++
dnf install autoconf
dnf install gperf
dnf install flex
dnf install bison
```

## MSYS2
```
FIXME: ...
```

## Cygwin

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
