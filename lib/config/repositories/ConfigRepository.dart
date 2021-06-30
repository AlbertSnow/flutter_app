import 'dart:convert';

import 'package:flutter_app/config/model/ModelConfig.dart';
import 'package:flutter_app/utils/LogUtil.dart';

import 'MyPreference.dart';

class ConfigRepository {
  static const String KEY_CONFIG = "ModelConfig";

  ConfigRepository._();

  static final ConfigRepository instance = new ConfigRepository._();

  get(void Function(ModelConfig param) action) async {
    MyPreference.instance.get(KEY_CONFIG).then((value) {
      ModelConfig config;
      if (value != null && value != "") {
        config = ModelConfig.fromJson(jsonDecode(value));
        debugLog("get config: $value");
      } else {
        config = new ModelConfig();
        debugLog("get config: new Object");
      }
      action(config);
    });
  }

  save(ModelConfig config) async {
    String json = jsonEncode(config);
    debugLog("save config: $json");
    MyPreference.instance.save(KEY_CONFIG, json);
  }
}
