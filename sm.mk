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
    Apollo \
    bash \
    Basic \
    Camera \
    CMFileManager \
    CMFileManagerThemes \
    com.tmobile.themes \
    Development \
    DSPManager \
    e2fsck \
    Email \
    htop \
    LatinIME \
    libcyanogen-dsp \
    libjackpal-androidterm4 \
    lsof \
    mke2fs \
    nano \
    openvpn \
    powertop \
    rsync \
    scp \
    sftp \
    SoundRecorder \
    SpareParts \
    ssh \
    sshd \
    sshd_config \
    ssh-keygen \
    su \
    Superuser \
    Term \
    ThemeChooser \
    ThemeManager \
    tune2fs \
    VideoEditor \
    vim \
    Wallpaperz-xhdpi

$(call inherit-product, vendor/goog/goog-vendor.mk)
$(call inherit-product, vendor/goomanager/goomanager-vendor.mk)

# sysinit support
PRODUCT_COPY_FILES += \
    device/lge/mako/system/bin/sysinit:system/bin/sysinit

# Extra init file
PRODUCT_COPY_FILES += \
    device/lge/mako/system/etc/init.local.rc:root/init.pb.rc

# Don't export PS1 in /system/etc/mkshrc.
PRODUCT_COPY_FILES += \
    device/lge/mako/etc/mkshrc:system/etc/mkshrc

# Allow fixing of permissions
PRODUCT_COPY_FILES += \
    device/lge/mako/system/bin/fix_permissions:system/bin/fix_permissions

# Theme support
PRODUCT_COPY_FILES += \
       device/lge/mako/system/etc/permissions/com.tmobile.software.themes.xml:system/etc/permissions/com.tmobile.software.themes.xml

# Inherit some GSM stuff

# Extra Required SaberMod packages
PRODUCT_PACKAGES += \
    Mms \
    Stk \
    VoiceDialer

# System dump APN config
PRODUCT_COPY_FILES += \
    device/lge/mako/system/etc/apns-conf.xml:system/etc/apns-conf.xml

# Extra gsm properties
PRODUCT_PROPERTY_OVERRIDES := \
    keyguard.no_require_sim=true \
    ro.com.android.dataroaming=false

