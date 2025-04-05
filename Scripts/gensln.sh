#!/bin/bash

# ANSI Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m' # No Color

# Move to root directory (parent of Scripts/)
cd ..

# Check if premake5 exists
if [ ! -f "Tools/Premake/premake5.linux" ]; then
  echo -e "${RED}[ERROR]${NC} 'premake5.linux' not found."
  exit 1
fi

# Check for premake5.lua
if [ ! -f "premake5.lua" ]; then
  echo -e "${RED}[ERROR]${NC} 'premake5.lua' not found in root directory."
  exit 1
fi

# Run premake5 (using local version)
echo -e "${GREEN}[INFO]${NC} Running premake5..."
chmod +x Tools/Premake/premake5.linux  # Ensure it's executable
./Tools/Premake/premake5.linux gmake

if [ $? -eq 0 ]; then
  echo -e "${GREEN}[SUCCESS]${NC} Makefile configuration generated"
else
  echo -e "${RED}[ERROR]${NC} Premake failed."
  exit 1
fi