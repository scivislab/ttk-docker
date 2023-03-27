MESA_VERSION=23.0.0

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
fetch-src https://gitlab.freedesktop.org/mesa/mesa/-/archive/mesa-${MESA_VERSION}/mesa-mesa-${MESA_VERSION}.tar.gz

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
meson build \
    -Dbuildtype=${buildtype}        \
    -Dosmesa=true   			    \
    -Dplatforms= 				    \
    -Dgallium-drivers=swrast	    \
    -Dglx=disabled				    \
    -Dgles2=false				    \
    -Dgles1=false				    \
    -Dllvm=enabled				    \
    -Ddri-drivers=				    \
    -Dvulkan-drivers=			    \
    -Dshared-glapi=true

# build
ninja -C build 

# install
ninja -C build install

