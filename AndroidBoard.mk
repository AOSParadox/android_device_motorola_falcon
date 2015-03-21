LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

# include the non-open-source counterpart to this file
-include vendor/motorola/falcon/AndroidBoardVendor.mk

include device/qcom/msm8226/AndroidBoard.mk

#Create symbolic links
$(shell mkdir -p $(TARGET_OUT_ETC)/firmware/wlan/prima; \
        mkdir -p $(TARGET_OUT_VENDOR)/lib; \
        rm $(TARGET_OUT_ETC)/firmware/wlan/prima/WCNSS_qcom_wlan_nv.bin; \
        ln -sf /persist/WCNSS_qcom_wlan_factory_nv.bin \
        $(TARGET_OUT_ETC)/firmware/wlan/prima/WCNSS_qcom_wlan_factory_nv.bin;)
