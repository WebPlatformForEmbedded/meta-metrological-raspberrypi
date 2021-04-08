# bbappend for raspberryPi
#
#
WESTEROS_BACKEND = "${@bb.utils.contains("MACHINE_FEATURES", "vc4graphics", "westeros-soc-drm", "westeros-soc-rpi", d)}"
PACKAGECONFIG = "incapp inctest incplayer increndergl incsbprotocol xdgv4"
CXXFLAGS_append = "${@bb.utils.contains('MACHINE_FEATURES', 'vc4graphics', ' ', ' -DWESTEROS_PLATFORM_RPI -DWESTEROS_INVERTED_Y -DBUILD_WAYLAND -I${STAGING_INCDIR}/interface/vmcs_host/linux', d)}"
CXXFLAGS_append_dunfell = " ${@bb.utils.contains('MACHINE_FEATURES', 'vc4graphics', '-DUSE_MESA', '', d)}"

do_configure_prepend() {
    sed -i -e 's/-lwesteros_simplebuffer_client/-lwesteros_compositor -lwesteros_simplebuffer_client/g' ${S}/rpi/westeros-sink/Makefile.am
}

do_compile_prepend () {
	export WESTEROS_COMPOSITOR_EXTRA_LIBS="${@bb.utils.contains("MACHINE_FEATURES", "vc4graphics", "-lEGL -lGLESv2", "-lEGL -lGLESv2 -lbcm_host -lvchostif", d)}"
}
