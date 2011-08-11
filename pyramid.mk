#
# Copyright (C) 2011 The CyanogenMod Project
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

$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# The gps config appropriate for this device
PRODUCT_COPY_FILES += \
    device/htc/pyramid/gps.conf:system/etc/gps.conf

## (1) First, the most specific values, i.e. the aspects that are specific to GSM

PRODUCT_COPY_FILES += \
    device/htc/pyramid/init.pyramid.rc:root/init.pyramid.rc \
    device/htc/pyramid/ueventd.pyramid.rc:root/ueventd.pyramid.rc

## (2) Also get non-open-source GSM-specific aspects if available
$(call inherit-product-if-exists, device/htc/pyramid/pyramid-vendor.mk)

## (3)  Finally, the least specific parts, i.e. the non-GSM-specific aspects
PRODUCT_PROPERTY_OVERRIDES += \
    ro.com.google.clientidbase=android-htc \
    ro.com.google.locationfeatures=1 \
    ro.com.google.networklocation=1 \
    ro.com.google.gmsversion=2.3_r3 \
    ro.setupwizard.enable_bypass=1 \
    dalvik.vm.lockprof.threshold=500 \
    dalvik.vm.dexopt-flags=m=y

DEVICE_PACKAGE_OVERLAYS += device/htc/pyramid/overlay

PRODUCT_COPY_FILES += \
    frameworks/base/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml 

# gsm config xml file
PRODUCT_COPY_FILES += \
    vendor/htc/pyramid/proprietary/spn-conf.xml:system/etc/spn-conf.xml \
    vendor/htc/pyramid/proprietary/voicemail-conf.xml:system/etc/voicemail-conf.xml

PRODUCT_PACKAGES += \
    lights.pyramid \
    sensors.pyramid \
    gps.pyramid

# Keylayouts
PRODUCT_COPY_FILES += \
    vendor/htc/pyramid/proprietary/qwerty2.kcm.bin:system/usr/keychars/qwerty2.kcm.bin \
    vendor/htc/pyramid/proprietary/qwerty.kcm.bin:system/usr/keychars/qwerty.kcm.bin \
    vendor/htc/pyramid/proprietary/pyramid-keypad.kcm.bin:system/usr/keychars/pyramid-keypad.kcm.bin \
    vendor/htc/pyramid/proprietary/AVRCP.kl:system/usr/keylayout/AVRCP.kl \
    vendor/htc/pyramid/proprietary/h2w_headset.kl:system/usr/keylayout/h2w_headset.kl \
    vendor/htc/pyramid/proprietary/qwerty.kl:system/usr/keylayout/qwerty.kl \
    vendor/htc/pyramid/proprietary/pyramid-keypad.kl:system/usr/keylayout/pyramid-keypad.kl

# Firmware
PRODUCT_COPY_FILES += \
    vendor/htc/pyramid/proprietary/BCM4329B1_OO2.002.023.0589.0632.hcd \
    vendor/htc/pyramid/proprietary/fw_bcm4329.bin \
    vendor/htc/pyramid/proprietary/fw_bcm4329_apasta.bin \
    vendor/htc/pyramid/proprietary/leia_pfp_470.fw \
    vendor/htc/pyramid/proprietary/leia_pm4_470.fw \
    vendor/htc/pyramid/proprietary/vidc_1080p.fw

PRODUCT_COPY_FILES += \
    device/htc/pyramid/vold.fstab:system/etc/vold.fstab

# Kernel modules
#PRODUCT_COPY_FILES += \

ifeq ($(TARGET_PREBUILT_KERNEL),)
LOCAL_KERNEL := device/htc/pyramid/zImage
else
LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel

PRODUCT_COPY_FILES += \
    device/htc/pyramid/bcm4329.ko:system/lib/modules/bcm4329.ko \
    device/htc/pyramid/tun.ko:system/lib/modules/tun.ko \
    device/htc/pyramid/kineto_gan.ko:system/lib/modules/kineto_gan.ko

$(call inherit-product-if-exists, device/htc/pyramid/pyramid-vendor.mk)

PRODUCT_NAME := htc_pyramid
PRODUCT_DEVICE := pyramid
PRODUCT_MODEL := HTC Sensation
PRODUCT_MANUFACTURER := HTC

