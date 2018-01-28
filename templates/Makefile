#
# Copyright (c) 2018, Theodore A. Roth <troth@openavr.org>
# All rights reserved.
#
# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions are met:
#
# 1. Redistributions of source code must retain the above copyright notice,
#    this list of conditions and the following disclaimer.
# 2. Redistributions in binary form must reproduce the above copyright notice,
#    this list of conditions and the following disclaimer in the documentation
#    and/or other materials provided with the distribution.
# 3. Neither the name of OpenAVR nor the names of its contributors may be used
#    to endorse or promote products derived from this software without specific
#    prior written permission.
#
# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
# AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
# IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
# DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE
# FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
# DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
# SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
# CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
# OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
# OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
#

#
# Must set TOPDIR so that the build system has a reference point
# from which everything is accessed via relative paths.
# TOPDIR is an absolute path.
#
TOPDIR = $(CURDIR)
export TOPDIR

#
# Set the name of the project.
#
PRG ?= myproject

#
# Specify the Target details.
#  * Adjust appropriately for you target board.
#
TGT_FAMILY ?= STM32L0xx
TGT_ARCH   ?= cortex-m0plus

TGT_DEFS   += -DSTM32L052xx

#
# Path to Linker Script
#
LD_SCRIPT  ?= STM32L052C8Tx_FLASH.ld

#
# Make.mk is where all the magic happens.
#
include $(TOPDIR)/BuildSystem/Make.mk

#
# Optional: Add any rules you like (e.g. rules for flashing and debugging).
#
