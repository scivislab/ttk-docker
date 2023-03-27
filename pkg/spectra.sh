SPECTRA_VERSION=1.0.1

require-pkgs \
    libeigen3-dev
    
fetch-src https://codeload.github.com/yixuan/spectra/tar.gz/v${SPECTRA_VERSION}

cmake-default