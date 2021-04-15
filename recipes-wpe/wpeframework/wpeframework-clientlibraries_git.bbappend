WPE_COMPOSITOR_CLIENT = "${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'compositorclient_wayland', 'compositorclient_rpi', d)}"

PACKAGECONFIG_append = " displayinfo playerinfo deviceinfo" 
PACKAGECONFIG_append = " ${@bb.utils.contains('MACHINE_FEATURES', 'vc4graphics', 'vc4graphics', '', d)}"
PACKAGECONFIG_append = " ${@bb.utils.contains('DISTRO_FEATURES', 'compositor', '${WPE_COMPOSITOR_CLIENT}', '', d)}"
RDEPENDS_${PN}_append = " ${@bb.utils.contains('MACHINE_FEATURES', 'vc4graphics', '', 'userland', d)}"
