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

#extract crate name from manifest file
crate=""
MANIFEST="$(find "$CLONE" -name "Cargo.toml" | head -n 1)"
REGEX='^name = ".*"$'
while read -r line; do
    if [[ "$line" =~ $REGEX ]]; then
        crate=$(echo "$line" | cut -d'"' -f 2)
    fi
done <"$MANIFEST"

# copy rlib artifacts to parent directory
mkdir -p "$TARGET/$crate"
find ./target/release/deps -name "*.rlib" -exec cp -pfr {} "$TARGET/$crate" \;

rm -rf "$CLONE"
