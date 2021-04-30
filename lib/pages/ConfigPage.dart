import 'package:flutter/material.dart';
import 'package:flutter_app/model/ModelConfig.dart';
import 'package:flutter_app/repositories/ConfigRepository.dart';

class ConfigurationPage extends StatefulWidget {
  ConfigurationPage({Key key}) : super(key: key);

  @override
  _ConfigurationPageState createState() =>
      _ConfigurationPageState(ConfigRepository.instance.get());
}

class _ConfigurationPageState extends State<ConfigurationPage> {
  ModelConfig modelConfig;

  // of the TextField.
  final List<TextEditingController> _textControllerList =
    List<TextEditingController>.filled(5, null);

  _ConfigurationPageState(ModelConfig config) {
    modelConfig = config;
    for (int i = 0; i < _textControllerList.length; i++) {
      _textControllerList[i] = new TextEditingController();
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    _textControllerList.forEach((element) {element.dispose();});
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shopping List'),
      ),
      body: Column(
        children: [
          Image(image: AssetImage("images/ic_launcher.png")),
          TextField(
            controller: _textControllerList[0],
            decoration: InputDecoration(
              hintText: "Name",
            ),
          ),
          TextField(
            controller: _textControllerList[1],
            decoration: InputDecoration(
              hintText: "Remote Address",
            ),
          ),
          TextField(
            controller: _textControllerList[2],
            decoration: InputDecoration(
              hintText: "Remote Service SNI",
            ),
          ),
          TextField(
            controller: _textControllerList[3],
            decoration: InputDecoration(
              hintText: "Port",
            ),
          ),
          TextField(
            controller: _textControllerList[4],
            decoration: InputDecoration(
              hintText: "Password",
            ),
          ),
          Row(
            children: [
              Text("开启IPv6"),
              Switch(
                  value: modelConfig.isTurnOnIPv6,
                  onChanged: (value) {
                    modelConfig.isTurnOnIPv6 = value;
                  }),
            ],
          ),
          Row(
            children: [
              Text("验证证书"),
              Switch(
                  value: modelConfig.isConfirmCertificate,
                  onChanged: (value) {
                    setState(() {
                      modelConfig.isConfirmCertificate = value;
                    });
                  })
            ],
          ),
          Row(
            children: [
              Text("过滤大陆域名/IP"),
              Switch(
                  value: modelConfig.isFilterMainLandIPAddress,
                  onChanged: (value) {
                    setState(() {
                      modelConfig.isFilterMainLandIPAddress = value;
                    });
                  }),
            ],
          ),
          Row(
            children: [
              Text("允许局域网访问"),
              Switch(
                  value: modelConfig.isAllowAccessLAN,
                  onChanged: (value) {
                    setState(() {
                      modelConfig.isAllowAccessLAN = value;
                    });
              }),
            ],
          ),
          TextButton(onPressed: () {
            onConnect();
          }, child: Text("连接"))
        ],
      ),
    );
  }

  void onConnect() {
    modelConfig.name = _textControllerList[0].text;
    modelConfig.remoteAddress = _textControllerList[1].text;
    modelConfig.remoteServiceSNI = _textControllerList[2].text;
    modelConfig.port = _textControllerList[3].text;
    modelConfig.password = _textControllerList[4].text;
    ConfigRepository.instance.save(modelConfig);
  }

}