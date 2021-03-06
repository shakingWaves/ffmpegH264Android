#compile the H264D static lib
LOCAL_PATH:= $(call my-dir)

include $(CLEAR_VARS)
LOCAL_LDLIBS :=-llog

ARM_NEON_SUPPORT := no
ifeq ($(HAVE_NEON_SPT), yes)
	ifeq ($(TARGET_ARCH_ABI), armeabi-v7a)
		LOCAL_ARM_NEON  := true 
		ARM_NEON_SUPPORT := yes
	endif
	ifeq ($(TARGET_ARCH_ABI), arm64-v8a)
		ARM_NEON_SUPPORT := yes
	endif
endif

LOCAL_C_INCLUDES :=	$(LOCAL_PATH)/../../../../libavcodec \
					$(LOCAL_PATH)/../../../../libavdevice \
					$(LOCAL_PATH)/../../../../libavfilter \
					$(LOCAL_PATH)/../../../../libavformat \
					$(LOCAL_PATH)/../../../../libavresample \
					$(LOCAL_PATH)/../../../../libavutil \
					$(LOCAL_PATH)/../../../../libpostproc \
					$(LOCAL_PATH)/../../../../libswresample \
					$(LOCAL_PATH)/../../../../libswscale \
					$(LOCAL_PATH)/../../../../

LOCAL_CFLAGS    := -g 
LOCAL_MODULE     := ffmpegH264-lib
LOCAL_SRC_FILES	:= 	../../../../libavcodec/allcodecs.c \
					../../../../libavcodec/arm/h264chroma_init_arm.c \
					../../../../libavcodec/arm/h264dsp_init_arm.c \
					../../../../libavcodec/arm/h264pred_init_arm.c \
					../../../../libavcodec/arm/h264qpel_init_arm.c \
					../../../../libavcodec/arm/idctdsp_init_arm.c \
					../../../../libavcodec/arm/idctdsp_init_armv5te.c \
					../../../../libavcodec/arm/idctdsp_init_armv6.c \
					../../../../libavcodec/arm/idctdsp_init_neon.c \
					../../../../libavcodec/arm/me_cmp_init_arm.c \
					../../../../libavcodec/arm/pixblockdsp_init_arm.c \
					../../../../libavcodec/arm/videodsp_init_arm.c \
					../../../../libavcodec/arm/videodsp_init_armv5te.c \
					../../../../libavcodec/audioconvert.c \
					../../../../libavcodec/avdct.c \
					../../../../libavcodec/avpacket.c \
					../../../../libavcodec/avpicture.c \
					../../../../libavcodec/bitstream.c \
					../../../../libavcodec/bitstream_filter.c \
					../../../../libavcodec/bitstream_filters.c \
					../../../../libavcodec/bsf.c \
					../../../../libavcodec/cabac.c \
					../../../../libavcodec/codec_desc.c \
					../../../../libavcodec/d3d11va.c \
					../../../../libavcodec/dirac.c \
					../../../../libavcodec/dv_profile.c \
					../../../../libavcodec/error_resilience.c \
					../../../../libavcodec/faandct.c \
					../../../../libavcodec/faanidct.c \
					../../../../libavcodec/fdctdsp.c \
					../../../../libavcodec/golomb.c \
					../../../../libavcodec/h2645_parse.c \
					../../../../libavcodec/h264_cabac.c \
					../../../../libavcodec/h264_cavlc.c \
					../../../../libavcodec/h264_direct.c \
					../../../../libavcodec/h264_loopfilter.c \
					../../../../libavcodec/h264_mb.c \
					../../../../libavcodec/h264_parse.c \
					../../../../libavcodec/h264_parser.c \
					../../../../libavcodec/h264_picture.c \
					../../../../libavcodec/h264_ps.c \
					../../../../libavcodec/h264_refs.c \
					../../../../libavcodec/h264_sei.c \
					../../../../libavcodec/h264_slice.c \
					../../../../libavcodec/h264chroma.c \
					../../../../libavcodec/h264data.c \
					../../../../libavcodec/h264dec.c \
					../../../../libavcodec/h264dsp.c \
					../../../../libavcodec/h264idct.c \
					../../../../libavcodec/h264pred.c \
					../../../../libavcodec/h264qpel.c \
					../../../../libavcodec/idctdsp.c \
					../../../../libavcodec/imgconvert.c \
					../../../../libavcodec/jfdctfst.c \
					../../../../libavcodec/jfdctint.c \
					../../../../libavcodec/jni.c \
					../../../../libavcodec/jrevdct.c \
					../../../../libavcodec/mathtables.c \
					../../../../libavcodec/me_cmp.c \
					../../../../libavcodec/mediacodec.c \
					../../../../libavcodec/options.c \
					../../../../libavcodec/parser.c \
					../../../../libavcodec/pixblockdsp.c \
					../../../../libavcodec/profiles.c \
					../../../../libavcodec/pthread.c \
					../../../../libavcodec/pthread_frame.c \
					../../../../libavcodec/pthread_slice.c \
					../../../../libavcodec/qsv_api.c \
					../../../../libavcodec/raw.c \
					../../../../libavcodec/resample.c \
					../../../../libavcodec/resample2.c \
					../../../../libavcodec/simple_idct.c \
					../../../../libavcodec/startcode.c \
					../../../../libavcodec/utils.c \
					../../../../libavcodec/videodsp.c \
					../../../../libavcodec/vorbis_parser.c \
					../../../../libavcodec/xiph.c \
					../../../../libavcodec/arm/h264cmc_neon.S \
					../../../../libavcodec/arm/h264dsp_neon.S \
					../../../../libavcodec/arm/h264idct_neon.S \
					../../../../libavcodec/arm/h264pred_neon.S \
					../../../../libavcodec/arm/h264qpel_neon.S \
					../../../../libavcodec/arm/hpeldsp_neon.S \
					../../../../libavcodec/arm/idctdsp_arm.S \
					../../../../libavcodec/arm/idctdsp_armv6.S \
					../../../../libavcodec/arm/idctdsp_neon.S \
					../../../../libavcodec/arm/jrevdct_arm.S \
					../../../../libavcodec/arm/me_cmp_armv6.S \
					../../../../libavcodec/arm/pixblockdsp_armv6.S \
					../../../../libavcodec/arm/simple_idct_arm.S \
					../../../../libavcodec/arm/simple_idct_armv5te.S \
					../../../../libavcodec/arm/simple_idct_armv6.S \
					../../../../libavcodec/arm/simple_idct_neon.S \
					../../../../libavcodec/arm/startcode_armv6.S \
					../../../../libavcodec/arm/videodsp_armv5te.S \
					../../../../libavdevice/alldevices.c \
					../../../../libavdevice/avdevice.c \
					../../../../libavdevice/utils.c \
					../../../../libavfilter/allfilters.c \
					../../../../libavfilter/audio.c \
					../../../../libavfilter/avfilter.c \
					../../../../libavfilter/avfiltergraph.c \
					../../../../libavfilter/buffersink.c \
					../../../../libavfilter/buffersrc.c \
					../../../../libavfilter/drawutils.c \
					../../../../libavfilter/fifo.c \
					../../../../libavfilter/formats.c \
					../../../../libavfilter/framepool.c \
					../../../../libavfilter/graphdump.c \
					../../../../libavfilter/graphparser.c \
					../../../../libavfilter/opencl_allkernels.c \
					../../../../libavfilter/pthread.c \
					../../../../libavfilter/transform.c \
					../../../../libavfilter/video.c \
					../../../../libavformat/allformats.c \
					../../../../libavformat/avio.c \
					../../../../libavformat/aviobuf.c \
					../../../../libavformat/cutils.c \
					../../../../libavformat/dump.c \
					../../../../libavformat/file.c \
					../../../../libavformat/format.c \
					../../../../libavformat/h264dec.c \
					../../../../libavformat/id3v1.c \
					../../../../libavformat/id3v2.c \
					../../../../libavformat/metadata.c \
					../../../../libavformat/mux.c \
					../../../../libavformat/options.c \
					../../../../libavformat/os_support.c \
					../../../../libavformat/protocols.c \
					../../../../libavformat/qtpalette.c \
					../../../../libavformat/rawdec.c \
					../../../../libavformat/riff.c \
					../../../../libavformat/sdp.c \
					../../../../libavformat/url.c \
					../../../../libavformat/utils.c \
					../../../../libswresample/arm/audio_convert_init.c \
					../../../../libswresample/arm/resample_init.c \
					../../../../libswresample/audioconvert.c \
					../../../../libswresample/dither.c \
					../../../../libswresample/options.c \
					../../../../libswresample/rematrix.c \
					../../../../libswresample/resample.c \
					../../../../libswresample/resample_dsp.c \
					../../../../libswresample/swresample.c \
					../../../../libswresample/swresample_frame.c \
					../../../../libswscale/alphablend.c \
					../../../../libswscale/arm/swscale.c \
					../../../../libswscale/arm/swscale_unscaled.c \
					../../../../libswscale/gamma.c \
					../../../../libswscale/hscale.c \
					../../../../libswscale/hscale_fast_bilinear.c \
					../../../../libswscale/input.c \
					../../../../libswscale/options.c \
					../../../../libswscale/output.c \
					../../../../libswscale/rgb2rgb.c \
					../../../../libswscale/slice.c \
					../../../../libswscale/swscale.c \
					../../../../libswscale/swscale_unscaled.c \
					../../../../libswscale/utils.c \
					../../../../libswscale/vscale.c \
					../../../../libswscale/yuv2rgb.c \
					../../../../libavutil/../compat/strtod.c \
					../../../../libavutil/adler32.c \
					../../../../libavutil/aes.c \
					../../../../libavutil/aes_ctr.c \
					../../../../libavutil/arm/cpu.c \
					../../../../libavutil/arm/float_dsp_init_arm.c \
					../../../../libavutil/arm/float_dsp_init_neon.c \
					../../../../libavutil/arm/float_dsp_init_vfp.c \
					../../../../libavutil/audio_fifo.c \
					../../../../libavutil/avstring.c \
					../../../../libavutil/base64.c \
					../../../../libavutil/blowfish.c \
					../../../../libavutil/bprint.c \
					../../../../libavutil/buffer.c \
					../../../../libavutil/camellia.c \
					../../../../libavutil/cast5.c \
					../../../../libavutil/channel_layout.c \
					../../../../libavutil/color_utils.c \
					../../../../libavutil/cpu.c \
					../../../../libavutil/crc.c \
					../../../../libavutil/des.c \
					../../../../libavutil/dict.c \
					../../../../libavutil/display.c \
					../../../../libavutil/downmix_info.c \
					../../../../libavutil/error.c \
					../../../../libavutil/eval.c \
					../../../../libavutil/fifo.c \
					../../../../libavutil/file.c \
					../../../../libavutil/file_open.c \
					../../../../libavutil/fixed_dsp.c \
					../../../../libavutil/float_dsp.c \
					../../../../libavutil/frame.c \
					../../../../libavutil/hash.c \
					../../../../libavutil/hmac.c \
					../../../../libavutil/hwcontext.c \
					../../../../libavutil/imgutils.c \
					../../../../libavutil/integer.c \
					../../../../libavutil/intmath.c \
					../../../../libavutil/lfg.c \
					../../../../libavutil/lls.c \
					../../../../libavutil/log.c \
					../../../../libavutil/log2_tab.c \
					../../../../libavutil/mastering_display_metadata.c \
					../../../../libavutil/mathematics.c \
					../../../../libavutil/md5.c \
					../../../../libavutil/mem.c \
					../../../../libavutil/murmur3.c \
					../../../../libavutil/opt.c \
					../../../../libavutil/parseutils.c \
					../../../../libavutil/pixdesc.c \
					../../../../libavutil/pixelutils.c \
					../../../../libavutil/random_seed.c \
					../../../../libavutil/rational.c \
					../../../../libavutil/rc4.c \
					../../../../libavutil/reverse.c \
					../../../../libavutil/ripemd.c \
					../../../../libavutil/samplefmt.c \
					../../../../libavutil/sha.c \
					../../../../libavutil/sha512.c \
					../../../../libavutil/stereo3d.c \
					../../../../libavutil/tea.c \
					../../../../libavutil/threadmessage.c \
					../../../../libavutil/time.c \
					../../../../libavutil/timecode.c \
					../../../../libavutil/tree.c \
					../../../../libavutil/twofish.c \
					../../../../libavutil/utils.c \
					../../../../libavutil/xga_font_data.c \
					../../../../libavutil/xtea.c \
					../../../../libswresample/arm/audio_convert_neon.S \
					../../../../libswresample/arm/resample.S \
					../../../../libswscale/arm/hscale.S \
					../../../../libswscale/arm/output.S \
					../../../../libswscale/arm/rgb2yuv_neon_16.S \
					../../../../libswscale/arm/rgb2yuv_neon_32.S \
					../../../../libswscale/arm/yuv2rgb_neon.S \
					../../../../libavutil/arm/float_dsp_neon.S \
					../../../../libavutil/arm/float_dsp_vfp.S
					
					
			LOCAL_SRC_FILES	+= wrapper/getopt.c wrapper/main.c wrapper/openHevcWrapper.c
					
					
include $(BUILD_STATIC_LIBRARY)