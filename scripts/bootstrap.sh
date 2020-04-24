#!/bin/sh -ex

GENTOO_REPO='/var/db/repos/gentoo'
mkdir --parents "$GENTOO_REPO"
wget -qO- https://github.com/gentoo-mirror/gentoo/archive/stable.tar.gz \
  | tar zx --directory "$GENTOO_REPO" --strip-component=1

export FEATURES="
  -sandbox
  -usersandbox
  -ipc-sandbox
  -pid-sandbox
  -mount-sandbox
  -network-sandbox
"
export EXTRA_CONFIG_PROTECT='/etc/resolv.conf /etc/hostname /etc/hosts'
export ALLOWED_USE=openmp
export MAKEOPTS="-j$(( "$(nproc)" ))"

patch -i "patches/allow-extra-config-protect.patch" "${GENTOO_REPO}/scripts/bootstrap.sh"
exec sh -ex "${GENTOO_REPO}/scripts/bootstrap.sh"
