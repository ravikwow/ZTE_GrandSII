#!/bin/sh
PKG=framework-res.apk
FOLDER=system/framework
if [ -d "build" ]; then
    rm -R build
fi
if [ -d "dist" ]; then
    rm -R dist
fi
java -jar ../../sign/apktool.jar b ../$PKG
cd original
zip -r ../dist/$PKG ./*
cd ..
if [ ! -d "../../build/$FOLDER" ]; then
    mkdir -p ../../build/$FOLDER
fi
if [ -f "../../build/$FOLDER/$PKG" ]; then
    rm ../../build/$FOLDER/$PKG
fi
mv dist/$PKG ../../build/$FOLDER
if [ -d "build" ]; then
    rm -R build
fi
if [ -d "dist" ]; then
    rm -R dist
fi
