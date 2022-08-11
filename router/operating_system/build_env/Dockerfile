FROM alpine:latest

# Load the needed tools to generate an ISO
RUN apk add alpine-sdk build-base apk-tools alpine-conf busybox fakeroot syslinux xorriso squashfs-tools sudo
RUN apk add mtools dosfstools grub-efi

# Set up the abuild environment
RUN abuild-keygen -i -a -n
RUN git clone --depth=1 https://gitlab.alpinelinux.org/alpine/aports.git ~/aports

# Ensure everything is up to date
RUN apk update

# This is needed to enable file mounting
RUN touch /root/aports/scripts/mkimg.erl.sh