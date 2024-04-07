#!/usr/bin/env bash

set -e

NAME="${DPKG_MAINTSCRIPT_PACKAGE%-*}"
PACKAGE_NAME="${DPKG_MAINTSCRIPT_PACKAGE}"
CVERSION=$(dpkg-query -W -f='${Version}' "${PACKAGE_NAME}" | awk -F "-" '{print $1}')
ARCH=$(uname -m)

dkms_configure () {
    if [[ -f /usr/lib/dkms/common.postinst ]]; then
        /usr/lib/dkms/common.postinst "${NAME}" "${CVERSION}" "/usr/share/${PACKAGE_NAME}" "${ARCH}" "$2"
        return $?
    fi
}

case "$1" in
    configure) dkms_configure;;
    abort-upgrade|abort-remove|abort-deconfigure) ;;
    *)
        echo "postinst called with unknown argument '$1'" >&2
        exit 1
        ;;
esac

exit 0
