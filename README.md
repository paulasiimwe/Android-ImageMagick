#ANDROID-IMAGEMAGICK

###Introduction
This Is a free to use,change and reproduce multi CPU-architecture port of ImageMagick on Android Platform, this repo provides you with the ".so" files necessary to perform android native processing using the Image Magick library version 6.7.3-0 on Android devices with Armeabi-v8a_64, Mips_64, x86_64, Armeabi, Armeabi-v7a, Intel x86 or Mips processor CPUs/ABIs.

It also provides the C/C++ code in the ImageMagick Library, its dependant libraries as well as the Android.mk files necessary for rebuilding using the Android Native Development Kit (NDK)
within the android application, 

ImageMagick methods are accessed by use of Jmagick included in the src folder, JMagick is an open source Java interface of ImageMagick. It is implemented in the form of a thin Java Native Interface (JNI) layer into the ImageMagick API. please take a look here http://sourceforge.net/projects/jmagick/
To see all features and learn how to use them please check out http://www.jmagick.org/jmagick-doc/




###USAGE:
For quick ImageMagick Usage in your android app, .....the following instructions are based on none-gradle build

1.  Simply copy the "libs" folder to your project folder
2.  Delete the CPU architecture folders of those CPU's architecure's you aren't targetting in the "libs" folder you've just copied.
3.  Go to "src" and copy "Magick" and "fakeawt", copy these to your "src" folder of your project
4.  Create a"jni" folder
5.  In the "jni" folder create an "Application.mk" file where you put "APP_ABI := <your_target_CPU_architecture>"" , this allows Google Play to know what CPU that particular APK targets
6.  Your basically done at this point, you can look at "AndroidMagickActivity.java" for basic Imagemagick usage you can copy to your own Activity.

###REBUILD:
If you want to rebuild with your own toolchain/compilers and what not or even maybe add other libraries e.g "Ghostscript" to support for PDF.

1.  Naviagate to "jni" and edit the "android.mk" file accordingly
2.  Also edit the "application.mk" file accordingly
3.  using your "Cygwin" or whatever you none Windows guys use, navigate to the project's "jni" folder and run "ndk-build" 
4.  These .so files were generated using NDK r9d.


###ISSUES:
If you'd like to contibute i'd look forward to the following improvements:

1.  sigsegv Signal 11 Crash when performing some operations like converting to pdf,svg,eps.
2.  Obviously code wasn't meant to run on Android devices so expect some unexpected crashing due to device resource limitations
3.  I'm not so good at Android NDK, im sure the experts have noticed some faults with my Android.mk file, but hey I compiled it :-)

Well, there you have it.
If it works for you don't forget to star.

###Credits
Credit to the following repositories for their components used to help me build this

1.  https://github.com/lilac/Android-ImageMagick
2.  https://github.com/puelocesar/android-lib-magick
3.  https://github.com/hagish/love-native-android


###DISCLAIMER
I'm not an expert on ImageMagick or graphics processing for that matter, more so on mobile devices, I simply built this repo for some college project at the time through alot of trial and Error.
For what it's worth, this was built on Windows 8.1 x64, Lenovo W540, using Cygwin 64bit with Android NDK, Revision 10e (May 2015).
Please note that there are no specific differences between the code used to build the 32bit .so files and those of 64bit. 


###DONATION:

Goodluck,

regards,

Paul Asiimwe,

Kampala, Uganda

http://www.google.com/+PaulAsiimwe

http://www.twitter.com/_paulasiimwe