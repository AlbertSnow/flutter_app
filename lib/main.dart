import 'package:flutter/material.dart';
import 'package:flutter_app/model/ModelConfig.dart';
import 'package:flutter_app/pages/ConfigPage.dart';
import 'package:flutter_app/repositories/ConfigRepository.dart';

void main() {
  runApp(MaterialApp(
    title: 'Shopping App',
    home: RoutingPage()
  ));
}

class RoutingPage extends StatefulWidget {
  RoutingPage({Key? key}) : super(key: key);

  @override
  _RoutingPageState createState() => _RoutingPageState();
}

class _RoutingPageState extends State<RoutingPage> {

  ModelConfig? config;

  @override
  void initState() {
    super.initState();
    ConfigRepository.instance.get((config) {_loadData(config);});
  }

  Future _loadData(ModelConfig param) async {
    setState(() => config = param);
  }

  @override
  Widget build(BuildContext context) {
    // Sets up our screen utils and applies defaults
    if (config == null) {
      return Material(color: Colors.white,
          child: Center(child: CircularProgressIndicator()));
    } else {
      return ConfigPage(config: this.config!);
    }
  }

}