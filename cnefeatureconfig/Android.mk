LOCAL_PATH:= $(call my-dir)
include $(CLEAR_VARS)
LOCAL_ARM_MODE := arm

LOCAL_SRC_FILES:= \
       src/CneFeatureConfig.cpp\

LOCAL_MODULE:= libcnefeatureconfig
LOCAL_MODULE_TAGS := optional

LOCAL_SHARED_LIBRARIES := libc libcutils

LOCAL_C_INCLUDES := \
        device/motorola/falcon/cnefeatureconfig/inc

LOCAL_PRELINK_MODULE := false

include $(BUILD_SHARED_LIBRARY)

