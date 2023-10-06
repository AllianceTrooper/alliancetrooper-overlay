# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

VERSION="0.4"
DESCRIPTION="simple keyboard indicator"
HOMEPAGE="https://github.com/polachok/skb"
MY_P="1497a78b34faf1967e6dfaf2662fc3a75b342a3e"
SRC_URI="https://github.com/polachok/skb/archive/${MY_P}.tar.gz
-> skb-${VERSION}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_unpack() {
	unpack skb-${VERSION}.tar.gz

	# We want to rename the unpacked directory to a nice normalised string
	mv "${WORKDIR}"/skb-${MY_P} "${WORKDIR}"/skb-${VERSION} || die
}
