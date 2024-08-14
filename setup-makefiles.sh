#!/bin/bash
#
# SPDX-FileCopyrightText: 2016 The CyanogenMod Project
# SPDX-FileCopyrightText: 2017-2024 The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

set -e

DEVICE=fog
VENDOR=xiaomi
INITIAL_COPYRIGHT_YEAR=2022

# Load extract_utils and do some sanity checks
MY_DIR="${BASH_SOURCE%/*}"
if [[ ! -d "${MY_DIR}" ]]; then MY_DIR="${PWD}"; fi

ANDROID_ROOT="${MY_DIR}/../../.."

export TARGET_ENABLE_CHECKELF=true

HELPER="${ANDROID_ROOT}/tools/extract-utils/extract_utils.sh"
if [ ! -f "${HELPER}" ]; then
    echo "Unable to find helper script at ${HELPER}"
    exit 1
fi
source "${HELPER}"

function vendor_imports() {
    cat <<EOF >>"$1"
          "device/xiaomi/fog",
          "hardware/google/interfaces",
          "hardware/google/pixel",
          "hardware/lineage/interfaces/power-libperfmgr",
          "hardware/qcom-caf/bootctrl",
          "hardware/qcom-caf/common/libqti-perfd-client",
          "hardware/qcom-caf/sm8250",
          "hardware/qcom-caf/wlan",
          "hardware/xiaomi",
          "vendor/qcom/opensource/commonsys/display",
          "vendor/qcom/opensource/commonsys-intf/display",
          "vendor/qcom/opensource/data-ipa-cfg-mgr-legacy-um",
          "vendor/qcom/opensource/dataservices",
          "vendor/qcom/opensource/display"
EOF
}

# Initialize the helper
setup_vendor "${DEVICE}" "${VENDOR}" "${ANDROID_ROOT}"

# Copyright headers and guards
write_headers "${DEVICE}"

# The standard common blobs
write_makefiles "${MY_DIR}/proprietary-files.txt" true

# Finish
write_footers
