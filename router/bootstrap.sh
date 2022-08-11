#! /bin/sh
set -ex

# Ensure all needed deps are installed
apk add dropbear ip6tables ufw lighttpd mrtg net-tools bird neovim git wireguard-tools python3

# Clone the network repo into /etc
git clone https://github.com/ewpratten/ewpratten-net /etc/ewpratten-net

# Enable UFW
ufw enable
rc-update add ufw