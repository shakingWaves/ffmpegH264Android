#include <jni.h>
#include <string.h>
int android_main(int argc, char *argv[]);

JNIEXPORT jstring JNICALL
Java_com_example_good_androidstudio_MainActivity_stringFromJNI(
        JNIEnv *env,
        jobject this ) {
    int argc = 5;
    char *argv[]={"ffmpegH264","-i","/mnt/sdcard/h264d/test.264","-o", "/mnt/sdcard/h264d/ffmpegH264_test.yuv"};
    android_main(argc, argv);
    return (*env)->NewStringUTF(env, "C Module Returned");
}
