#!/usr/bin/env bash

set -euxCo pipefail

# SYSTEM_NAME=$1
SYSTEM_NAME=asus-laptop

if [ "$SYSTEM_NAME" != "asus-laptop" ]; then
    echo "Invalid value for system name: '$1'" >&2
    exit 1
fi

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

nixos-rebuild switch --sudo --flake $SCRIPT_DIR\#$SYSTEM_NAME
