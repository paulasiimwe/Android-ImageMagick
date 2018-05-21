LOCAL_PATH := $(call my-dir)

IMAGE_MAGICK 	    := ImageMagick-6.7.3-0/
JPEG_SRC_PATH 		:= jpeg-9b/
PHYSFS_SRC_PATH 	:= physfs-2.0.2/
PNG_SRC_PATH 		:= libpng-1.5.26/
TIFF_SRC_PATH 		:= tiff-3.9.5/
FREETYPE_SRC_PATH	:= freetype2-android/
ZLIB_SRC_PATH	    := zlib128/
WEBP_SRC_PATH	    := libwebp-0.3.1/
JASPER_SRC_PATH	    := jasper-1.900.1/

############################################################################################################################################################################################
#libjpego
include $(CLEAR_VARS)

LOCAL_MODULE    := libjpego
LOCAL_MODULE_FILENAME := libjpego

LOCAL_C_INCLUDES  :=  \
	${JPEG_SRC_PATH} 

LOCAL_SRC_FILES := \
        ${JPEG_SRC_PATH}jcapimin.c ${JPEG_SRC_PATH}jcapistd.c ${JPEG_SRC_PATH}jccoefct.c ${JPEG_SRC_PATH}jccolor.c ${JPEG_SRC_PATH}jcdctmgr.c ${JPEG_SRC_PATH}jchuff.c \
        ${JPEG_SRC_PATH}jcinit.c ${JPEG_SRC_PATH}jcmainct.c ${JPEG_SRC_PATH}jcmarker.c ${JPEG_SRC_PATH}jcmaster.c ${JPEG_SRC_PATH}jcomapi.c ${JPEG_SRC_PATH}jcparam.c \
        ${JPEG_SRC_PATH}jcprepct.c ${JPEG_SRC_PATH}jcsample.c ${JPEG_SRC_PATH}jctrans.c ${JPEG_SRC_PATH}jdapimin.c ${JPEG_SRC_PATH}jdapistd.c \
        ${JPEG_SRC_PATH}jdatadst.c ${JPEG_SRC_PATH}jdatasrc.c ${JPEG_SRC_PATH}jdcoefct.c ${JPEG_SRC_PATH}jdcolor.c ${JPEG_SRC_PATH}jddctmgr.c ${JPEG_SRC_PATH}jdhuff.c \
        ${JPEG_SRC_PATH}jdinput.c ${JPEG_SRC_PATH}jdmainct.c ${JPEG_SRC_PATH}jdmarker.c ${JPEG_SRC_PATH}jdmaster.c ${JPEG_SRC_PATH}jdmerge.c \
        ${JPEG_SRC_PATH}jdpostct.c ${JPEG_SRC_PATH}jdsample.c ${JPEG_SRC_PATH}jdtrans.c ${JPEG_SRC_PATH}jerror.c ${JPEG_SRC_PATH}jfdctflt.c ${JPEG_SRC_PATH}jfdctfst.c \
        ${JPEG_SRC_PATH}jfdctint.c ${JPEG_SRC_PATH}jidctflt.c ${JPEG_SRC_PATH}jidctfst.c ${JPEG_SRC_PATH}jidctint.c ${JPEG_SRC_PATH}jquant1.c \
        ${JPEG_SRC_PATH}jquant2.c ${JPEG_SRC_PATH}jutils.c ${JPEG_SRC_PATH}jmemmgr.c ${JPEG_SRC_PATH}jcarith.c ${JPEG_SRC_PATH}jdarith.c ${JPEG_SRC_PATH}jaricom.c \
        ${JPEG_SRC_PATH}jmemnobs.c
       

LOCAL_EXPORT_C_INCLUDES := $(LOCAL_PATH)

include $(BUILD_STATIC_LIBRARY)


############################################################################################################################################################################################
#libtiff
include $(CLEAR_VARS)

LOCAL_MODULE    := libtiff
LOCAL_CFLAGS    := -g -Dlinux -DFT2_BUILD_LIBRARY=1 -DPHYSFS_NO_CDROM_SUPPORT=1 -DAL_ALEXT_PROTOTYPES=1 -DHAVE_GCC_DESTRUCTOR=1 -DOPT_GENERIC -DREAL_IS_FLOAT
LOCAL_CPPFLAGS  := ${LOCAL_CFLAGS}

LOCAL_C_INCLUDES  :=  \
	${TIFF_SRC_PATH}libtiff/ \
	${JPEG_SRC_PATH} \
		
LOCAL_SRC_FILES := \
	${TIFF_SRC_PATH}libtiff/tif_dir.c \
	${TIFF_SRC_PATH}libtiff/tif_codec.c \
	${TIFF_SRC_PATH}libtiff/tif_predict.c \
	${TIFF_SRC_PATH}libtiff/tif_tile.c \
	${TIFF_SRC_PATH}libtiff/tif_version.c \
	${TIFF_SRC_PATH}libtiff/tif_unix.c \
	${TIFF_SRC_PATH}libtiff/tif_swab.c \
	${TIFF_SRC_PATH}libtiff/tif_thunder.c \
	${TIFF_SRC_PATH}libtiff/tif_next.c \
	${TIFF_SRC_PATH}libtiff/tif_strip.c \
	${TIFF_SRC_PATH}libtiff/tif_extension.c \
	${TIFF_SRC_PATH}libtiff/tif_error.c \
	${TIFF_SRC_PATH}libtiff/tif_dirwrite.c \
	${TIFF_SRC_PATH}libtiff/tif_fax3sm.c \
	${TIFF_SRC_PATH}libtiff/tif_ojpeg.c \
	${TIFF_SRC_PATH}libtiff/tif_flush.c \
	${TIFF_SRC_PATH}libtiff/tif_warning.c \
	${TIFF_SRC_PATH}libtiff/tif_fax3.c \
	${TIFF_SRC_PATH}libtiff/tif_jbig.c \
	${TIFF_SRC_PATH}libtiff/tif_open.c \
	${TIFF_SRC_PATH}libtiff/tif_write.c \
	${TIFF_SRC_PATH}libtiff/tif_packbits.c \
	${TIFF_SRC_PATH}libtiff/tif_compress.c \
	${TIFF_SRC_PATH}libtiff/tif_color.c \
	${TIFF_SRC_PATH}libtiff/tif_print.c \
	${TIFF_SRC_PATH}libtiff/tif_zip.c \
	${TIFF_SRC_PATH}libtiff/tif_aux.c \
	${TIFF_SRC_PATH}libtiff/tif_dumpmode.c \
	${TIFF_SRC_PATH}libtiff/tif_dirread.c \
	${TIFF_SRC_PATH}libtiff/tif_getimage.c \
	${TIFF_SRC_PATH}libtiff/tif_jpeg.c \
	${TIFF_SRC_PATH}libtiff/tif_close.c \
	${TIFF_SRC_PATH}libtiff/tif_read.c \
	${TIFF_SRC_PATH}libtiff/tif_luv.c \
	${TIFF_SRC_PATH}libtiff/tif_dirinfo.c \
	${TIFF_SRC_PATH}libtiff/tif_lzw.c \
	${TIFF_SRC_PATH}libtiff/tif_pixarlog.c \
	${TIFF_SRC_PATH}port/lfind.c 

LOCAL_LDLIBS    := -llog -L../lib -lGLESv1_CM



LOCAL_STATIC_LIBRARIES := \
 libjpego \
 libphysfs

include $(BUILD_STATIC_LIBRARY)

############################################################################################################################################################################################
#libfreetype
include $(CLEAR_VARS)

LOCAL_MODULE    := libfreetype
LOCAL_CFLAGS    := -g -Dlinux -DFT2_BUILD_LIBRARY=1 -DPHYSFS_NO_CDROM_SUPPORT=1 -DAL_ALEXT_PROTOTYPES=1 -DHAVE_GCC_DESTRUCTOR=1 -DOPT_GENERIC -DREAL_IS_FLOAT
LOCAL_CPPFLAGS  := ${LOCAL_CFLAGS}

LOCAL_C_INCLUDES  :=  \
	$(FREETYPE_SRC_PATH)include \
	$(FREETYPE_SRC_PATH)src \
		
LOCAL_SRC_FILES := \
    $(FREETYPE_SRC_PATH)src/autofit/autofit.c \
    $(FREETYPE_SRC_PATH)src/base/basepic.c \
    $(FREETYPE_SRC_PATH)src/base/ftapi.c \
    $(FREETYPE_SRC_PATH)src/base/ftbase.c \
    $(FREETYPE_SRC_PATH)src/base/ftbbox.c \
    $(FREETYPE_SRC_PATH)src/base/ftbitmap.c \
    $(FREETYPE_SRC_PATH)src/base/ftdbgmem.c \
    $(FREETYPE_SRC_PATH)src/base/ftdebug.c \
    $(FREETYPE_SRC_PATH)src/base/ftglyph.c \
    $(FREETYPE_SRC_PATH)src/base/ftinit.c \
    $(FREETYPE_SRC_PATH)src/base/ftpic.c \
    $(FREETYPE_SRC_PATH)src/base/ftstroke.c \
    $(FREETYPE_SRC_PATH)src/base/ftsynth.c \
    $(FREETYPE_SRC_PATH)src/base/ftsystem.c \
    $(FREETYPE_SRC_PATH)src/cff/cff.c \
    $(FREETYPE_SRC_PATH)src/pshinter/pshinter.c \
    $(FREETYPE_SRC_PATH)src/psnames/psnames.c \
    $(FREETYPE_SRC_PATH)src/raster/raster.c \
    $(FREETYPE_SRC_PATH)src/sfnt/sfnt.c \
    $(FREETYPE_SRC_PATH)src/smooth/smooth.c \
    $(FREETYPE_SRC_PATH)src/truetype/truetype.c 

LOCAL_LDLIBS    := -llog -L../lib -lGLESv1_CM


LOCAL_STATIC_LIBRARIES :=  

include $(BUILD_STATIC_LIBRARY)

############################################################################################################################################################################################
#libphysfs
include $(CLEAR_VARS)

LOCAL_MODULE    := libphysfs
LOCAL_CFLAGS    := -g -Dlinux -Dunix -DFT2_BUILD_LIBRARY=1 -DPHYSFS_NO_CDROM_SUPPORT=1 -DAL_ALEXT_PROTOTYPES=1 -DHAVE_GCC_DESTRUCTOR=1 -DOPT_GENERIC -DREAL_IS_FLOAT \
					-DPHYSFS_SUPPORTS_APK=1 -DPHYSFS_SUPPORTS_ZIP=1 -DPHYSFS_SUPPORTS_ZIP=1 -DPHYSFS_SUPPORTS_7Z=1 -DPHYSFS_SUPPORTS_GRP=1 -DPHYSFS_SUPPORTS_QPAK=1 -DPHYSFS_SUPPORTS_HOG=1 -DPHYSFS_SUPPORTS_MVL=1 -DPHYSFS_SUPPORTS_WAD=1

LOCAL_CPPFLAGS  := ${LOCAL_CFLAGS}

LOCAL_C_INCLUDES  :=  \
	${PHYSFS_SRC_PATH} 
		
LOCAL_SRC_FILES := \
	${PHYSFS_SRC_PATH}/physfs.c \
	${PHYSFS_SRC_PATH}/physfs_byteorder.c \
	${PHYSFS_SRC_PATH}/physfs_unicode.c \
	${PHYSFS_SRC_PATH}/platform/os2.c \
	${PHYSFS_SRC_PATH}/platform/pocketpc.c \
	${PHYSFS_SRC_PATH}/platform/posix.c \
	${PHYSFS_SRC_PATH}/platform/unix.c \
	${PHYSFS_SRC_PATH}/platform/macosx.c \
	${PHYSFS_SRC_PATH}/platform/windows.c \
	${PHYSFS_SRC_PATH}/archivers/dir.c \
	${PHYSFS_SRC_PATH}/archivers/grp.c \
	${PHYSFS_SRC_PATH}/archivers/hog.c \
	${PHYSFS_SRC_PATH}/archivers/lzma.c \
	${PHYSFS_SRC_PATH}/archivers/mvl.c \
	${PHYSFS_SRC_PATH}/archivers/qpak.c \
	${PHYSFS_SRC_PATH}/archivers/wad.c \
	${PHYSFS_SRC_PATH}/archivers/zip.c \
	${PHYSFS_SRC_PATH}/archivers/apk.c \
	${PHYSFS_SRC_PATH}/lzma/C/7zCrc.c \
	${PHYSFS_SRC_PATH}/lzma/C/Archive/7z/7zBuffer.c \
	${PHYSFS_SRC_PATH}/lzma/C/Archive/7z/7zDecode.c \
	${PHYSFS_SRC_PATH}/lzma/C/Archive/7z/7zExtract.c \
	${PHYSFS_SRC_PATH}/lzma/C/Archive/7z/7zHeader.c \
	${PHYSFS_SRC_PATH}/lzma/C/Archive/7z/7zIn.c \
	${PHYSFS_SRC_PATH}/lzma/C/Archive/7z/7zItem.c \
	${PHYSFS_SRC_PATH}/lzma/C/Archive/7z/7zMethodID.c \
	${PHYSFS_SRC_PATH}/lzma/C/Compress/Branch/BranchX86.c \
	${PHYSFS_SRC_PATH}/lzma/C/Compress/Branch/BranchX86_2.c \
	${PHYSFS_SRC_PATH}/lzma/C/Compress/Lzma/LzmaDecode.c \
	${PHYSFS_SRC_PATH}/zlib123/adler32.c \
	${PHYSFS_SRC_PATH}/zlib123/compress.c \
	${PHYSFS_SRC_PATH}/zlib123/crc32.c \
	${PHYSFS_SRC_PATH}/zlib123/deflate.c \
	${PHYSFS_SRC_PATH}/zlib123/gzio.c \
	${PHYSFS_SRC_PATH}/zlib123/infback.c \
	${PHYSFS_SRC_PATH}/zlib123/inffast.c \
	${PHYSFS_SRC_PATH}/zlib123/inflate.c \
	${PHYSFS_SRC_PATH}/zlib123/inftrees.c \
	${PHYSFS_SRC_PATH}/zlib123/trees.c \
	${PHYSFS_SRC_PATH}/zlib123/uncompr.c \
	${PHYSFS_SRC_PATH}/zlib123/zutil.c \

LOCAL_LDLIBS    := -llog -L../lib -lGLESv1_CM



LOCAL_STATIC_LIBRARIES :=
 

include $(BUILD_STATIC_LIBRARY)
############################################################################################################################################################################################


##libpngo
include $(CLEAR_VARS)

LOCAL_MODULE    := libpngo
LOCAL_CFLAGS    := -g -Dlinux -DFT2_BUILD_LIBRARY=1 -DPHYSFS_NO_CDROM_SUPPORT=1 -DAL_ALEXT_PROTOTYPES=1 -DHAVE_GCC_DESTRUCTOR=1 -DOPT_GENERIC -DREAL_IS_FLOAT
LOCAL_CPPFLAGS  := ${LOCAL_CFLAGS}

LOCAL_C_INCLUDES  :=  \
	${PNG_SRC_PATH} \
		
LOCAL_SRC_FILES := \
	${PNG_SRC_PATH}pngerror.c \
	${PNG_SRC_PATH}pngwio.c \
	${PNG_SRC_PATH}pngwrite.c \
	${PNG_SRC_PATH}pngwutil.c \
	${PNG_SRC_PATH}pngwtran.c \
	${PNG_SRC_PATH}pngset.c \
	${PNG_SRC_PATH}pngtrans.c \
	${PNG_SRC_PATH}example.c \
	${PNG_SRC_PATH}png.c \
	${PNG_SRC_PATH}pngrtran.c \
	${PNG_SRC_PATH}pngmem.c \
	${PNG_SRC_PATH}pngpread.c \
	${PNG_SRC_PATH}pngrutil.c \
	${PNG_SRC_PATH}pngrio.c \
	${PNG_SRC_PATH}pngget.c \
	${PNG_SRC_PATH}pngread.c \

LOCAL_LDLIBS    := -llog -L../lib -lGLESv1_CM



LOCAL_STATIC_LIBRARIES := \
 libphysfs

include $(BUILD_STATIC_LIBRARY)


############################################################################################################################################################################################
#libwebpo


include $(CLEAR_VARS)

LOCAL_MODULE    := libwebpo

LOCAL_SRC_FILES := \
    $(WEBP_SRC_PATH)src/dec/alpha.c \
    $(WEBP_SRC_PATH)src/dec/buffer.c \
    $(WEBP_SRC_PATH)src/dec/frame.c \
    $(WEBP_SRC_PATH)src/dec/idec.c \
    $(WEBP_SRC_PATH)src/dec/io.c \
    $(WEBP_SRC_PATH)src/dec/layer.c \
    $(WEBP_SRC_PATH)src/dec/quant.c \
    $(WEBP_SRC_PATH)src/dec/tree.c \
    $(WEBP_SRC_PATH)src/dec/vp8.c \
    $(WEBP_SRC_PATH)src/dec/vp8l.c \
    $(WEBP_SRC_PATH)src/dec/webp.c \
    $(WEBP_SRC_PATH)src/dsp/cpu.c \
    $(WEBP_SRC_PATH)src/dsp/dec.c \
    $(WEBP_SRC_PATH)src/dsp/dec_sse2.c \
    $(WEBP_SRC_PATH)src/dsp/enc.c \
    $(WEBP_SRC_PATH)src/dsp/enc_sse2.c \
    $(WEBP_SRC_PATH)src/dsp/lossless.c \
    $(WEBP_SRC_PATH)src/dsp/upsampling.c \
    $(WEBP_SRC_PATH)src/dsp/upsampling_sse2.c \
    $(WEBP_SRC_PATH)src/dsp/yuv.c \
    $(WEBP_SRC_PATH)src/enc/alpha.c \
    $(WEBP_SRC_PATH)src/enc/analysis.c \
    $(WEBP_SRC_PATH)src/enc/backward_references.c \
    $(WEBP_SRC_PATH)src/enc/config.c \
    $(WEBP_SRC_PATH)src/enc/cost.c \
    $(WEBP_SRC_PATH)src/enc/filter.c \
    $(WEBP_SRC_PATH)src/enc/frame.c \
    $(WEBP_SRC_PATH)src/enc/histogram.c \
    $(WEBP_SRC_PATH)src/enc/iterator.c \
    $(WEBP_SRC_PATH)src/enc/layer.c \
    $(WEBP_SRC_PATH)src/enc/picture.c \
    $(WEBP_SRC_PATH)src/enc/quant.c \
    $(WEBP_SRC_PATH)src/enc/syntax.c \
    $(WEBP_SRC_PATH)src/enc/token.c \
    $(WEBP_SRC_PATH)src/enc/tree.c \
    $(WEBP_SRC_PATH)src/enc/vp8l.c \
    $(WEBP_SRC_PATH)src/enc/webpenc.c \
    $(WEBP_SRC_PATH)src/utils/bit_reader.c \
    $(WEBP_SRC_PATH)src/utils/bit_writer.c \
    $(WEBP_SRC_PATH)src/utils/color_cache.c \
    $(WEBP_SRC_PATH)src/utils/filters.c \
    $(WEBP_SRC_PATH)src/utils/huffman.c \
    $(WEBP_SRC_PATH)src/utils/huffman_encode.c \
    $(WEBP_SRC_PATH)src/utils/quant_levels.c \
    $(WEBP_SRC_PATH)src/utils/quant_levels_dec.c \
    $(WEBP_SRC_PATH)src/utils/rescaler.c \
    $(WEBP_SRC_PATH)src/utils/thread.c \
    $(WEBP_SRC_PATH)src/utils/utils.c \

LOCAL_CFLAGS := -Wall -DANDROID -DHAVE_MALLOC_H -DHAVE_PTHREAD \
                -DWEBP_USE_THREAD \
                -finline-functions -frename-registers -ffast-math \
                -s -fomit-frame-pointer -Isrc/webp

LOCAL_C_INCLUDES += $(WEBP_SRC_PATH)src

ifeq ($(TARGET_ARCH_ABI),armeabi-v7a)
  # Setting LOCAL_ARM_NEON will enable -mfpu=neon which may cause illegal
  # instructions to be generated for armv7a code. Instead target the neon code
  # specifically.
  LOCAL_SRC_FILES += $(WEBP_SRC_PATH)src/dsp/dec_neon.c.neon
  LOCAL_SRC_FILES += $(WEBP_SRC_PATH)src/dsp/upsampling_neon.c.neon
  LOCAL_SRC_FILES += $(WEBP_SRC_PATH)src/dsp/enc_neon.c.neon
endif


LOCAL_STATIC_LIBRARIES := cpufeatures
 

include $(BUILD_STATIC_LIBRARY)


############################################################################################################################################################################################
#libjasper
include $(CLEAR_VARS)

LOCAL_MODULE    := libjasper
LOCAL_CFLAGS    := -g -Dlinux -DFT2_BUILD_LIBRARY=1 -DPHYSFS_NO_CDROM_SUPPORT=1 -DAL_ALEXT_PROTOTYPES=1 -DHAVE_GCC_DESTRUCTOR=1 -DOPT_GENERIC -DREAL_IS_FLOAT
LOCAL_CPPFLAGS  := ${LOCAL_CFLAGS}

LOCAL_C_INCLUDES  :=  \
	${JASPER_SRC_PATH}src/libjasper/include \
	${JPEG_SRC_PATH} \
		
LOCAL_SRC_FILES := \
	${JASPER_SRC_PATH}src/libjasper/base/jas_cm.c \
	${JASPER_SRC_PATH}src/libjasper/base/jas_getopt.c \
	${JASPER_SRC_PATH}src/libjasper/base/jas_seq.c \
	${JASPER_SRC_PATH}src/libjasper/base/jas_malloc.c \
	${JASPER_SRC_PATH}src/libjasper/base/jas_init.c \
	${JASPER_SRC_PATH}src/libjasper/base/jas_debug.c \
	${JASPER_SRC_PATH}src/libjasper/base/jas_stream.c \
	${JASPER_SRC_PATH}src/libjasper/base/jas_string.c \
	${JASPER_SRC_PATH}src/libjasper/base/jas_version.c \
	${JASPER_SRC_PATH}src/libjasper/base/jas_tmr.c \
	${JASPER_SRC_PATH}src/libjasper/base/jas_image.c \
	${JASPER_SRC_PATH}src/libjasper/base/jas_tvp.c \
	${JASPER_SRC_PATH}src/libjasper/base/jas_iccdata.c \
	${JASPER_SRC_PATH}src/libjasper/base/jas_icc.c \
	${JASPER_SRC_PATH}src/libjasper/jpc/jpc_mqcod.c \
	${JASPER_SRC_PATH}src/libjasper/jpc/jpc_t1enc.c \
	${JASPER_SRC_PATH}src/libjasper/jpc/jpc_dec.c \
	${JASPER_SRC_PATH}src/libjasper/jpc/jpc_math.c \
	${JASPER_SRC_PATH}src/libjasper/jpc/jpc_util.c \
	${JASPER_SRC_PATH}src/libjasper/jpc/jpc_bs.c \
	${JASPER_SRC_PATH}src/libjasper/jpc/jpc_tagtree.c \
	${JASPER_SRC_PATH}src/libjasper/jpc/jpc_t1cod.c \
	${JASPER_SRC_PATH}src/libjasper/jpc/jpc_t2enc.c \
	${JASPER_SRC_PATH}src/libjasper/jpc/jpc_mqenc.c \
	${JASPER_SRC_PATH}src/libjasper/jpc/jpc_enc.c \
	${JASPER_SRC_PATH}src/libjasper/jpc/jpc_qmfb.c \
	${JASPER_SRC_PATH}src/libjasper/jpc/jpc_t1dec.c \
	${JASPER_SRC_PATH}src/libjasper/jpc/jpc_cs.c \
	${JASPER_SRC_PATH}src/libjasper/jpc/jpc_t2cod.c \
	${JASPER_SRC_PATH}src/libjasper/jpc/jpc_tsfb.c \
	${JASPER_SRC_PATH}src/libjasper/jpc/jpc_mqdec.c \
	${JASPER_SRC_PATH}src/libjasper/jpc/jpc_t2dec.c \
	${JASPER_SRC_PATH}src/libjasper/jpc/jpc_mct.c \
	${JASPER_SRC_PATH}src/libjasper/dummy.c \
	${JASPER_SRC_PATH}src/libjasper/pnm/pnm_dec.c \
	${JASPER_SRC_PATH}src/libjasper/pnm/pnm_enc.c \
	${JASPER_SRC_PATH}src/libjasper/pnm/pnm_cod.c \
	${JASPER_SRC_PATH}src/libjasper/jp2/jp2_enc.c \
	${JASPER_SRC_PATH}src/libjasper/jp2/jp2_cod.c \
	${JASPER_SRC_PATH}src/libjasper/jp2/jp2_dec.c \
	${JASPER_SRC_PATH}src/libjasper/pgx/pgx_dec.c \
	${JASPER_SRC_PATH}src/libjasper/pgx/pgx_enc.c \
	${JASPER_SRC_PATH}src/libjasper/pgx/pgx_cod.c \
	${JASPER_SRC_PATH}src/libjasper/bmp/bmp_enc.c \
	${JASPER_SRC_PATH}src/libjasper/bmp/bmp_dec.c \
	${JASPER_SRC_PATH}src/libjasper/bmp/bmp_cod.c \
	${JASPER_SRC_PATH}src/libjasper/jpg/jpg_val.c \
	${JASPER_SRC_PATH}src/libjasper/jpg/jpg_enc.c \
	${JASPER_SRC_PATH}src/libjasper/jpg/jpg_dec.c \
	${JASPER_SRC_PATH}src/libjasper/ras/ras_cod.c \
	${JASPER_SRC_PATH}src/libjasper/ras/ras_dec.c \
	${JASPER_SRC_PATH}src/libjasper/ras/ras_enc.c \
	${JASPER_SRC_PATH}src/libjasper/mif/mif_cod.c \

LOCAL_LDLIBS    := -llog -L../lib -lGLESv1_CM



LOCAL_STATIC_LIBRARIES := \
 libjpego

include $(BUILD_STATIC_LIBRARY)


############################################################################################################################################################################################
#magick
include $(CLEAR_VARS)

LOCAL_MODULE    := magick
LOCAL_CFLAGS += -DHAVE_CONFIG_H -DXLOCALE_NOT_USED
LOCAL_C_INCLUDES  :=  \
	$(IMAGE_MAGICK) \
	$(IMAGE_MAGICK)magick \
	${PNG_SRC_PATH} \
	$(FREETYPE_SRC_PATH)include \
	$(FREETYPE_SRC_PATH)src \
	${TIFF_SRC_PATH}libtiff/ \
	${JPEG_SRC_PATH} \
	${PHYSFS_SRC_PATH} \
	$(WEBP_SRC_PATH)src \
	${JASPER_SRC_PATH}src/libjasper/include \

LOCAL_SRC_FILES := \
	$(IMAGE_MAGICK)coders/aai.c \
	$(IMAGE_MAGICK)coders/art.c \
	$(IMAGE_MAGICK)coders/avs.c \
	$(IMAGE_MAGICK)coders/bgr.c \
	$(IMAGE_MAGICK)coders/bmp.c \
	$(IMAGE_MAGICK)coders/braille.c \
	$(IMAGE_MAGICK)coders/cals.c \
	$(IMAGE_MAGICK)coders/caption.c \
	$(IMAGE_MAGICK)coders/cin.c \
	$(IMAGE_MAGICK)coders/cip.c \
	$(IMAGE_MAGICK)coders/clip.c \
	$(IMAGE_MAGICK)coders/clipboard.c \
	$(IMAGE_MAGICK)coders/cmyk.c \
	$(IMAGE_MAGICK)coders/cut.c \
	$(IMAGE_MAGICK)coders/dcm.c \
	$(IMAGE_MAGICK)coders/dds.c \
	$(IMAGE_MAGICK)coders/debug.c \
	$(IMAGE_MAGICK)coders/dib.c \
	$(IMAGE_MAGICK)coders/dng.c \
	$(IMAGE_MAGICK)coders/dps.c \
	$(IMAGE_MAGICK)coders/dpx.c \
	$(IMAGE_MAGICK)coders/emf.c \
	$(IMAGE_MAGICK)coders/ept.c \
	$(IMAGE_MAGICK)coders/exr.c \
	$(IMAGE_MAGICK)coders/fax.c \
	$(IMAGE_MAGICK)coders/fits.c \
	$(IMAGE_MAGICK)coders/fpx.c \
	$(IMAGE_MAGICK)coders/gif.c \
	$(IMAGE_MAGICK)coders/gradient.c \
	$(IMAGE_MAGICK)coders/gray.c \
	$(IMAGE_MAGICK)coders/hald.c \
	$(IMAGE_MAGICK)coders/hdr.c \
	$(IMAGE_MAGICK)coders/histogram.c \
	$(IMAGE_MAGICK)coders/hrz.c \
	$(IMAGE_MAGICK)coders/html.c \
	$(IMAGE_MAGICK)coders/icon.c \
	$(IMAGE_MAGICK)coders/info.c \
	$(IMAGE_MAGICK)coders/inline.c \
	$(IMAGE_MAGICK)coders/ipl.c \
	$(IMAGE_MAGICK)coders/jbig.c \
	$(IMAGE_MAGICK)coders/jp2.c \
	$(IMAGE_MAGICK)coders/jpeg.c \
	$(IMAGE_MAGICK)coders/label.c \
	$(IMAGE_MAGICK)coders/mac.c \
	$(IMAGE_MAGICK)coders/magick.c \
	$(IMAGE_MAGICK)coders/map.c \
	$(IMAGE_MAGICK)coders/mat.c \
	$(IMAGE_MAGICK)coders/matte.c \
	$(IMAGE_MAGICK)coders/meta.c \
	$(IMAGE_MAGICK)coders/mono.c \
	$(IMAGE_MAGICK)coders/mpc.c \
	$(IMAGE_MAGICK)coders/mpeg.c \
	$(IMAGE_MAGICK)coders/mpr.c \
	$(IMAGE_MAGICK)coders/msl.c \
	$(IMAGE_MAGICK)coders/mtv.c \
	$(IMAGE_MAGICK)coders/mvg.c \
	$(IMAGE_MAGICK)coders/null.c \
	$(IMAGE_MAGICK)coders/otb.c \
	$(IMAGE_MAGICK)coders/palm.c \
	$(IMAGE_MAGICK)coders/pattern.c \
	$(IMAGE_MAGICK)coders/pcd.c \
	$(IMAGE_MAGICK)coders/pcl.c \
	$(IMAGE_MAGICK)coders/pcx.c \
	$(IMAGE_MAGICK)coders/pdb.c \
	$(IMAGE_MAGICK)coders/pdf.c \
	$(IMAGE_MAGICK)coders/pes.c \
	$(IMAGE_MAGICK)coders/pict.c \
	$(IMAGE_MAGICK)coders/pix.c \
	$(IMAGE_MAGICK)coders/plasma.c \
	$(IMAGE_MAGICK)coders/png.c \
	$(IMAGE_MAGICK)coders/pnm.c \
	$(IMAGE_MAGICK)coders/preview.c \
	$(IMAGE_MAGICK)coders/ps.c \
	$(IMAGE_MAGICK)coders/ps2.c \
	$(IMAGE_MAGICK)coders/ps3.c \
	$(IMAGE_MAGICK)coders/psd.c \
	$(IMAGE_MAGICK)coders/pwp.c \
	$(IMAGE_MAGICK)coders/raw.c \
	$(IMAGE_MAGICK)coders/rgb.c \
	$(IMAGE_MAGICK)coders/rla.c \
	$(IMAGE_MAGICK)coders/rle.c \
	$(IMAGE_MAGICK)coders/scr.c \
	$(IMAGE_MAGICK)coders/sct.c \
	$(IMAGE_MAGICK)coders/sfw.c \
	$(IMAGE_MAGICK)coders/sgi.c \
	$(IMAGE_MAGICK)coders/stegano.c \
	$(IMAGE_MAGICK)coders/sun.c \
	$(IMAGE_MAGICK)coders/svg.c \
	$(IMAGE_MAGICK)coders/tga.c \
	$(IMAGE_MAGICK)coders/thumbnail.c \
	$(IMAGE_MAGICK)coders/tiff.c \
	$(IMAGE_MAGICK)coders/tile.c \
	$(IMAGE_MAGICK)coders/tim.c \
	$(IMAGE_MAGICK)coders/ttf.c \
	$(IMAGE_MAGICK)coders/txt.c \
	$(IMAGE_MAGICK)coders/uil.c \
	$(IMAGE_MAGICK)coders/url.c \
	$(IMAGE_MAGICK)coders/uyvy.c \
	$(IMAGE_MAGICK)coders/vicar.c \
	$(IMAGE_MAGICK)coders/vid.c \
	$(IMAGE_MAGICK)coders/viff.c \
	$(IMAGE_MAGICK)coders/wbmp.c \
	$(IMAGE_MAGICK)coders/webp.c \
	$(IMAGE_MAGICK)coders/wmf.c \
	$(IMAGE_MAGICK)coders/wpg.c \
	$(IMAGE_MAGICK)coders/x.c \
	$(IMAGE_MAGICK)coders/xbm.c \
	$(IMAGE_MAGICK)coders/xc.c \
	$(IMAGE_MAGICK)coders/xcf.c \
	$(IMAGE_MAGICK)coders/xpm.c \
	$(IMAGE_MAGICK)coders/xps.c \
	$(IMAGE_MAGICK)coders/xwd.c \
	$(IMAGE_MAGICK)coders/ycbcr.c \
	$(IMAGE_MAGICK)coders/yuv.c \
	$(IMAGE_MAGICK)filters/analyze.c \
	$(IMAGE_MAGICK)magick/PreRvIcccm.c \
	$(IMAGE_MAGICK)magick/accelerate.c \
	$(IMAGE_MAGICK)magick/animate.c \
	$(IMAGE_MAGICK)magick/annotate.c \
	$(IMAGE_MAGICK)magick/artifact.c \
	$(IMAGE_MAGICK)magick/attribute.c \
	$(IMAGE_MAGICK)magick/blob.c \
	$(IMAGE_MAGICK)magick/cache-view.c \
	$(IMAGE_MAGICK)magick/cache.c \
	$(IMAGE_MAGICK)magick/cipher.c \
	$(IMAGE_MAGICK)magick/client.c \
	$(IMAGE_MAGICK)magick/coder.c \
	$(IMAGE_MAGICK)magick/color.c \
	$(IMAGE_MAGICK)magick/colormap.c \
	$(IMAGE_MAGICK)magick/colorspace.c \
	$(IMAGE_MAGICK)magick/compare.c \
	$(IMAGE_MAGICK)magick/composite.c \
	$(IMAGE_MAGICK)magick/compress.c \
	$(IMAGE_MAGICK)magick/configure.c \
	$(IMAGE_MAGICK)magick/constitute.c \
	$(IMAGE_MAGICK)magick/decorate.c \
	$(IMAGE_MAGICK)magick/delegate.c \
	$(IMAGE_MAGICK)magick/deprecate.c \
	$(IMAGE_MAGICK)magick/display.c \
	$(IMAGE_MAGICK)magick/distort.c \
	$(IMAGE_MAGICK)magick/draw.c \
	$(IMAGE_MAGICK)magick/effect.c \
	$(IMAGE_MAGICK)magick/enhance.c \
	$(IMAGE_MAGICK)magick/exception.c \
	$(IMAGE_MAGICK)magick/feature.c \
	$(IMAGE_MAGICK)magick/fourier.c \
	$(IMAGE_MAGICK)magick/fx.c \
	$(IMAGE_MAGICK)magick/gem.c \
	$(IMAGE_MAGICK)magick/geometry.c \
	$(IMAGE_MAGICK)magick/hashmap.c \
	$(IMAGE_MAGICK)magick/histogram.c \
	$(IMAGE_MAGICK)magick/identify.c \
	$(IMAGE_MAGICK)magick/image-view.c \
	$(IMAGE_MAGICK)magick/image.c \
	$(IMAGE_MAGICK)magick/layer.c \
	$(IMAGE_MAGICK)magick/list.c \
	$(IMAGE_MAGICK)magick/locale.c \
	$(IMAGE_MAGICK)magick/log.c \
	$(IMAGE_MAGICK)magick/mac.c \
	$(IMAGE_MAGICK)magick/magic.c \
	$(IMAGE_MAGICK)magick/magick.c \
	$(IMAGE_MAGICK)magick/matrix.c \
	$(IMAGE_MAGICK)magick/memory.c \
	$(IMAGE_MAGICK)magick/mime.c \
	$(IMAGE_MAGICK)magick/module.c \
	$(IMAGE_MAGICK)magick/monitor.c \
	$(IMAGE_MAGICK)magick/montage.c \
	$(IMAGE_MAGICK)magick/morphology.c \
	$(IMAGE_MAGICK)magick/nt-base.c \
	$(IMAGE_MAGICK)magick/nt-feature.c \
	$(IMAGE_MAGICK)magick/option.c \
	$(IMAGE_MAGICK)magick/paint.c \
	$(IMAGE_MAGICK)magick/pixel.c \
	$(IMAGE_MAGICK)magick/policy.c \
	$(IMAGE_MAGICK)magick/prepress.c \
	$(IMAGE_MAGICK)magick/profile.c \
	$(IMAGE_MAGICK)magick/property.c \
	$(IMAGE_MAGICK)magick/quantize.c \
	$(IMAGE_MAGICK)magick/quantum-export.c \
	$(IMAGE_MAGICK)magick/quantum-import.c \
	$(IMAGE_MAGICK)magick/quantum.c \
	$(IMAGE_MAGICK)magick/random.c \
	$(IMAGE_MAGICK)magick/registry.c \
	$(IMAGE_MAGICK)magick/resample.c \
	$(IMAGE_MAGICK)magick/resize.c \
	$(IMAGE_MAGICK)magick/resource.c \
	$(IMAGE_MAGICK)magick/segment.c \
	$(IMAGE_MAGICK)magick/semaphore.c \
	$(IMAGE_MAGICK)magick/shear.c \
	$(IMAGE_MAGICK)magick/signature.c \
	$(IMAGE_MAGICK)magick/splay-tree.c \
	$(IMAGE_MAGICK)magick/static.c \
	$(IMAGE_MAGICK)magick/statistic.c \
	$(IMAGE_MAGICK)magick/stream.c \
	$(IMAGE_MAGICK)magick/string.c \
	$(IMAGE_MAGICK)magick/thread.c \
	$(IMAGE_MAGICK)magick/threshold.c \
	$(IMAGE_MAGICK)magick/timer.c \
	$(IMAGE_MAGICK)magick/token.c \
	$(IMAGE_MAGICK)magick/transform.c \
	$(IMAGE_MAGICK)magick/type.c \
	$(IMAGE_MAGICK)magick/utility.c \
	$(IMAGE_MAGICK)magick/version.c \
	$(IMAGE_MAGICK)magick/vms.c \
	$(IMAGE_MAGICK)magick/widget.c \
	$(IMAGE_MAGICK)magick/xml-tree.c \
	$(IMAGE_MAGICK)magick/xwindow.c \

LOCAL_LDLIBS    := -L$(SYSROOT)/usr/lib -llog

###############################
# 2016/04/17 D.Slamnig added:
#LOCAL_EXPORT_C_INCLUDES := $(LOCAL_PATH)
###############################

LOCAL_STATIC_LIBRARIES := \
    libpngo \
    libjpego \
    libwebpo \
    libfreetype \
    libtiff \
    libphysfs \
    libjasper \


include $(BUILD_STATIC_LIBRARY)

############################################################################################################################################################################################
#libimagemagick
include $(CLEAR_VARS)

LOCAL_MODULE    := libimagemagick
LOCAL_CFLAGS += -DHAVE_CONFIG_H -DXLOCALE_NOT_USED
LOCAL_C_INCLUDES  :=  \
	$(IMAGE_MAGICK) \
	$(IMAGE_MAGICK)magick \
	${PNG_SRC_PATH} \
	$(FREETYPE_SRC_PATH)include \
	$(FREETYPE_SRC_PATH)src \
	${TIFF_SRC_PATH}libtiff/ \
	${JPEG_SRC_PATH} \
	${PHYSFS_SRC_PATH} \
	$(WEBP_SRC_PATH)src \
	${JASPER_SRC_PATH}src/libjasper/include \

###########################################################################################
#
#	2016/04/22 D.Slamnig added support for setting image cache directory (magick_Cache.c)
#
###########################################################################################	
LOCAL_SRC_FILES := \
	jmagick.c \
	magick_DrawInfo.c \
	magick_ImageInfo.c \
	magick_Magick.c \
	magick_MagickImage.c \
	magick_MagickInfo.c \
	magick_MontageInfo.c \
	magick_PixelPacket.c \
	magick_QuantizeInfo.c \
	magick_MagickBitmap.c \
	magick_Cache.c

LOCAL_LDLIBS    := -L$(SYSROOT)/usr/lib -llog




LOCAL_STATIC_LIBRARIES := \
    libpngo \
    libjpego \
    libwebpo \
    libfreetype \
    libtiff \
    libphysfs \
    libjasper \
    magick \


include $(BUILD_SHARED_LIBRARY)



$(call import-module,android/cpufeatures)