
Compile and Install of the Icarus Verilog Tool
==============================================

This repository contains make file for easy compile and install of the Icarus Verilog Tool.
Icarus Verilog is a verilog compilation and simulation system.

Get tool and source code
========================

## ed_iverilog
```bash
git clone https://github.com/embed-dsp/ed_iverilog.git
```

## Icarus Verilog Source
```bash
# Enter the ed_iverilog directory.
cd ed_iverilog

# Clone Icarus Verilog repository.
make clone

# Pull latest updates from Icarus Verilog repository.
make pull
```

Build
=====
```bash
# Checkout specific version and rebuild configure.
make prepare

# Configure source code.
make configure

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
opt
└── iverilog
    └── iverilog-v10_2
        ├── include         # Include directory.
        │   ├── iverilog
        │       ...
        ├── linux_x86_64    # 64-bit binaries and libraries for Linux
        │   ├── bin
        │   │   ├── iverilog
        │   │   ├── vvp
        │   │   ...
        │   └── lib         # Library directory.
        │       ├── libveriuser.a
        │       ├── libvpi.a
        │           ...
        ├── linux_x86       # 32-bit binaries and libraries for Linux
        │   ├── bin
        │   │   ├── iverilog
        │   │   ├── vvp
        │   │   ...
        │   └── lib         # Library directory.
        │       ├── libveriuser.a
        │       ├── libvpi.a
        │           ...
        └── share           # ...
            ...
```

Notes
=====

This has been testes with the following Linux distributions and compilers:
* `Fedora-27 (64-bit)` and `gcc-7.2.1`
