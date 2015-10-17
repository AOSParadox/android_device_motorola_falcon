LOCAL_PATH:= $(call my-dir)

include $(CLEAR_VARS)
LOCAL_SRC_FILES := moto_log.c
LOCAL_SHARED_LIBRARIES := liblog
LOCAL_MODULE := libmoto-log
LOCAL_MODULE_TAGS := optional
include $(BUILD_SHARED_LIBRARY)

