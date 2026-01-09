#!/bin/sh
set -euo pipefail
set -x

# Flash vbmeta with verification disabled (unlocked bootloader assumed)
pmbootstrap flasher flash_vbmeta --disable-verity --disable-verification

# Flash DTBO and vendor_boot (contains vendor ramdisk + dtb if rebuilt)
pmbootstrap flasher flash_dtbo
pmbootstrap flasher flash_vendor_boot

# Flash kernel (boot.img) and rootfs to userdata
pmbootstrap flasher flash_kernel
pmbootstrap flasher flash_rootfs --partition userdata
