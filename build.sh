#!/bin/bash
# Build NAAb from submodule for naab-bolo
set -e

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
NAAB_DIR="$SCRIPT_DIR/naab"

if [ ! -d "$NAAB_DIR/CMakeLists.txt" ] 2>/dev/null; then
    echo "Initializing NAAb submodule..."
    cd "$SCRIPT_DIR"
    git submodule update --init --recursive
fi

if [ ! -d "$NAAB_DIR" ]; then
    echo "Error: NAAb submodule not found. Run: git submodule update --init --recursive"
    exit 1
fi

echo "Building NAAb..."
mkdir -p "$NAAB_DIR/build"
cd "$NAAB_DIR/build"
cmake .. -DCMAKE_BUILD_TYPE=Release
make naab-lang -j$(nproc 2>/dev/null || echo 4)

echo ""
echo "NAAb built successfully!"
echo "Binary: $NAAB_DIR/build/naab-lang"
