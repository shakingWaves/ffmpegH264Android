#include <string.h>
#include <jni.h>
#include <android/log.h>

#define  LOGI(...)  __android_log_print(ANDROID_LOG_INFO, "TestModule",__VA_ARGS__)
#define  LOGE(...)  __android_log_print(ANDROID_LOG_ERROR, "TestModule",__VA_ARGS__)
int android_main(int argc, char *argv[]);
jstring Java_com_example_ffmpegh264_MainActivity_stringFromJNI( JNIEnv* env, jobject thiz)
{
	int argc = 5;
    char *argv[]={"ffmpegH264","-i","/mnt/sdcard/h264d/test.264","-o", "/mnt/sdcard/h264d/ffmpegH264_test.yuv"};
	android_main(argc, argv);

    return (*env)->NewStringUTF(env, "C Module Returned");
}
