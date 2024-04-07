#!/usr/bin/env bash

set -e

NAME="${DPKG_MAINTSCRIPT_PACKAGE%-*}"
PACKAGE_NAME="${DPKG_MAINTSCRIPT_PACKAGE}"
CVERSION=$(dpkg-query -W -f='${Version}' "${PACKAGE_NAME}" | awk -F "-" '{print $1}')

case "$1" in
    remove|upgrade|deconfigure)
        if [[ -n $(dkms status -m "${NAME}") ]]; then
            dkms remove -m "${NAME}" -v "${CVERSION}" --all
        fi
        ;;

    failed-upgrade)
        ;;

    *)
        echo "prerm called with unknown argument '$1'" >&2
        exit 1
        ;;
esac

exit 0
