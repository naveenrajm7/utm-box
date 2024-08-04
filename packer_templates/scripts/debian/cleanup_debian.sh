#!/bin/sh -eux

# Ensure the script always returns 0
trap 'exit 0' EXIT

# https://wiki.debian.org/QEMU
dd if=/dev/zero of=/tmp/junk ; sync ; rm /tmp/junk