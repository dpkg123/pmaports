# Reference: <https://postmarketos.org/vendorkernel>
# Kernel config based on: arch/arm64/configs/(CHANGEME!)

pkgname=linux-xiaomi-curtana
pkgver=3.x.x
pkgrel=0
pkgdesc="Xiaomi Redmi Note 9S kernel fork"
arch="aarch64"
_carch="arm64"
_flavor="xiaomi-curtana"
url="https://kernel.org"
license="GPL-2.0-only"
options="!strip !check !tracedeps pmb:cross-native"
makedepends="
	bash
	bc
	bison
	devicepkg-dev
	flex
	openssl-dev
	perl
"

# Source
_repository="(CHANGEME!)"
_commit="ffffffffffffffffffffffffffffffffffffffff"
_config="config-$_flavor.$arch"
source="
	$pkgname-$_commit.tar.gz::https://github.com/LineageOS/$_repository/archive/$_commit.tar.gz
	$_config
	gcc7-give-up-on-ilog2-const-optimizations.patch
	gcc8-fix-put-user.patch
	gcc10-extern_YYLOC_global_declaration.patch
	kernel-use-the-gnu89-standard-explicitly.patch
"
builddir="$srcdir/$_repository-$_commit"
_outdir="out"

prepare() {
	default_prepare
	. downstreamkernel_prepare
}

build() {
	unset LDFLAGS
	make O="$_outdir" ARCH="$_carch" CC="${CC:-gcc}" \
		KBUILD_BUILD_VERSION="$((pkgrel + 1 ))-postmarketOS"
}

package() {
	downstreamkernel_package "$builddir" "$pkgdir" "$_carch" \
		"$_flavor" "$_outdir"
}

sha512sums="(run 'pmbootstrap checksum linux-xiaomi-curtana' to fill)"
