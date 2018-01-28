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

GIT_VERSION := $(shell git describe --always --long --dirty='-xx')

.PHONYY: src/version.c src/version.c.tmp

SRC += version.c

Src/version.c.tmp:
	@{ \
		echo '/*'; \
		echo ' * DO NOT EDIT! This is a generated file.'; \
		echo ' */'; \
		echo 'const char *VERSION = "$(PRG)-$(GIT_VERSION)";'; \
	} > $@

Src/version.c: Src/version.c.tmp
	@if [ -f $@ ]; then \
		if [ "$$(cat $@ | md5sum )" != "$$(cat $@.tmp | md5sum)" ]; then \
			mv $@.tmp $@; \
		fi; \
	else \
		mv $@.tmp $@; \
	fi
	@rm -f $@.tmp

obj/version.o: Src/version.c
	-@echo "CC $@"
	-$(QQ)$(CC) $(CFLAGS) -E $(GEN_DEPS) -o /dev/null $<
	$(Q)$(CC) $(CFLAGS) -c -o $@ $<
