==========================
 OpenAVR Arm Build System
==========================

The goal of this project is to provide a set of Makefile fragments and support
scripts that make if very easy to build firmware images for ARM Cortex-M class
processors.

Project Design Requirements
---------------------------

* Simple to set up a project.
* Simple to add files to a project.
* Parallel builds by default.
* Does not use recursive make.
* Automatic and robust dependency generation.
* Support for putting source into (static) library archives and automatic
  linking with those archives.
* Automatic embedding of version into binary generated from GIT tags.
* Provide enough flexibility to handle moderately complex builds easily.

Dependencies
============

This build system uses GNUMake. Other ``make`` programs may work, but the
author has only used and tested with GNUMake.

A tool chain needs to be installed to compile your code into a binary. The
author of this project uses and tests with the GNU Arm Embedded Toolchain for
which pre-built binaries for multiple platforms can be downloaded from:

* https://developer.arm.com/open-source/gnu-toolchain/gnu-rm

The author uses Ubuntu based systems for development and installs the toolchain
via the PPA:

* https://launchpad.net/~team-gcc-arm-embedded/+archive/ubuntu/ppa

Quick Start Usage
=================

Setting up a new project to use this build system should be as simple as the
following::

    $ cd ${WORK_DIR}
    $ mkdir my-project
    $ cd my-project
    $ git clone git://github.com/openavr-org/arm-build-system BuildSystem

    $ mkdir -p include src

    $ cp BuildSystem/templates/Sources.mk .
    $ cp Buildsystem/templates/Makefile .

    $ edit Makefile                 # Tweak for your project.
    $ edit Sources.mk               # Tweak for your project.

    $ make

Most of the work should be in tweaking the ``Makefile`` for your needs.

**TODO:** Write a GUI tool (python/tkinter script) to generate the
``Sources.mk`` and ``Makefile`` files.

Detailed Usage
==============

**TODO:**

Makefile User Variables
-----------------------

**TODO:** Provide table of variables that can/must be set in ``Makefile`` and
``Sources.mk``.

Example Project
===============

An example project that uses this build system is available on GitHub:

* https://github.com/openavr-org/arm-build-system-example
