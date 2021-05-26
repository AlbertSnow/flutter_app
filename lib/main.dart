import 'package:flutter/material.dart';
import 'package:flutter_app/bloc/bloc_provider.dart';
import 'package:flutter_app/bloc/main_bloc.dart';
import 'package:flutter_app/model/ModelConfig.dart';
import 'package:flutter_app/pages/ConfigPage.dart';
import 'package:flutter_app/repositories/ConfigRepository.dart';

void main() {
  runApp(BlocProvider(
    bloc: MainBloc(),
    child: MaterialApp(
      title: 'MaoShan',
      home: RoutingPage()
    ),
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
  }

  Future _loadData(ModelConfig param) async {
    setState(() => config = param);
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: BlocProvider.of<MainBloc>(context)?.configStream,
        builder: (context, snapshot) {
          final config = snapshot.data;

          if (config == null) {
            return Material(
                color: Colors.white,
                child: Center(child: CircularProgressIndicator()));
          } else {
            return ConfigPage(config: this.config!);
          }
        });
  }
}