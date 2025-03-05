#!/bin/bash

# Set target directory
TARGET_DIR="/tmp/third-party"

# Change to target directory
cd "$TARGET_DIR" || exit 1

# Find modules with Makefiles
for module in $(find ./ -name "Makefile" -printf "%h\n" | sort -u); do
    # Change to module directory
    cd "$TARGET_DIR/$module" || { echo "Error: Could not cd to $module"; continue; }

    # Build module
    echo "Building $module..."
    make || { echo "Error: Build failed for $module"; continue; }

    # Clean up
    echo "Cleaning up $module..."
    make clean || echo "Error: Cleanup failed for $module"
done#!/bin/bash

cd /tmp/third-party
for module in `find ./ | grep "makefile" | awk -F'/makefile' '{print $1}'`
do
    cd /tmp/third-party
    cd $module
    make
    make clean
done
