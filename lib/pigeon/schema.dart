import 'package:pigeon/pigeon.dart';

class User {
  String? name;
  int? age;
  bool? sex;
}

//Flutter 调用 Native 方法
@HostApi()
abstract class Api {
  String getPlatformVersion();
  User getUser();
}

//Native 调用 Flutter 方法
@FlutterApi()
abstract class FlutterSideApi {
  void sessionInvaild();
  User sendUser();
}
