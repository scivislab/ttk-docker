fetch-src https://github.com/ospray/ospray/archive/v2.11.0.tar.gz

cmake-default \
    -DCMAKE_BUILD_TYPE=Release \
    -DOSPRAY_ENABLE_APPS=OFF \
    ..
