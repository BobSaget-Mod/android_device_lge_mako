#
# Copyright (C) 2013 The SaberMod Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
# Extra packages
PRODUCT_PACKAGES += \
    bash \
    Basic \
    Camera \
    CellBroadcastReceiver \
    CMFileManager \
    com.tmobile.themes \
    Development \
    DSPManager \
    e2fsck \
    GalleryGoogleMako \
    htop \
    LatinIME \
    libcyanogen-dsp \
    libjackpal-androidterm4 \
    LockClock \
    lsof \
    mke2fs \
    nano \
    openvpn \
    powertop \
    rsync \
    scp \
    sftp \
    SoundRecorder \
    ssh \
    sshd \
    sshd_config \
    ssh-keygen \
    Superuser \
    su \
    Term \
    ThemeChooser \
    ThemeManager \
    Torch \
    tune2fs \
    VideoEditor \
    vim \
    WallpaperZ

$(call inherit-product, vendor/goomanager/goomanager-vendor.mk)
$(call inherit-product, vendor/RM/rm-vendor.mk)

# sysinit support
PRODUCT_COPY_FILES += \
    device/lge/mako/system/bin/sysinit:system/bin/sysinit

# Extra init file
PRODUCT_COPY_FILES += \
    device/lge/mako/system/etc/init.local.rc:root/init.sm.rc

# Don't export PS1 in /system/etc/mkshrc.
PRODUCT_COPY_FILES += \
    device/lge/mako/system/etc/mkshrc:system/etc/mkshrc

# Allow fixing of permissions
PRODUCT_COPY_FILES += \
    device/lge/mako/system/bin/fix_permissions:system/bin/fix_permissions

# Theme support
PRODUCT_COPY_FILES += \
       device/lge/mako/system/etc/permissions/com.tmobile.software.themes.xml:system/etc/permissions/com.tmobile.software.themes.xml

# video files and extra camera effects
$(call inherit-product, frameworks/base/data/videos/VideoPackage2.mk)

# Boot animation
PRODUCT_COPY_FILES += \
    device/lge/mako/system/media/bootanimation.zip:system/media/bootanimation.zip

# Kernel modules
ifeq ($(USING_BUILD_SCRIPTS),true)
PRODUCT_COPY_FILES += \
    device/lge/mako/system/lib/modules/scsi_wait_scan.ko:system/lib/modules/scsi_wait_scan.ko \
    device/lge/mako/system/lib/modules/cifs.ko:system/lib/modules/cifs.ko
endif

# Busybox sync script
PRODUCT_COPY_FILES += \
    device/lge/mako/system/etc/init.d/99complete:system/etc/init.d/99complete

# SaberMod banner
PRODUCT_COPY_FILES += \
    device/lge/mako/system/etc/init.d/00banner:system/etc/init.d/00banner
