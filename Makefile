
# Copyright (c) 2018 embed-dsp
# All Rights Reserved

# $Author:   Gudmundur Bogason <gb@embed-dsp.com> $
# $Date:     $
# $Revision: $


PACKAGE_NAME = iverilog

# Package version number (git master branch / git tag)
PACKAGE_VERSION = master
#PACKAGE_VERSION = v10_1_1
#PACKAGE_VERSION = v10_2

PACKAGE = $(PACKAGE_NAME)-$(PACKAGE_VERSION)

# ==============================================================================

# Set number of simultaneous jobs (Default 4)
ifeq ($(J),)
	J = 4
endif

# System and Machine.
SYSTEM = $(shell ./bin/get_system.sh)
MACHINE = $(shell ./bin/get_machine.sh)

# System configuration.
CONFIGURE_FLAGS =

# Compiler.
CXXFLAGS = -Wall -O2

# Linux system.
ifeq ($(SYSTEM),linux)
	# Compile for 32-bit on a 64-bit machine.
	ifeq ("$(MACHINE):$(M)","x86_64:32")
		MACHINE = "x86"
		CONFIGURE_FLAGS += --with-m32
	endif
	# Compiler.
	CXX = /usr/bin/g++
	# Installation directory.
	INSTALL_DIR = /opt
endif

# Cygwin system.
ifeq ($(SYSTEM),cygwin)
	# Compiler.
	CXX = /usr/bin/g++
	# Installation directory.
	INSTALL_DIR = /cygdrive/c/opt
endif

# MSYS2/mingw32 system.
ifeq ($(SYSTEM),mingw32)
	# Compiler.
	CXX = /mingw32/bin/g++
	# Installation directory.
	INSTALL_DIR = /c/opt
endif

# MSYS2/mingw64 system.
ifeq ($(SYSTEM),mingw64)
	# Compiler.
	CXX = /mingw64/bin/g++
	# Installation directory.
	INSTALL_DIR = /c/opt
endif

# Architecture.
ARCH = $(SYSTEM)_$(MACHINE)

# Installation directory.
PREFIX = $(INSTALL_DIR)/$(PACKAGE_NAME)/$(PACKAGE)
EXEC_PREFIX = $(PREFIX)/$(ARCH)


all:
	@echo "ARCH   = $(ARCH)"
	@echo "PREFIX = $(PREFIX)"
	@echo ""
	@echo "## Get Source Code"
	@echo "make clone"
	@echo "make pull"
	@echo ""
	@echo "## Build"
	@echo "make prepare"
	@echo "make configure [M=32]"
	@echo "make compile [J=...]"
	@echo ""
	@echo "## Install"
	@echo "[sudo] make install"
	@echo ""
	@echo "## Cleanup"
	@echo "make clean"
	@echo "make distclean"
	@echo ""


.PHONY: clone
clone:
	git clone https://github.com/steveicarus/iverilog.git


.PHONY: pull
pull:
	# Discard any local changes
	cd $(PACKAGE_NAME) && git checkout -- .
	
	# Checkout master branch
	cd $(PACKAGE_NAME) && git checkout master
	
	# ...
	cd $(PACKAGE_NAME) && git pull


.PHONY: prepare
prepare:
	# Discard any local changes
	cd $(PACKAGE_NAME) && git checkout -- .

	# Checkout specific version
	cd $(PACKAGE_NAME) && git checkout $(PACKAGE_VERSION)
	
	# Rebuild configure
	cd $(PACKAGE_NAME) && bash autoconf.sh


.PHONY: configure
configure:
	cd $(PACKAGE_NAME) && ./configure CXX=$(CXX) CXXFLAGS="$(CXXFLAGS)" --prefix=$(PREFIX) --exec_prefix=$(EXEC_PREFIX) $(CONFIGURE_FLAGS)


.PHONY: compile
compile:
	cd $(PACKAGE_NAME) && make -j$(J)


.PHONY: install
install:
	cd $(PACKAGE_NAME) && make install


.PHONY: clean
clean:
	cd $(PACKAGE_NAME) && make clean


.PHONY: distclean
distclean:
	cd $(PACKAGE_NAME) && make distclean
