#!/bin/sh

set -e

DKMS_PACKAGE_NAME="${DPKG_MAINTSCRIPT_PACKAGE}"
DKMS_NAME="${DPKG_MAINTSCRIPT_PACKAGE%-*}"
DKMS_VERSION=$(dpkg-query -W -f='${Version}' "$DKMS_PACKAGE_NAME" | awk -F "-" '{print $1}')

case "$1" in
    remove|upgrade|deconfigure)
        if [ "$(dkms status -m $DKMS_NAME -v $DKMS_VERSION)" ]; then
            dkms remove -m $DKMS_NAME -v $DKMS_VERSION --all
        fi
    ;;
esac

exit 0
