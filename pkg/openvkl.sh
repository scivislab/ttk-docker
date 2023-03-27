OPENVKL_VERSION=1.3.2

fetch-src https://github.com/openvkl/openvkl/archive/refs/tags/v${OPENVKL_VERSION}.tar.gz

cmake-default \
    -DBUILD_BENCHMARKS=OFF        \
    -DBUILD_EXAMPLES=OFF          \
    -DBUILD_TESTING=OFF
