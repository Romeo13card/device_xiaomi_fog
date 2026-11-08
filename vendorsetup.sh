#!/bin/bash
# Register fog's dependency manifest for PenguinOS's barista before lunch.
(
    fog_device_dir="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd -P)" || exit 1
    fog_android_top="$(gettop)" || exit 1
    [ -d "$fog_android_top/vendor/aospa/products" ] || exit 0
    fog_beans_link="$fog_android_top/vendor/aospa/products/fog/beans.xml"
    if [ -e "$fog_beans_link" ] || [ -L "$fog_beans_link" ]; then
        if [ "$(readlink -f -- "$fog_beans_link")" != "$fog_device_dir/beans.xml" ]; then
            echo "fog: refusing to replace existing PenguinOS beans: $fog_beans_link" >&2
            exit 1
        fi
    else
        mkdir -p -- "$(dirname -- "$fog_beans_link")" || exit 1
        ln -s -- "$fog_device_dir/beans.xml" "$fog_beans_link" || exit 1
    fi
)
