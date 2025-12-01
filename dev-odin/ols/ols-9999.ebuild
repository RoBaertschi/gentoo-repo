# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# NOTE: The comments in this file are for instruction and documentation.
# They're not meant to appear with your final, production ebuild.  Please
# remember to remove them before submitting or committing your ebuild.  That
# doesn't mean you can't add your own comments though.

# The EAPI variable tells the ebuild format in use.
# It is suggested that you use the latest EAPI approved by the Council.
# The PMS contains specifications for all EAPIs. Eclasses will test for this
# variable if they need to use features that are not universal in all EAPIs.
# If an eclass doesn't support latest EAPI, use the previous EAPI instead.
EAPI=8


# inherit lists eclasses to inherit functions from. For example, an ebuild
# that needs the eautoreconf function from autotools.eclass won't work
# without the following line:

EGIT_REPO_URI="https://github.com/DanielGavin/ols.git"
inherit git-r3

DESCRIPTION="Language server for Odin"

HOMEPAGE="https://github.com/DanielGavin/ols"

LICENSE="MIT"
SLOT="0"

# Should be ommitted, see https://devmanual.gentoo.org/ebuild-writing/functions/src_unpack/vcs-sources/index.html
# KEYWORDS="~amd64"

# A space delimited list of portage features to restrict. man 5 ebuild
# for details.  Usually not needed.
#RESTRICT="strip"


# Run-time dependencies. Must be defined to whatever this depends on to run.
# Example:
#    ssl? ( >=dev-libs/openssl-1.0.2q:0= )
#    >=dev-lang/perl-5.24.3-r1
# It is advisable to use the >= syntax show above, to reflect what you
# had installed on your system when you tested the package.  Then
# other users hopefully won't be caught without the right version of
# a dependency.
#RDEPEND=""

# Build-time dependencies that need to be binary compatible with the system
# being built (CHOST). These include libraries that we link against.
# The below is valid if the same run-time depends are required to compile.
#DEPEND="${RDEPEND}"

# Build-time dependencies that are executed during the emerge process, and
# only need to be present in the native build system (CBUILD). Example:
BDEPEND="=dev-lang/odin-9999"

src_compile() {
	./build.sh || die "failed to build ols"
}

src_test() {
	./build.sh test
}

src_install() {
	dobin ols
}
