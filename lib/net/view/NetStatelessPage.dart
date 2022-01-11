import 'dart:async';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class NetStatelessPage extends StatelessWidget {
  NetStatelessPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('NetStatelessPage'),
      ),
      body: Container(
          child: Row(
            children: [
              ElevatedButton(
                  onPressed: () {
                    futureCall(context);
                  },
                  child: Text("Click Future")),
              ElevatedButton(
                  onPressed: () {
                    timerCall(context);
                  },
                  child: Text("Click Timer")),
              ElevatedButton(
                  onPressed: () {
                    tryException(context);
                  },
                  child: Text("Null Exception")),
            ],
          )),
    );
  }

  Future requestNet() async {
    var url = Uri.https('www.baidu.com', '');

    var response = await http.get(url);
    if (response.statusCode == 200) {
      print("Success response body: ");
      print('${response.body}');
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  }

  String? test;
  get message  {
    return test!;
  }

  void futureCall(BuildContext context) {
    print("Future click");
    Future.delayed(Duration(seconds: 4), () {
      // print("Future mount test: $mounted");
      print("Future running context: ${context == null ? "null" : "noNull"}");
      var navigatorState = Navigator.maybeOf(context, rootNavigator: true);
      print("Future NavigatorState is ${navigatorState == null ? "null": "noNull"}");
      return "hello";
    });
  }

  void timerCall(BuildContext context) {
    print("Timer click");

    Timer(Duration(seconds: 5), () {
      print("Timer running context: ${context == null ? "null" : "noNull"}");
      var navigatorState = Navigator.maybeOf(context);
      print("Timer NavigatorState is ${navigatorState == null ? "null": "noNull"}");
    });
  }

  void tryException(BuildContext context) {
    print("Timer click getMessage $message");
  }

}
