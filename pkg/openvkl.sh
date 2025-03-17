require-pkgs \
    libtbb-dev

fetch-src https://github.com/openvkl/openvkl/archive/v2.0.1.tar.gz

cmake-default \
    -DBUILD_BENCHMARKS=OFF        \
    -DBUILD_EXAMPLES=OFF          \
    -DBUILD_TESTING=OFF
