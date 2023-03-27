EMBREE_VERSION=4.0.1

require-pkgs \
    libtbb-dev

# get source code
fetch-src https://github.com/embree/embree/archive/v${EMBREE_VERSION}.tar.gz

cmake-default \
    -DCMAKE_BUILD_TYPE=Release  \
    -DEMBREE_TASKING_SYSTEM=TBB \
    -DEMBREE_ISPC_SUPPORT=ON \
    -DEMBREE_TUTORIALS=OFF

