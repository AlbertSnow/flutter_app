
import 'dart:async';

import 'package:flutter_app/model/ModelConfig.dart';
import 'package:flutter_app/repositories/ConfigRepository.dart';

import 'bloc.dart';

class MainBloc implements Bloc {

  ModelConfig? _config;
  ModelConfig? get proxyConfig => _config;

  final _configController = StreamController<ModelConfig>();

  Stream<ModelConfig> get configStream => _configController.stream;

  void queryConfig() async {
    ConfigRepository.instance
        .get((config) => _configController.sink.add(config));
  }

  @override
  void dispose() {
    _configController.close();
  }



}