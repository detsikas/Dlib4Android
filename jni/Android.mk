LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

LOCAL_MODULE     := dlib
LOCAL_C_INCLUDES := ../
LOCAL_SRC_FILES  := ../dlib/threads/threads_kernel_shared.cpp \
		    ../dlib/entropy_encoder/entropy_encoder_kernel_1.cpp \
		    ../dlib/entropy_decoder/entropy_decoder_kernel_2.cpp \
		    ../dlib/base64/base64_kernel_1.cpp \
		    ../dlib/threads/threads_kernel_1.cpp \
		    ../dlib/threads/threads_kernel_2.cpp

LOCAL_C_FLAGS   := -DDLIB_NO_GUI_SUPPORT
include $(BUILD_SHARED_LIBRARY)
