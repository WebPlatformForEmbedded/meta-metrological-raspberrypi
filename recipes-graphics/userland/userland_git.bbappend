FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
SRC_URI_append = "\
    file://0001-brcmegl-pc-in-egl.patch \
    file://0002-getproc-add-core-funcs.patch \
"

PACKAGECONFIG_append = " ${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'wayland', '', d)}"

