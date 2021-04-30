
import 'package:flutter_app/model/ModelConfig.dart';

class ConfigRepository {
  ConfigRepository._();

  static final ConfigRepository instance = new ConfigRepository._();


  ModelConfig get() {
    var config = new ModelConfig();
    return config;
  }

  void save(ModelConfig config) {
    print("save config: " + config.toString());

  }

}