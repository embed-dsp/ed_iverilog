
# Copyright (c) 2018 embed-dsp
# All Rights Reserved

# $Author:   Gudmundur Bogason <gb@embed-dsp.com> $
# $Date:     $
# $Revision: $


PACKAGE_NAME = iverilog

# Package version number (git master branch / git tag)
# PACKAGE_VERSION = master
PACKAGE_VERSION = v10_2

PACKAGE = $(PACKAGE_NAME)-$(PACKAGE_VERSION)

# Build for 32-bit or 64-bit (Default)
ifeq ($(M),)
	M = 64
endif

ifeq ($(M),64)
	# CXXFLAGS = -Wall -O2 -m64
	CONFIGURE_FLAGS =
else
	# CXXFLAGS = -Wall -O2 -m32
	CONFIGURE_FLAGS = --with-m32
endif

CXX = /usr/bin/g++

# Architecture.
ARCH = $(shell ./bin/get_arch.sh $(M))

# Installation.
PREFIX = /opt/iverilog/$(PACKAGE)
EXEC_PREFIX = $(PREFIX)/$(ARCH)

# Set number of simultaneous jobs (Default 4)
ifeq ($(J),)
	J = 4
endif


all:
	@echo ""
	@echo "## Get Source Code"
	@echo "make clone"
	@echo "make pull"
	@echo ""
	@echo "## Build"
	@echo "make prepare"
	@echo "make configure [M=...]"
	@echo "make compile [J=...]"
	@echo ""
	@echo "## Install"
	@echo "sudo make install"
	@echo ""
	@echo "## Cleanup"
	@echo "make distclean"
	@echo "make clean"
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
