#!/bin/sh -eux

# Ensure the script always returns 0
trap 'exit 0' EXIT

# https://wiki.debian.org/QEMU
# This will be slow in x86_64 VMs and result in increased image size
# dd if=/dev/zero of=/tmp/junk ; sync ; rm /tmp/junk