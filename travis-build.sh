#!/bin/bash

apt -qq update
apt -qq -yy install equivs curl git

### Install Dependencies
DEBIAN_FRONTEND=noninteractive apt-get --yes install devscripts lintian build-essential automake autotools-dev keyboard-configuration console-setup
mk-build-deps -i -t "apt-get --yes" -r

### Build Deb
mkdir source
mv ./* source/ # Hack for debuild
cd source
debuild -b -uc -us