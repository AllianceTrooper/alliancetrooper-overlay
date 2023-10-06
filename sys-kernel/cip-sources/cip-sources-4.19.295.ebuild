# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="8"
ETYPE="sources"
#K_WANT_GENPATCHES="base extras"
#K_GENPATCHES_VER="79"

inherit kernel-2
detect_version
detect_arch

KEYWORDS="amd64"
HOMEPAGE="https://gitlab.com/cip-project/cip-kernel/linux-cip"
IUSE=""
MY_P="f0bb9fab6f834f73d3a71af029f5bda19d99b33c"

DESCRIPTION="Civil Infrastructure Platform kernel sources"
SRC_URI="
https://git.kernel.org/pub/scm/linux/kernel/git/cip/linux-cip.git\
/snapshot/linux-cip-${MY_P}.tar.gz
-> linux-${KV_FULL}.tar.gz
"
#${GENPATCHES_URI} ${ARCH_URI}

pkg_postinst() {
	kernel-2_pkg_postinst
	einfo "For more info on this patchset, and how to report problems, see:"
	einfo "${HOMEPAGE}"
}

#src_unpack() {
#	unpack linux-${KV_FULL}.tar.gz
#}

src_unpack() {
	unpack linux-${KV_FULL}.tar.gz

	# We want to rename the unpacked directory to a nice normalised string
	mv "${WORKDIR}"/linux-cip-${MY_P} "${WORKDIR}"/linux-${KV_FULL} || die
}

pkg_setup() {
	ewarn
	ewarn "${PN} is *not* supported by the Gentoo Kernel Project in any way."
	ewarn "If you need support, please contact the CIP developers directly."
	ewarn "Do *not* open bugs in Gentoo's bugzilla unless you have issues with"
	ewarn "the ebuilds. Thank you."
	ewarn
	kernel-2_pkg_setup
}

pkg_postrm() {
	kernel-2_pkg_postrm
}
