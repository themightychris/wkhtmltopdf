pkg_name=wkhtmltox
pkg_origin=core
pkg_version=0.12.4
pkg_description="wkhtmltopdf and wkhtmltoimage are command line tools to render HTML into PDF and various image formats using the QT Webkit rendering engine. These run entirely \"headless\" and do not require a display or display service."
pkg_upstream_url=https://github.com/wkhtmltopdf/wkhtmltopdf
pkg_license=('LGPL-3.0')
pkg_maintainer="The Habitat Maintainers <humans@habitat.sh>"
pkg_bin_dirs=(bin)
pkg_include_dirs=(include)
pkg_lib_dirs=(lib)

pkg_build_deps=(
  core/coreutils
  core/make
  core/diffutils
  core/perl
  core/gcc
  xorg/xlib
  xorg/libxext
  xorg/libxrender
  core/fontconfig
  core/freetype
  xorg/libsm
)

pkg_deps=(
  core/gcc-libs
)

do_build() {
  hab pkg binlink core/coreutils pwd
  pushd ./qt
  build_line "Run: ./configure --prefix=$pkg_prefix -opensource -release -confirm-license -fast -nomake demos -nomake examples"
  attach
}
