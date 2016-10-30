#!/bin/sh
if [ -d "build" ]; then
    rm -R build
fi
for pkg in ./packages/*; do
    cd $pkg
    ./build.sh
    cd ../..
done