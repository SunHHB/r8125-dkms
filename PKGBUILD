# Maintainer: Evine Deng <evinedeng@hotmail.com>

_pkgname=r8125
pkgname=realtek-r8125-dkms
pkgver=9.012.04
pkgrel=1
url="https://www.realtek.com/en/component/zoo/category/network-interface-controllers-10-100-1000m-gigabit-ethernet-pci-express-software"
pkgdesc="Kernel module for RTL8125"
license=('GPL2')
arch=('all')
depends=('dkms')
postinst="postinst"
optdepends=('linux-headers-amd64: Build the module for Debian kernel'
            'proxmox-default-headers: Build the module for Proxmox VE kernel')
source=("http://rtitwww.realtek.com/rtdrivers/cn/nic1/${_pkgname}-${pkgver}.tar.bz2"
        "dkms.conf"
        "Makefile")
sha256sums=('cb5e66c983b42cc32609464c32a2097b8301f09853020e11950d3fd5de0bb4e2'
            '290ac68b559c230fc3904493870a9b4931cf68ad7ea3628fdc73259ab211207e'
            '2f8faecfe0a00d3503e5551d2bed84fc788016dae11e6425a50057a22f2f6418')

prepare() {
    sed -i -e "s|CONFIG_ASPM = y|CONFIG_ASPM = n|" "${_pkgname}-${pkgver}/src/Makefile"
    sed -i -e "s|ENABLE_MULTIPLE_TX_QUEUE = n|ENABLE_MULTIPLE_TX_QUEUE = y|" "${_pkgname}-${pkgver}/src/Makefile"
    sed -i -e "s|ENABLE_RSS_SUPPORT = n|ENABLE_RSS_SUPPORT = y|" "${_pkgname}-${pkgver}/src/Makefile"
    sed -e "s|@PKGVER@|${pkgver}|g" ../prerm > ../prerm-with-ver
}

package() {
    prerm="prerm-with-ver"

    local dir_name="realtek-${_pkgname}-${pkgver}"

    install -Dm644 -t "${pkgdir}/usr/src/${dir_name}" dkms.conf Makefile "${_pkgname}-${pkgver}/README"
    install -Dm644 -t "${pkgdir}/usr/src/${dir_name}/src" "${_pkgname}-${pkgver}/src/"*

    sed -e "s/@PKGVER@/${pkgver}/g" -i "${pkgdir}/usr/src/${dir_name}/dkms.conf"
}
