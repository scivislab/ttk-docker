TBB_VERSION=2022.0.0

# get source code
fetch-src https://github.com/uxlfoundation/oneTBB/archive/refs/tags/v${TBB_VERSION}.tar.gz

cmake-default \
    -DTBB_TEST=OFF

