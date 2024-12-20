#!/bin/ksh -eux

# allow vagrant user to run commands as root without a password
echo 'permit nopass vagrant' >> /etc/doas.conf