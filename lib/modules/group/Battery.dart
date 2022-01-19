import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BatteryGetter extends StatefulWidget {
  @override
  _BatteryGetterState createState() => _BatteryGetterState();
}

class _BatteryGetterState extends State<BatteryGetter> {
  static const platform = MethodChannel('myflutter.com/battery');

  String _batteryLevel = 'Unknown';
  Future<Null> _getBatteryLevel() async {
    String batteryLevel;

    try {
      final int result = await platform.invokeMethod('getBatteryLevel', ["getBatteryLevel"]);
      print('获取原生的值: 电量$result%');
      batteryLevel = 'Battery level at $result%.';
    } on PlatformException catch (exception) {
      batteryLevel = "Failed to get battery level, message: '${exception.message}'";
    }

    setState(() {
      _batteryLevel = batteryLevel;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BatteryGetter"),
      ),
      body: Material(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: _getBatteryLevel,
                child: Text('Get battery level'),
              ),
              Text(_batteryLevel),
            ],
          ),
        ),
      ),
    );
  }
}
