#!/bin/sh
for pkg in ./packages-res/*; do
    java -jar ./sign/apktool.jar if $pkg
done
if [ -d "build" ]; then
    rm -R build
fi
for pkg in ./packages/*; do
    cd $pkg
    ./build.sh
    cd ../..
done
