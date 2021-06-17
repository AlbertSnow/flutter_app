
import 'dart:async';

import 'package:flutter_app/model/ModelConfig.dart';
import 'package:flutter_app/repositories/ConfigRepository.dart';

import 'bloc.dart';

class MainBloc implements Bloc {

  ModelConfig? _config;
  ModelConfig? get proxyConfig => _config;

  final _dataSourceController = StreamController<ModelConfig>();
  Stream<ModelConfig> get configStream => _dataSourceController.stream;
  StreamSink<ModelConfig> get configSink => _dataSourceController.sink;

  final _repositoryController = StreamController<ModelConfig?>();
  StreamSink<ModelConfig?> get inRepository => _repositoryController.sink;
  StreamSink<ModelConfig?> get restRepository => _repositoryController.sink;

  void initConfig() {
    _repositoryController.stream.listen((data) {
      if (data == null) {
        ConfigRepository.instance.get((config) {
          configSink.add(config);
        });
      } else {
        ConfigRepository.instance.save(data);
      }
    });

    ConfigRepository.instance.get((config) {_dataSourceController.sink.add(config);});
  }

  void queryConfig() async {
    ConfigRepository.instance
        .get((config) => _dataSourceController.sink.add(config));
  }

  @override
  void dispose() {
    _dataSourceController.close();
    _repositoryController.close();
  }

}