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

Most of the work should be in tweaking the ``Makefile`` for your needs and
adding your source directories and files to the ``Sources.mk`` file.

**TODO:** Write a GUI tool (python/tkinter script) to generate the
``Sources.mk`` and ``Makefile`` files.

Detailed Usage
==============

**TODO:**

There are essentially five ways you can use this project as your build system:

* Use ``git-subtree`` to integrate this project into yours.
* Use ``git-submodule`` to integrate this project into yours.
* Use `google-repo <https://code.google.com/archive/p/git-repo/>`_. to manage
  multiple git repositories via a manifest file.
* Clone this project somewhere, copy the relevant files into your project
  and commit them. It's up to you to manually track up stream changes if
  you want to pull in updates. This is effectively what ``git-subtree`` does,
  but it allows you to still track up stream changes for the build system.
* Clone this project into yours as shown above. The downside here is that the
  build system files are not a part of your project which is not desirable.

Makefile User Variables
-----------------------

**TODO:** Provide table of variables that can/must be set in ``Makefile`` and
``Sources.mk``.

Single Application Project Layout
---------------------------------

Here is a typical layout for a project which builds a single application
binary::

    $ tree single-app-example/
    single-app-example/
    ├── BuildSystem
    │   ├── Make.mk
    │   └── Version.mk
    ├── Makefile
    ├── Sources.mk
    └── src

The application ``Makefile`` would need to contain the following
boiler plate code near the beginning of the file::

    PRG        ?= myproject
    TGT_FAMILY ?= STM32F0xx
    TGT_ARCH   ?= cortex-m0
    TGT_DEFS   += -DSTM32F091xC

    include BuildSystem/Make.mk

Multi Application Project Layout
--------------------------------

Here is a typical layout for a project which builds multiple application
binaries::

    $ tree multi-app-example/
    multi-app-example/
    ├── BuildSystem
    │   ├── Make.mk
    │   └── Version.mk
    ├── app1
    │   ├── Makefile
    │   ├── Sources.mk
    │   └── src
    └── app2
        ├── Makefile
        ├── Sources.mk
        └── src

The ``app1/Makefile`` would have the following boiler plate code at the
beginning of the file::

    PRG        ?= app1
    TGT_FAMILY ?= STM32F0xx
    TGT_ARCH   ?= cortex-m0
    TGT_DEFS   += -DSTM32F091xC

    include ../BuildSystem/Make.mk

While the ``app2/Makefile`` would have the following boiler plate code at the
beginning of the file::

    PRG        ?= app2
    TGT_FAMILY ?= STM32F0xx
    TGT_ARCH   ?= cortex-m0
    TGT_DEFS   += -DSTM32F091xC

    include ../BuildSystem/Make.mk

It is entirely reasonable that the ``TGT_*`` variables could be different for
each application if the binaries are to be loaded onto completely different
hardward with different processors.

Example Project
===============

An example project that uses this build system is available on GitHub:

* https://github.com/openavr-org/arm-build-system-example

The example project uses ``git-subtree`` to pull the ``arm-build-system`` into
the project.
