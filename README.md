
# Compile and Install of the Icarus Verilog Tool

This repository contains a **make** file for easy compile and install of [Icarus Verilog](https://github.com/steveicarus/iverilog).
Icarus Verilog is a verilog compilation and simulation system.

This **make** file can build the icarus verilog tool on the following systems:
* Linux
* Windows
    * [MSYS2](https://www.msys2.org)/mingw64
    * [MSYS2](https://www.msys2.org)/mingw32


# Get Source Code

## ed_iverilog
Get the code for this component to a local directory on your PC.

```bash
git clone https://github.com/embed-dsp/ed_iverilog.git
```

## Icarus Verilog
Get the code for Icarus Verilog.

```bash
# Enter the ed_iverilog directory.
cd ed_iverilog
```

**NOTE**: If this is the first time Icarus Verilog is built, then ...
```bash
# Clone the Icarus Verilog git repository.
make clone
```

Otherwise just pull the latest updates ...
```bash
# Pull latest updates from the Icarus Verilog git repository.
make pull
```

Edit the **Makefile** for selecting the Icarus Verilog source version.
```bash
# Edit Makefile ...
vim Makefile

# ... and set the Icarus Verilog source version.
PACKAGE_VERSION = master
# PACKAGE_VERSION = v12_0
```


# Build

```bash
# Checkout specific version and rebuild configure.
make prepare
```

```bash
# Configure source code.
make configure
```

```bash
# Clean any old build artifacts before compiling.
make clean
```

```bash
# Compile source code using 8 simultaneous jobs (Default).
make compile
```


# Install

## Linux

```bash
# Install build products.
sudo make install
```

The Icarus Verilog package installs correctly according to the
[GNU Coding Standards](https://www.gnu.org/prep/standards/standards.html).
The build products are installed in the following locations:

```bash
/opt/
└── iverilog/
    └── iverilog-master/    # prefix:
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
        └── share/          # datadir: Architecture independent data files.
            ...
```

## Windows: MSYS2/mingw64 & MSYS2/mingw32

```bash
# Install build products.
make install
```

The Icarus Verilog package installs correctly according to the
[GNU Coding Standards](https://www.gnu.org/prep/standards/standards.html).
The build products are installed in the following locations:

```bash
/c/opt/
└── iverilog/
    └── ...
```


# Tested System Configurations

The following system configurations have been tested.

System  | OS                |
--------|-------------------|
linux   | Fedora-40 64-bit 
mingw64 | Windows-10 64-bit
mingw32 | Windows-10 64-bit


# Prerequisites

## Fedora-40 64-bit

```
sudo dnf install gcc-c++
sudo dnf install autoconf
sudo dnf install gperf
sudo dnf install flex
sudo dnf install bison
```
