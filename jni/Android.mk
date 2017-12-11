LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

LOCAL_MODULE     := dlib
LOCAL_C_INCLUDES := ../dlib_v19.7
LOCAL_SRC_FILES  := ../dlib_v19.7/dlib/threads/threads_kernel_shared.cpp \
		    ../dlib_v19.7/dlib/entropy_encoder/entropy_encoder_kernel_1.cpp \
		    ../dlib_v19.7/dlib/entropy_decoder/entropy_decoder_kernel_2.cpp \
		    ../dlib_v19.7/dlib/base64/base64_kernel_1.cpp \
		    ../dlib_v19.7/dlib/threads/threads_kernel_1.cpp \
		    ../dlib_v19.7/dlib/threads/threads_kernel_2.cpp

LOCAL_C_FLAGS   := -DDLIB_NO_GUI_SUPPORT
include $(BUILD_SHARED_LIBRARY)
