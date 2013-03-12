#
# Copyright 2012 The Android Open Source Project
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

# Sample: This is where we'd set a backup provider if we had one
# $(call inherit-product, device/sample/products/backup_overlay.mk)

# Inherit AOSP specific parts
$(call inherit-product, build/target/product/full_base.mk)
$(call inherit-product, build/target/product/telephony.mk)

# Inherit some GSM stuff

PRODUCT_PACKAGES += \
    Stk \
    VoiceDialer

PRODUCT_PROPERTY_OVERRIDES := \
    keyguard.no_require_sim=true \
    ro.com.android.dataroaming=false

PRODUCT_COPY_FILES += \
    device/lge/mako/system/etc/apns-conf.xml:system/etc/apns-conf.xml

# Inherit from hardware-specific part of the product configuration
$(call inherit-product, device/lge/mako/device.mk)
$(call inherit-product, vendor/lge/mako/mako-vendor.mk)

PRODUCT_NAME := sm_mako
PRODUCT_DEVICE := mako
PRODUCT_BRAND := Google
PRODUCT_MODEL := Nexus 4
PRODUCT_MANUFACTURER := LGE

PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=occam BUILD_FINGERPRINT="google/occam/mako:4.2.2/JDQ39/573038:user/release-keys" PRIVATE_BUILD_DESC="occam-user 4.2.2 JDQ39 573038 release-keys"

# Don't restrict vendors
PRODUCT_RESTRICT_VENDOR_FILES := false

# Enable ADB authentication
PRODUCT_PROPERTY_OVERRIDES += ro.adb.secure=1

# Set SM_BUILDTYPE

PRODUCT_VERSION_MAJOR := 1
PRODUCT_VERSION_MINOR := 0
PRODUCT_VERSION_MAINTENANCE := 1
SM_EXTRAVERSION := $(shell date +%s)

ifeq ($(SM_EXPERIMENTAL),1)
    SM_BUILDTYPE := EXPERIMENTAL
endif
ifeq ($(SM_RELEASE),I_AM_SABERMOD)
    SM_BUILDTYPE := RELEASE
    SM_BUILD := RC2
endif

ifdef SM_BUILDTYPE
    ifeq ($(SM_BUILDTYPE),RELEASE)
        SM_VERSION := $(PRODUCT_NAME)-$(PRODUCT_VERSION_MAJOR).$(PRODUCT_VERSION_MINOR).$(PRODUCT_VERSION_MAINTENANCE)-$(SM_BUILD)
    else
        ifeq ($(SM_BUILDTYPE),EXPERIMENTAL)
            SM_VERSION := $(PRODUCT_NAME)-$(PRODUCT_VERSION_MAJOR).$(PRODUCT_VERSION_MINOR).$(PRODUCT_VERSION_MAINTENANCE)-$(SM_EXTRAVERSION)-$(shell date -u +%m%d)
        endif
    endif
else
    # If SM_BUILDTYPE is not defined, set to UNOFFICIAL
    SM_BUILDTYPE := UNOFFICIAL
    SM_VERSION := $(PRODUCT_NAME)-$(PRODUCT_VERSION_MAJOR).$(PRODUCT_VERSION_MINOR).$(PRODUCT_VERSION_MAINTENANCE)-$(SM_BUILDTYPE)-$(shell date -u +%m%d)
endif

PRODUCT_PROPERTY_OVERRIDES += \
  ro.sm.version=$(SM_VERSION) \
  ro.modversion=$(SM_VERSION)
