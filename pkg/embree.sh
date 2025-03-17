EMBREE_VERSION=4.3.3

require-pkgs \
    libtbb-dev

# get source code
fetch-src https://github.com/embree/embree/archive/v${EMBREE_VERSION}.tar.gz

cmake-default \
    -DEMBREE_ISPC_SUPPORT=ON    \
    -DEMBREE_TASKING_SYSTEM=TBB \
    -DEMBREE_TUTORIALS=OFF

