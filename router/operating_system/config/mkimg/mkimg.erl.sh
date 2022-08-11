profile_erl() {
    # Load defaults
    profile_standard

    # Linux settings
    apks="$apks linux-firmware"

    # Add various APKs we need
    apks="$apks dropbear ip6tables ufw lighttpd mrtg net-tools bird neovim git wireguard-tools python3"
}