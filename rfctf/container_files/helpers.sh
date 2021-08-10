#!/bin/bash

function setmac() {
    iface=$1
    mac=$2

    ifconfig $iface down
    macchanger $iface -m $2
    ifconfig $iface up
}

function cleanup() {
    cd ~
    mkdir -p Archive
    date=$(date +%Y-%m-%d-%H-%M)
    tar -pczf Archive/captures-$date.tar.gz Captures
    rm -rf Captures/*
    cd -
}

function sniffap() {
    name=$1
    ap=$2
    channel=$3
    iface=$4
    next=$(($(ls ~/Captures/ | grep $name | wc -l)+1))

    airodump-ng --band abg --channel $channel --bssid $ap -w ~/Captures/$name-$next $iface
}

