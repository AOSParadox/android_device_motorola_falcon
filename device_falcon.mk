#
# Copyright (C) 2015 The AOSParadox Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

DEVICE_PACKAGE_OVERLAYS += device/motorola/falcon/overlay
PRODUCT_PACKAGE_OVERLAYS += device/motorola/falcon/overlay

$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)
$(call inherit-product, frameworks/native/build/phone-xhdpi-1024-dalvik-heap.mk)
$(call inherit-product-if-exists, vendor/motorola/falcon/falcon-vendor.mk)

PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREF_CONFIG := xhdpi

# CAF Branch
PRODUCT_PROPERTY_OVERRIDES += \
    ro.par.branch=LA.BF.1.1.3-00310-8x26.0

# Hadware QCOM
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    ro.hardware=qcom

# WCNSS
PRODUCT_COPY_FILES += \
    device/qcom/msm8226/WCNSS_qcom_wlan_nv.bin:system/etc/firmware/wlan/prima/WCNSS_qcom_wlan_nv.bin

# Ramdisk
PRODUCT_COPY_FILES += \
    $(call find-copy-subdir-files,*,device/motorola/falcon/ramdisk,root)

# Prebuilt
PRODUCT_COPY_FILES += \
    $(call find-copy-subdir-files,*,device/motorola/falcon/prebuilt/system,system)

# CodeAurora MSM8226 Tree
include device/qcom/msm8226/msm8226.mk

PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    persist.sys.usb.config=mtp

# Audio
PRODUCT_PACKAGES += \
    libqcompostprocbundle \
    libqcomvisualizer \
    libqcomvoiceprocessing

# Dalvik
PRODUCT_PROPERTY_OVERRIDES += \
    dalvik.vm.boot-dex2oat-threads=2 \
    dalvik.vm.dex2oat-threads=4

# FRP
PRODUCT_PROPERTY_OVERRIDES += \
    ro.frp.pst=/dev/block/platform/msm_sdcc.1/by-name/frp

# GPS
PRODUCT_PACKAGES += \
    gps.msm8226

# Hardware
PRODUCT_PROPERTY_OVERRIDES += \
    qemu.hw.mainkeys=0

# Keystore
PRODUCT_PACKAGES += \
    keystore.qcom

# Lights
PRODUCT_PACKAGES += \
    lights.msm8226

# Motorola
PRODUCT_PACKAGES += \
    libmoto

# Power
PRODUCT_PACKAGES += \
    power.msm8226 \
    power.qcom

# Radio
PRODUCT_PACKAGES += \
    libcnefeatureconfig

# TimeKeep
PRODUCT_PACKAGES += \
    timekeep \
    TimeKeep

# USB
PRODUCT_PACKAGES += \
    com.android.future.usb.accessory

# Wifi
PRODUCT_PACKAGES += \
    libcurl \
    libqsap_sdk \
    libQWiFiSoftApCfg \
    wcnss_service
