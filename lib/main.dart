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

  @override
  void initState() {
    super.initState();
    BlocProvider.of<MainBloc>(context)?.initConfig();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: BlocProvider.of<MainBloc>(context)?.configStream,
        builder: (BuildContext context, AsyncSnapshot<ModelConfig?> snapshot) {
          final configData = snapshot.data;
          if (configData == null) {
            return Material(
                color: Colors.white,
                child: Center(child: CircularProgressIndicator()));
          } else {
            return ConfigPage(config: configData);
          }
        });
  }
}