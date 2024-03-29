LINUX_VERSION ?= "5.15.56"
LINUX_RPI_BRANCH ?= "rpi-5.15.y"
LINUX_RPI_KMETA_BRANCH ?= "yocto-5.15"

SRCREV_machine = "a90998a3e549911234f9f707050858b98b71360f"
SRCREV_meta = "3b1dc2f1fcd869f97901402759b859035984aa7f"

KMETA = "kernel-meta"

SRC_URI = " \
    git://github.com/raspberrypi/linux.git;name=machine;branch=${LINUX_RPI_BRANCH};protocol=https \
    git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=${LINUX_RPI_KMETA_BRANCH};destsuffix=${KMETA} \
    file://powersave.cfg \
    file://usbaudio.cfg \
    file://nocompress.cfg \
    "

require recipes-kernel/linux/linux-raspberrypi.inc

SRC_URI_remove = "file://rpi-kernel-misc.cfg"

KERNEL_DTC_FLAGS += "-@ -H epapr"
LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"

