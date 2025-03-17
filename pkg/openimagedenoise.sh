OIDN_VERSION=2.3.2

require-pkgs \
    python3-minimal

fetch-src https://github.com/OpenImageDenoise/oidn/releases/download/v${OIDN_VERSION}/oidn-${OIDN_VERSION}.src.tar.gz

cmake-default \
    -DOIDN_APPS=OFF