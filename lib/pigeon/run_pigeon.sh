# run_pigeon.h

flutter pub run pigeon \
  --input lib/pigeon/schema.dart \
  --dart_out lib/pigeon/api_generated.dart \
  --objc_header_out .ios/Flutter/FlutterPluginRegistrant/Classes/Pigeon.h \
  --objc_source_out .ios/Flutter/FlutterPluginRegistrant/Classes/Pigeon.m \
  --objc_prefix FLT \
  --java_out .android/Flutter/src/main/java/io/flutter/plugins/Pigeon.java \
  --java_package "com.example.flutter_module"
