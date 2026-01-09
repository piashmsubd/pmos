#!/bin/bash
# Script to concatenate DTBs for NX669J
# The stock boot.img contains multiple DTBs - we need to identify and use the correct one
# For Lahaina MTP devices (like NX669J), look for dtb_0.dtb which is "lahaina-mtp"

DTBO_DIR="${1:-/home/piash/nx669j/dtbo-unpack}"
OUTPUT="${2:-combined-dtb.img}"

# dtb_0.dtb = "Qualcomm Technologies, Inc. Lahaina MTP v2.1" - base device tree
# dtb_20.dtb, dtb_34.dtb, etc have nubia-specific nodes (ec_color, ps5013)

# For simplicity, concatenate the main nubia-specific DTBs
cat "$DTBO_DIR/dtb_0.dtb" \
    "$DTBO_DIR/dtb_3.dtb" \
    "$DTBO_DIR/dtb_20.dtb" \
    "$DTBO_DIR/dtb_34.dtb" \
    "$DTBO_DIR/dtb_41.dtb" \
    "$DTBO_DIR/dtb_42.dtb" \
    > "$OUTPUT"

echo "Combined DTB written to $OUTPUT"
ls -la "$OUTPUT"
