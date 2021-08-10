#!/bin/bash

OS=""

detect_os() {
    case $(cat /etc/os-release | head -n 1) in
        *"BlackArch"*)
            OS="blackarch"
            ;;
        *"Kali"*)
            OS="kali"
            ;;
        *"Gentoo"*)
            OS="pentoo"
            ;;
        *"Parrot"*)
            OS="parrot"
            ;;
        *)
            OS="unknown"
            ;;
    esac
}

configure_interfaces() {
    os=$1
    case $os in
        "blackarch")
            ip link set wlan38 name wlan0
            ip link set wlan39 name wlan1
            ip link set wlan40 name wlan2
            ip link set wlan41 name wlan3
            ;;
        "kali")
            ip link set wlan30 name wlan0
            ip link set wlan31 name wlan1
            ip link set wlan32 name wlan2
            ip link set wlan33 name wlan3
            ;;
        "pentoo")
            ip link set wlan26 name wlan0
            ip link set wlan27 name wlan1
            ip link set wlan28 name wlan2
            ip link set wlan29 name wlan3
            ;;
        "parrot")
            ip link set wlan34 name wlan0
            ip link set wlan35 name wlan1
            ip link set wlan36 name wlan2
            ip link set wlan37 name wlan3
        ;;
    esac
}

add_helpers() {
    source helpers.sh
    echo "source helpers.sh" >> ~/.bashrc
}

main() {
    detect_os
    if [[ $OS == "unknown" ]]; then
        echo "[!] Unknown Container, bailing"
        exit 1
    fi

    configure_interfaces $OS
    add_helpers
}

main
