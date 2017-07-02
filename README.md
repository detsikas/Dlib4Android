# Dlib compilation for Android #
This simple repository contains the files needed to compile [Dlib](http://dlib.net/) library for Android development. The repository
basically contains two files:
1. Android.mk
2. Application.mk

They are the files necessary for building the dlib library with [NDK](https://developer.android.com/ndk/index.html), as the dlib libray
is written in C++.

For details on how to build and include native C/C++ code in your Android project with NDK, you can start [here](https://developer.android.com/ndk/guides/build.html).
We will only go through the particular directives needed to build dlib for Android.

The repositoy does not contain the dlib code, but only links to its repository. In particular, it links to version v19.0 of dlib.
The reason for this is that higher versions contain std C++11 entities that are not currently supported by NDK. If one tries to use a higher
version of dlib, they will get errors related to several std library members, such as _std::round_ .

## Android.mk ##
LOCAL_MODULE     := dlib  
This defines the module name, to be referenced by your Android application

LOCAL_C_INCLUDES := ../dlib_v19.0  
This defines the subpath where the dlib code lies.  
**NOTE** : As dlib documentation explains, it is important not to include the _dlib_ subfolder in this path. The source code of dlib lies
in the _dlib_ subfolder of the dlib project repository. If the above path were _../dlib_v19.0/dlib/_ we would be getting all sorts
of compilation errors as the source code contains header files that may clash with the standard header files, such as string.h. Therefore, 
we stop one folder higher.

LOCAL_SRC_FILES  :=  
This defines the source files that will be compiled. The list contains the basic files that one will need in order to link their Android 
project with dlib. If one needs more source files, either add them to your local Dlib4Android clone or in your Android project.

## Application.mk ##
APP_CPPFLAGS := -frtti -fexceptions -std=c++11  
It is important to have enable C++11 compilation with_-std=c++11_ as dlib uses C++11 features.

For the rest of the flags, feel free to pass your own processor architectures and android SDK versions.
# How to use Dlib4Android #
1. Download the [ndk toolset](https://developer.android.com/ndk/downloads/index.html) if you do not already have it installed
2. Go to your local Dlib4Android folder and do  
_ndk-build -j2_   
You need to make sure you have the ndk toolset in your _$PATH_
3. Copy the libraries from the _libs_ folder to your Android project 
