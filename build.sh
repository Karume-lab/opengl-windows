#!/bin/bash

echo "Building the project..."
mingw32-make all

if [ $? -eq 0 ]; then
    echo "Build successful! Running the program..."
else
    echo "Build failed!"
    exit 1
fi
