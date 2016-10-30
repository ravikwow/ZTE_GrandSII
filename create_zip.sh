#!/bin/sh
if [ ! -d "build" ]; then
    mkdir build
fi
if [ ! -d "additional_files" ]; then
    mkdir additional_files
fi
if [ -f "update.zip" ]; then
    rm update.zip
fi
cd zip_data
zip -r ../update.zip ./*
cd ../build
zip -r ../update.zip ./*
cd ../additional_files
zip -r ../update.zip ./*
cd ..
if [ -f "miui.zip" ]; then
    rm miui.zip
fi
java -jar ./sign/signapk.jar ./sign/testkey.x509.pem ./sign/testkey.pk8 update.zip miui.zip
if [ -f "update.zip" ]; then
    rm update.zip
fi
