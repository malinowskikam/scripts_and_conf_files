#!/bin/bash

fail() {
    echo $1
    return 1
}

load_dir() {
    if [ -z "$1" ] || [ -z "$2" ]; then
        fail "Missing args in load_dir"
    fi

    mkdir -p "$1" || fail "Failed to create dir $1"
    mkdir -p "$2" || fail "Failed to create dir $2"

    mkdir -p "./.backup/$2/" || fail "Failed to create backup dir"
    rsync -a --delete "$1/" "./.backup/$2/" || fail "Failed to create backup"
    rsync -a --delete "$2/" "$1/" || fail "Failed to sync $2 to $1"
}

load_dir ~/.config/nvim .nvim

