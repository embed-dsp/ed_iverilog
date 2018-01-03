
# Copyright (c) 2018 embed-dsp
# All Rights Reserved

# $Author:   Gudmundur Bogason <gb@embed-dsp.com> $
# $Date:     $
# $Revision: $

# Package version number (git TAG)
PACKAGE_VERSION = v10_2

# Package name and version number
PACKAGE = iverilog-$(PACKAGE_VERSION)


# Select between 32-bit or 64-bit machine (Default 64-bit)
ifeq ($(M),)
	M = 64
endif


# Set number of simultaneous jobs (Default 4)
ifeq ($(J),)
	J = 4
endif


CXX = /usr/bin/g++
# CC = /usr/bin/gcc

PREFIX = /opt/iverilog/$(PACKAGE)

ifeq ($(M), 64)
	CXXFLAGS = "-Wall -O2 -m64"
	# CFLAGS = "-Wall -O2 -m64"
	EXEC_PREFIX = $(PREFIX)/linux_x86_64
else
	CXXFLAGS = "-Wall -O2 -m32"
	# CFLAGS = "-Wall -O2 -m32"
	EXEC_PREFIX = $(PREFIX)/linux_x86
endif


all:
	@echo ""
	@echo "## First time"
	@echo "make clone              # Get openocd source from git repo"
	@echo "make prepare            # Checkout specific version"
	@echo "make configure [M=...]"
	@echo "make compile [J=...]"
	@echo "sudo make install"
	@echo ""
	@echo "## Any other time"
	@echo "make distclean          # Clean all build products"
	@echo "make pull               # ..."
	@echo "make prepare            # Checkout specific version"
	@echo "make configure [M=...]"
	@echo "make compile [J=...]"
	@echo "sudo make install"
	@echo ""


.PHONY: clone
clone:
	git clone https://github.com/steveicarus/iverilog.git


.PHONY: pull
pull:
	# Discard any local changes
	cd iverilog && git checkout -- .
	
	# Checkout master branch
	cd iverilog && git checkout master
	
	# ...
	cd iverilog && git pull


.PHONY: prepare
prepare:
	# Checkout specific version
	cd iverilog && git checkout $(PACKAGE_VERSION)
	
	# Rebuild configure
	cd iverilog && bash autoconf.sh


.PHONY: configure
configure:
	cd iverilog && ./configure CXX=$(CXX) CXXFLAGS=$(CXXFLAGS) --prefix=$(PREFIX) --exec_prefix=$(EXEC_PREFIX)


.PHONY: compile
compile:
	cd iverilog && make -j$(J)


.PHONY: install
install:
	-cd iverilog && make install


.PHONY: clean
clean:
	cd iverilog && make clean


.PHONY: distclean
distclean:
	cd iverilog && make distclean
