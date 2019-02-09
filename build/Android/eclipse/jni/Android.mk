LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)
LOCAL_LDLIBS :=-llog
LOCAL_C_INCLUDES :=	

LOCAL_CFLAGS    := -g

LOCAL_MODULE    := ffmpegH264
LOCAL_SRC_FILES := ffmpegH264.c

LOCAL_STATIC_LIBRARIES := ffmpegH264-lib
LOCAL_LDLIBS := -L$(SYSROOT)/usr/lib -llog

include $(BUILD_SHARED_LIBRARY)
include $(LOCAL_PATH)/Android_lib.mk


