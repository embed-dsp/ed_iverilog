
Compile and Install of the Icarus Verilog Tool
==============================================

This repository contains make file for easy compile and install of [Icarus Verilog](http://iverilog.icarus.com).
Icarus Verilog is a verilog compilation and simulation system.

Get Source Code
===============

## ed_iverilog
```bash
git clone https://github.com/embed-dsp/ed_iverilog.git
```

## Icarus Verilog
```bash
# Enter the ed_iverilog directory.
cd ed_iverilog

# Clone the Icarus Verilog git repository.
make clone

# Pull latest updates from the Icarus Verilog git repository.
make pull

# Edit the Makefile for selecting the Icarus Verilog source version.
vim Makefile
PACKAGE_VERSION = v10_2
```

Build
=====
```bash
# Checkout specific version and rebuild configure.
make prepare

# Configure source code for 64-bit compile (Default: M=64).
make configure
make configure M=64

# Configure source code for 32-bit compile.
make configure M=32

# Compile source code using 4 simultaneous jobs (Default: J=4).
make compile
make compile J=4
```

Install
=======
```bash
# Install build products.
sudo make install
```

The build products are installed in the following locations:
```bash
opt/
└── iverilog/
    └── iverilog-v10_2/
        ├── include/        # Include directory.
        │   ├── iverilog
        │       ...
        ├── linux_x86_64/   # 64-bit binaries and libraries for Linux
        │   ├── bin/
        │   │   ├── iverilog
        │   │   ├── vvp
        │   │   ...
        │   └── lib/        # Library directory.
        │       ├── libveriuser.a
        │       ├── libvpi.a
        │           ...
        ├── linux_x86/      # 32-bit binaries and libraries for Linux
        │   ├── bin/
        │   │   ├── iverilog
        │   │   ├── vvp
        │   │   ...
        │   └── lib/        # Library directory.
        │       ├── libveriuser.a
        │       ├── libvpi.a
        │           ...
        └── share/          # Architecture independent data files.
            ...
```

Notes
=====

This has been testes with the following Linux distributions and compilers:
* `Fedora-27 (64-bit)` and `gcc-7.2.1`
