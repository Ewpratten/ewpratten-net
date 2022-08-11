#! /bin/sh
set -ex

ufw --force reset
ufw allow 22        # SSH
ufw allow 179/tcp   # BGP
