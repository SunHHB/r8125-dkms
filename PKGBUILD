# Maintainer: Evine Deng <evinedeng@hotmail.com>

_modname=r8125
_pkgname="realtek-${_modname}"
pkgname="${_pkgname}-dkms"
pkgver=9.013.02
pkgrel=1
url="https://www.realtek.com/en/component/zoo/category/network-interface-controllers-10-100-1000m-gigabit-ethernet-pci-express-software"
pkgdesc="Kernel module for RTL8125"
license=('GPL2')
arch=('all')
depends=('dkms')
postinst="postinst.sh"
prerm="prerm.sh"
optdepends=('linux-headers-amd64: Build the module for Debian kernel'
            'proxmox-default-headers: Build the module for Proxmox VE kernel')
source=("http://rtitwww.realtek.com/rtdrivers/cn/nic1/${_modname}-${pkgver}.tar.bz2"
        "dkms.conf")
sha256sums=('d36410ee99c956f250d9cd08340d8c36567d190f420a8ee128ff6e51225aac0c'
            'f56a467500a82a4215f175783e93525283eed3245fb1ac57a24a8d2b074cc2af')

prepare() {
    sed -e "s/@PKGVER@/${pkgver}/g" dkms.conf > "${_modname}-${pkgver}/src/dkms.conf"
    sed -e "s|CONFIG_ASPM = y|CONFIG_ASPM = n|" \
        -e "s|ENABLE_MULTIPLE_TX_QUEUE = n|ENABLE_MULTIPLE_TX_QUEUE = y|" \
        -e "s|ENABLE_RSS_SUPPORT = n|ENABLE_RSS_SUPPORT = y|" \
        -i "${_modname}-${pkgver}/src/Makefile"
}

package() {
    install -Dm644 -t "${pkgdir}/usr/src/${_pkgname}-${pkgver}" "${_modname}-${pkgver}/"{README,src/*}
}
