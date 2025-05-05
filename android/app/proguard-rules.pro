# Keep all TensorFlow Lite classes
-keep class org.tensorflow.lite.** { *; }
-dontwarn org.tensorflow.lite.**

# Keep any custom delegates or extensions
-keep class * extends org.tensorflow.lite.Delegate

# Optional: help with reflection issues
-keepattributes *Annotation*
-keep class com.google.** { *; }
-dontwarn com.google.**
