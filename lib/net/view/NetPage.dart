import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class NetPage extends StatefulWidget {
  NetPage({Key? key}) : super(key: key);

  @override
  _NetPageState createState() => _NetPageState();
}

class _NetPageState extends State<NetPage> {
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
        title: Text('NetPage'),
      ),
      body: Container(
          child: ElevatedButton(
              onPressed: () {
                requestNet();
              },
              child: Text("RequestNet"))),
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
}
