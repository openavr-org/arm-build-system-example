==========================================
 OpenAVR Arm Build System Example Project
==========================================

This project provides an example of how to use the OpenAVR Arm Build System.

* https://github.com/openavr-org/arm-build-system

Using Git Subtree to Manage Build System Subordinate Repo
=========================================================

The upstream ``arm-build-system`` project was integrated into this project with
the following commands::

    $ git clone git://github.com/openavr-org/arm-build-system-example
    $ cd arm-build-system-example
    $ git remote add arm-build-system git://github.com/openavr-org/arm-build-system
    $ git subtree add --prefix BuildSystem arm-build-system master

To pull upstream changes from ``arm-build-system`` into this project, we use
the following command::

    $ git subtree pull --prefix BuildSystem arm-build-system master
