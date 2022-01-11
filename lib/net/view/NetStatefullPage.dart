import 'dart:async';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class NetStatefulPage extends StatefulWidget {

  NetStatefulPage({Key? key}) : super(key: key);

  @override
  _NetStatefulPageState createState() => _NetStatefulPageState();
}

class _NetStatefulPageState extends State<NetStatefulPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('NetStatefulPage'),
      ),
      body: Container(
          child: Row(
            children: [
              ElevatedButton(
                  onPressed: () {
                    futureCall();
                  },
                  child: Text("Click Future")),
              ElevatedButton(
                  onPressed: () {
                    timerCall();
                  },
                  child: Text("Click Timer")),
              ElevatedButton(
                  onPressed: () {
                    tryException();
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

  void futureCall() {
    print("Future click");
    Future.delayed(Duration(seconds: 4), () {
      // print("Future mount test: $mounted");
      // print("Future running context: ${context == null ? "null" : "noNull"}");
      var navigatorState = Navigator.maybeOf(context);
      print("Future NavigatorState is ${navigatorState == null ? "null": "noNull"}");
      return "hello";
    });
  }

  void timerCall() {
    print("Timer click");

    Timer(Duration(seconds: 5), () {
      print("Timer running context: ${context == null ? "null" : "noNull"}");
      var navigatorState = Navigator.maybeOf(context);
      print("Timer NavigatorState is ${navigatorState == null ? "null": "noNull"}");
    });
  }

  void tryException() {
    print("Timer click getMessage $message");
  }

}
