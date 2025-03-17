#! /bin/bash

fetch-src https://github.com/ospray/ospray/archive/v3.2.0.tar.gz

cmake-default \
    -DOSPRAY_ENABLE_APPS=OFF

