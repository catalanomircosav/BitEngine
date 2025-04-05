#!/bin/bash

# ANSI Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# --- Setup ---
echo -e "${BLUE}[INFO]${NC} Building solution..."
cd ..

# 2. Detect Compilers (GCC/Clang)
COMPILERS=("g++" "clang++")
SELECTED_COMPILER=""
for compiler in "${COMPILERS[@]}"; do
    if command -v "$compiler" &> /dev/null; then
        SELECTED_COMPILER="$compiler"
        break
    fi
done

if [ -z "$SELECTED_COMPILER" ]; then
    echo -e "${RED}[ERROR]${NC} No compiler found (install g++ or clang++)"
    exit 1
fi

# 3. Generate Makefiles with Premake
echo -e "${YELLOW}[STATUS]${NC} Generating build files..."

make

if [ $? -ne 0 ]; then
    echo -e "${RED}[ERROR]${NC} Failed to build!"
    exit 1
fi

# 6. Result
if [ $? -eq 0 ]; then
    echo -e "${GREEN}[SUCCESS]${NC} Build completed!"
    echo -e "Engine lib: ./bin/Release/libEngine.a"
    echo -e "Game binary: ./bin/Debug/Game"
else
    echo -e "${RED}[ERROR]${NC} Build failed!"
    exit 1
fi