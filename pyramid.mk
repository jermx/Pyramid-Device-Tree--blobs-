#
# Copyright (C) 2011 Xboarder56
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

# The gps config appropriate for this device
PRODUCT_COPY_FILES += \
    device/htc/pyramid/gps.conf:system/etc/gps.conf

## (1) First, the most specific values, i.e. the aspects that are specific to GSM
PRODUCT_PROPERTY_OVERRIDES += \
    ro.com.google.clientidbase=android-htc \
    ro.com.google.locationfeatures=1 \
    ro.com.google.networklocation=1 \
    ro.setupwizard.enable_bypass=1 \
    dalvik.vm.lockprof.threshold=500 \
    dalvik.vm.dexopt-flags=m=y

#TODO ---- What do we need to do to not use a static init & init.rc?
PRODUCT_COPY_FILES += \
    device/htc/pyramid/init:root/init \
    device/htc/pyramid/init.rc:root/init.rc \
    device/htc/pyramid/ueventd.rc:root/ueventd.rc \
    device/htc/pyraid/init.pyramid.rc:root/init.pyramid.rc \
    device/htc/shooter/ueventd.pyramid.rc:root/ueventd.pyramid.rc

## (2) Also get non-open-source GSM-specific aspects if available
$(call inherit-product-if-exists, vendor/htc/pyramid/pyramid-vendor.mk)

## (3)  Finally, the least specific parts, i.e. the non-GSM-specific aspects
PRODUCT_PROPERTY_OVERRIDES += \
	ro.com.google.clientidbase=android-htc \
	ro.com.google.locationfeatures=1 \
 	ro.com.google.networklocation=1 \
 	ro.com.google.gmsversion=2.3_r3 \
	ro.setupwizard.enable_bypass=1 \
	dalvik.vm.lockprof.threshold=500 \
	dalvik.vm.dexopt-flags=m=y \

DEVICE_PACKAGE_OVERLAYS += device/htc/pyramid/overlay

PRODUCT_COPY_FILES += \
    frameworks/base/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/base/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
    frameworks/base/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/base/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/base/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/base/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/base/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/base/data/etc/android.hardware.touchscreen.multitouch.distinct.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.distinct.xml \
    frameworks/base/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/base/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml

PRODUCT_PACKAGES += \
#    gps.pyramid \
#    librs_jni \
#    gralloc.msm8660 \
#    copybit.msm8660 \
#    overlay.default \
    librs_jni \
#    libOmxCore \
    libOmxVenc \
    libOmxVdec \
#    libaudio \
    com.android.future.usb.accessory

# Keylayouts
PRODUCT_COPY_FILES += \
    device/htc/pyramid/keychars/qwerty2.kcm.bin:system/usr/keychars/qwerty2.kcm.bin \
    device/htc/pyramid/keychars/qwerty.kcm.bin:system/usr/keychars/qwerty.kcm.bin \
    device/htc/pyramid/keychars/pyramid-keypad.kcm.bin:system/usr/keychars/pyramid-keypad.kcm.bin \
    device/htc/pyramid/keychars/BT_HID.kcm.bin:system/usr/keychars/BT_HID.kcm.bin \
    device/htc/pyramid/keylayout/h2w_headset.kl:system/usr/keylayout/h2w_headset.kl \
    device/htc/pyramid/keylayout/qwerty.kl:system/usr/keylayout/qwerty.kl \
    device/htc/pyramid/keylayout/pyramid-keypad.kl:system/usr/keylayout/pyramid-keypad.kl \
    device/htc/pyramid/keylayout/BT_HID.kl:system/usr/keylayout/BT_HID.kl \
    device/htc/pyramid/keylayout/AVRCP.kl:system/usr/keylayout/AVRCP.kl
# Firmware
PRODUCT_COPY_FILES += \
    device/htc/pyramid/firmware/BCM4329B1_002.002.023.0589.0632.hcd:system/etc/firmware/BCM4329B1_002.002.023.0589.0632.hcd \
    device/htc/pyramid/firmware/fw_bcm4329.bin:system/etc/firmware/fw_bcm4329.bin \
    device/htc/pyramid/firmware/fw_bcm4329_apsta.bin:system/etc/firmware/fw_bcm4329_apsta.bin \
    device/htc/pyramid/firmware/vidc_1080p.fw:system/etc/firmware/vidc_1080p.fw \
    device/htc/pyramid/firmware/leia_pfp_470.fw:system/etc/firmware/leia_pfp_470.fw \
    device/htc/pyramid/firmware/leia_pm4_470.fw:system/etc/firmware/leia_pm4_470.fw
    
# Audio DSP Profiles
PRODUCT_COPY_FILES += \
    device/htc/pyramid/dsp/AIC3254_REG.csv:system/etc/AIC3254_REG.csv \
    device/htc/pyramid/dsp/AIC3254_REG_DualMic.csv:system/etc/AIC3254_REG_DualMic.csv \
    device/htc/pyramid/dsp/AdieHWCodec.csv:system/etc/AdieHWCodec.csv \
    device/htc/pyramid/dsp/AudioBTID.csv:system/etc/AudioBTID.csv \
    device/htc/pyramid/dsp/CodecDSPID.txt:system/etc/CodecDSPID.txt \
    device/htc/pyramid/dsp/CodecDSPID_WB.txt:system/etc/CodecDSPID_WB.txt \
    device/htc/pyramid/dsp/TPA2051_CFG.csv:system/etc/TPA2051_CFG.csv \
    device/htc/pyramid/dsp/TPA2051_CFG_XC.csv:system/etc/TPA2051_CFG_XC.csv \
    device/htc/pyramid/dsp/soundimage/Sound_Original_Recording.txt:system/etc/soundimage/Sound_Original_Recording.txt \
    device/htc/pyramid/dsp/soundimage/Sound_Original_SPK.txt:system/etc/soundimage/Sound_Original_SPK.txt \
    device/htc/pyramid/dsp/soundimage/Sound_Original.txt:system/etc/soundimage/Sound_Original.txt \
    device/htc/pyramid/dsp/soundimage/Sound_Phone_Original_HP.txt:system/etc/soundimage/Sound_Phone_Original_HP.txt \
    device/htc/pyramid/dsp/soundimage/Sound_Phone_Original_REC.txt:system/etc/soundimage/Sound_Phone_Original_REC.txt \
    device/htc/pyramid/dsp/soundimage/Sound_Phone_Original_SPK.txt:system/etc/soundimage/Sound_Phone_Original_SPK.txt \
    device/htc/pyramid/dsp/soundimage/Sound_Rec_Landscape.txt:system/etc/soundimage/Sound_Rec_Landscape.txt \
    device/htc/pyramid/dsp/soundimage/Sound_Rec_Portrait.txt:system/etc/soundimage/Sound_Rec_Portrait.txt \
    device/htc/pyramid/dsp/soundimage/Sound_Recording.txt:system/etc/soundimage/Sound_Recording.txt \
    device/htc/pyramid/dsp/soundimage/srs_geq10.cfg:system/etc/soundimage/srs_geq10.cfg \
    device/htc/pyramid/dsp/soundimage/srsfx_trumedia_51.cfg:system/etc/soundimage/srsfx_trumedia_51.cfg \
    device/htc/pyramid/dsp/soundimage/srsfx_trumedia_movie.cfg:system/etc/soundimage/srsfx_trumedia_movie.cfg \
    device/htc/pyramid/dsp/soundimage/srsfx_trumedia_music.cfg:system/etc/soundimage/srsfx_trumedia_music.cfg \
    device/htc/pyramid/prebuilt/snd3254:system/bin/snd3254

# Wifi Module
PRODUCT_COPY_FILES += \
    device/htc/pyramid/modules/bcm4329.ko:system/lib/modules/bcm4329.ko \
    device/htc/pyramid/modules/kineto_gan.ko:system/lib/modules/kineto_gan.ko \
    device/htc/pyramid/modules/tun.ko:system/lib/modules/tun.ko \

# we have enough storage space to hold precise GC data
PRODUCT_TAGS += dalvik.gc.type-precise

# device uses high-density artwork where available
PRODUCT_LOCALES += hdpi

PRODUCT_COPY_FILES += \
    device/htc/pyramid/vold.fstab:system/etc/vold.fstab


$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

DEVICE_PACKAGE_OVERLAYS += device/htc/pyramid/overlay


ifeq ($(TARGET_PREBUILT_KERNEL),)
	LOCAL_KERNEL := device/htc/pyramid/kernel
else
	LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel

# media profiles and capabilities spec
$(call inherit-product, device/htc/pyramid/media_a1026.mk)

# htc audio settings
$(call inherit-product, device/htc/pyramid/media_htcaudio.mk)

# stuff common to all HTC phones
$(call inherit-product, device/htc/common/common.mk)

$(call inherit-product, build/target/product/full_base.mk)

PRODUCT_NAME := HTC Pyramid
PRODUCT_DEVICE := pyramid
PRODUCT_MODEL := HTC Sensation
PRODUCT_MANUFACTURER := HTC
