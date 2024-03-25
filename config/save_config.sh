#!/bin/bash

fail() {
    echo $1
    exit 1
}

store_dir() {
    if [ -z "$1" ] || [ -z "$2" ]; then
        echo ""
    fi

    mkdir -p "$1" || fail "Failed to create dir $1"
    mkdir -p "$2" || fail "Failed to create dir $2"

    rsync -a --delete "$1/" "$2/" || fail "Failed to sync $1 and $2"
}

store_dir ~/.config/nvim ./nvim

