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

$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)
$(call inherit-product, frameworks/native/build/phone-xhdpi-1024-dalvik-heap.mk)
$(call inherit-product-if-exists, vendor/motorola/falcon/falcon-vendor.mk)

PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREF_CONFIG := xhdpi

#Wi-Fi
PRODUCT_COPY_FILES += \
    device/qcom/msm8226/WCNSS_qcom_wlan_nv.bin:system/etc/firmware/wlan/prima/WCNSS_qcom_wlan_nv.bin

# Ramdisk
PRODUCT_COPY_FILES += \
    $(call find-copy-subdir-files,*,device/motorola/falcon/ramdisk,root)

# Prebuilt
PRODUCT_COPY_FILES += \
    $(call find-copy-subdir-files,*,device/motorola/falcon/prebuilt/system,system)

#Call CodeAurora MSM8226 Tree
include device/qcom/msm8226/msm8226.mk

PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    persist.sys.usb.config=adb

# Audio
PRODUCT_PROPERTY_OVERRIDES += \
    persist.audio.fluence.mode=endfire \
    persist.audio.handset.mic=digital \
    af.resampler.quality=4 \
    persist.audio.calfile0=/etc/Bluetooth_cal.acdb \
    persist.audio.calfile1=/etc/General_cal.acdb \
    persist.audio.calfile2=/etc/Global_cal.acdb \
    persist.audio.calfile3=/etc/Handset_cal.acdb \
    persist.audio.calfile4=/etc/Hdmi_cal.acdb \
    persist.audio.calfile5=/etc/Headset_cal.acdb \
    persist.audio.calfile6=/etc/Speaker_cal.acdb

PRODUCT_PACKAGES += \
    libqcompostprocbundle \
    libqcomvisualizer \
    libqcomvoiceprocessing

# Boot animation
TARGET_SCREEN_HEIGHT := 1280
TARGET_SCREEN_WIDTH := 720

# GPS
PRODUCT_PROPERTY_OVERRIDES += \
    ro.gps.agps_provider=1 \
    ro.qc.sdk.izat.premium_enabled=1 \
    ro.qc.sdk.izat.service_mask=0x5 \
    persist.gps.qc_nlp_in_use=1

# Media
PRODUCT_PROPERTY_OVERRIDES += \
    ro.audio.fm_max_volume=4096 \
    ro.qualcomm.cabl=0 \

# Misc
PRODUCT_PROPERTY_OVERRIDES += \
    ro.usb.mtp=0x2e82 \
    ro.usb.mtp_adb=0x2e76 \
    ro.usb.ptp=0x2e83 \
    ro.usb.ptp_adb=0x2e84 \
    ro.usb.bpt=0x2e28 \
    ro.usb.bpt_adb=0x2e29 \
    ro.usb.bpteth=0x2e2a \
    ro.usb.bpteth_adb=0x2e2b \
    persist.gps.qc_nlp_in_use=0 \
    qcom.bt.le_dev_pwr_class=1 \
    ro.sf.lcd_density=320 \
    ro.crypto.fuse_sdcard=true \
    qemu.hw.mainkeys=0

# Storage
PRODUCT_PROPERTY_OVERRIDES += \
    persist.fuse_sdcard=true \
    ro.crypto.fuse_sdcard=true \
    persist.sys.isUsbOtgEnabled=true

# Telephony
PRODUCT_PROPERTY_OVERRIDES += \
    persist.radio.apm_sim_not_pwdn=1 \
    persist.radio.dfr_mode_set=1 \
    persist.radio.call_type=1 \
    persist.radio.mode_pref_nv10=1 \
    persist.radio.no_wait_for_card=1 \
    persist.radio.apn_delay=5000 \
    persist.sys.ssr.restart_level=3 \
    persist.sys.qc.sub.rdump.on=1 \
    persist.sys.qc.sub.rdump.max=0 \
    ro.config.vc_call_vol_steps=7 \
    ro.use_data_netmgrd=true

# Time services
PRODUCT_PROPERTY_OVERRIDES += \
    persist.timed.enable=true

# GPS
PRODUCT_PACKAGES += \
    gps.msm8226

# Keystore
PRODUCT_PACKAGES += \
    keystore.msm8226

# Lights
PRODUCT_PACKAGES += \
    lights.msm8226

# Power
PRODUCT_PACKAGES += \
    power.msm8226

# USB
PRODUCT_PACKAGES += \
    com.android.future.usb.accessory

#Wi-Fi
PRODUCT_PACKAGES += \
    dhcpcd.conf \
    wcnss_service

# Media codecs
PRODUCT_COPY_FILES += \
    frameworks/av/media/libstagefright/data/media_codecs_google_audio.xml:system/etc/media_codecs_google_audio.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_telephony.xml:system/etc/media_codecs_google_telephony.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_video.xml:system/etc/media_codecs_google_video.xml
