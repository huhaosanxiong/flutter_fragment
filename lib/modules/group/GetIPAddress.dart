import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';

class GetIPAddress extends StatefulWidget {
  @override
  _GetIPAddressState createState() => _GetIPAddressState();
}

class _GetIPAddressState extends State<GetIPAddress> {
  var _ipAddress = 'Unknown';

  _getIPAddress() async {
    var url = 'https://httpbin.org/ip';
    var httpClient = HttpClient();

    String result;
    try {
      var request = await httpClient.getUrl(Uri.parse(url));
      var response = await request.close();
      if (response.statusCode == HttpStatus.ok) {
        var json = await response.transform(utf8.decoder).join();
        var data = jsonDecode(json);
        result = data['origin'];
      } else {
        result = 'Error getting IP address:\nHttp status ${response.statusCode}';
      }
    } catch (exception) {
      result = 'Failed getting IP address';
    }

    if (!mounted) {
      return;
    }

    setState(() {
      _ipAddress = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    var spacer = SizedBox(
      height: 32,
    );
    return Scaffold(
      appBar: AppBar(
        title: Text("GetIPAddress"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Your current IP address is:'),
            Text('$_ipAddress'),
            spacer,
            ElevatedButton(
              onPressed: _getIPAddress,
              child: Text('Get IP address'),
            )
          ],
        ),
      ),
    );
  }
}
