MESA_VERSION=24.2.3

# install packges required for build
require-pkgs \
    pkg-config      \
	python3-dev		\
	python3-mako	\
	llvm-dev		\
    meson         	\
	zlib1g-dev		\
	libdrm-dev		\
	gettext			\
	bison			\
	flex

# fetch and unpack source
curl -qL http://archive.ubuntu.com/ubuntu/pool/main/m/mesa/mesa_${MESA_VERSION}.orig.tar.xz | tar xJ --strip-components 1


# determine build type from CMake default
case ${CMAKE_BUILD_TYPE,,} in 
    relwithdebinfo)
        buildtype='debugoptimized'
        ;;
    minsizerel)
        buildtype='minsize'
        ;;
    *)
        buildtype=${CMAKE_BUILD_TYPE,,}
        ;;
esac

# configure 
meson setup                         \
    --buildtype=${buildtype}        \
    -Dplatforms=                    \
    -Dosmesa=true                   \
    -Dgallium-drivers=llvmpipe      \
    -Dglx=disabled                  \
    -Dllvm=enabled                  \
    -Dvulkan-drivers=               \
    -Dgles2=disabled                \
    -Dgles1=disabled                \
    -Degl=disabled                  \
    -Dshared-glapi=disabled         \
    build

# build
ninja -C build 

# install
ninja -C build install

