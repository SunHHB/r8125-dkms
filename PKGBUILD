# Maintainer: Evine Deng <evinedeng@hotmail.com>

_pkgname=r8125
pkgname="${_pkgname}-dkms"
pkgver=9.016.00
pkgrel=1
priority=optional
section=non-free/kernel
url="https://www.realtek.com/Download/List?cate_id=584"
pkgdesc="dkms source for the r8125 network driver"
license=('GPL-2.0-or-later')
arch=('all')
depends=('dkms')
provides=("${pkgname}")
conflicts=("${pkgname}" "realtek-${pkgname}")
replaces=("realtek-${pkgname}")
postinst="postinst.sh"
prerm="prerm.sh"
optdepends=('linux-headers-amd64: Build the module for Debian kernel'
            'proxmox-default-headers: Build the module for Proxmox VE kernel')
source=("http://rtitwww.realtek.com/rtdrivers/cn/nic1/${_pkgname}-${pkgver}.tar.bz2"
        "dkms.conf")
sha256sums=('cd1955dd07d2f5a6faaa210ffc4e8af992421295a32ab6ddcfa759bed9eba922'
            '1e5fd3543bc30e1783acf6235e22a1e7d28db3ef136f3aac5b34a944315396a6')

prepare() {
    cd "${_pkgname}-${pkgver}"
    rm src/Makefile_linux24x
    sed -e "s|@PKGVER@|${pkgver}|g" ../dkms.conf > src/dkms.conf
    sed -e "s|CONFIG_ASPM = y|CONFIG_ASPM = n|" \
        -e "s|ENABLE_MULTIPLE_TX_QUEUE = n|ENABLE_MULTIPLE_TX_QUEUE = y|" \
        -e "s|ENABLE_RSS_SUPPORT = n|ENABLE_RSS_SUPPORT = y|" \
        -i "src/Makefile"
}

package() {
    cd "${_pkgname}-${pkgver}"
    install -Dm644 -t "${pkgdir}/usr/share/doc/${pkgname}"      README
    install -Dm644 -t "${pkgdir}/usr/src/${_pkgname}-${pkgver}" src/*
}
