#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

REPO=$1
TARGET="$(realpath "$2")"
CLONE="$TARGET/tmp"

mkdir -p "$CLONE"

# build rust lib
git clone "$REPO" "$CLONE"
cd "$CLONE"
cargo build --release

# copy rlib artifacts to parent directory
find ./target/release/deps -name "*.rlib" -exec cp -pfr {} "$TARGET" \;

rm -rf "$CLONE"
