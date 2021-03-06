#!/bin/bash

function build_pkgs() {
    apt-get -yq install --no-install-recommends $@
    _build_pkgs="${_build_pkgs} $@"
}

function runtime_pkgs() {
    apt-get -yq install --no-install-recommends $@
    _install_pkgs="${_install_pkgs} $@"
}

function fetch_url() {
    curl -qL "$1"
}

configure_args=""


function conf_args() {
    configure_args+=" $@"
}

# build basename
what=$(basename $1 .sh)
echo "---- begin $what ----"

# update/initialize the apt cache 
apt-get -q update

# call build script
source $1

# remove build-only-packages
apt-get -yq purge ${_build_pkgs}

# also remove suggested / recommended packages that were installed as dependencies od build-only packages
apt-get -yq autoremove --purge -o APT::Autoremove::RecommendsImportant=0 -o APT::Autoremove::SuggestsImportant=0

# clear / remove apt cache
apt-get -yq clean
rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# remove script
rm -f $1

echo "---- end $what ----"
