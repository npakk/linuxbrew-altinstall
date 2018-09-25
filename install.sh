#!/bin/sh
set -e
umask 022
exec ruby -e "`curl -fsSL https://raw.githubusercontent.com/z80oolong/linuxbrew-altinstall/master/install`" "$@"
