import 'package:flutter/material.dart';
import 'package:flutter_app/animation/AnimationPage.dart';
import 'package:flutter_app/architecture/provider_lib/ProviderPage.dart';
import 'package:flutter_app/config/bloc/bloc_provider.dart';
import 'package:flutter_app/config/bloc/main_bloc.dart';
import 'package:flutter_app/config/model/ModelConfig.dart';
import 'package:flutter_app/net/view/NetPage.dart';

class ConfigPage extends StatefulWidget {
  final ModelConfig config;
  ConfigPage({Key? key, required this.config}) : super(key: key);

  @override
  _ConfigPageState createState() => _ConfigPageState();
}

class _ConfigPageState extends State<ConfigPage> {

  List<TextEditingController> _textControllerList =
    List<TextEditingController>.filled(5, new TextEditingController());

  _ConfigPageState() {
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
    _textControllerList.forEach((element) {
      element.dispose();
    });
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final MainBloc? bloc = BlocProvider.of<MainBloc>(context);

    resetController(widget.config);
    return Scaffold(
        appBar: AppBar(
          title: Text('Configuration'),
        ),
        body: Container(
            padding: new EdgeInsets.all(10.0),
            child: SingleChildScrollView(
              child: Column(
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
                  Container(
                      margin: const EdgeInsets.only(top: 20.0),
                      child: Row(
                        children: [
                          Text("开启IPv6"),
                          Switch(
                              value: widget.config.isTurnOnIPv6,
                              onChanged: (value) {
                                setState(() {
                                  widget.config.isTurnOnIPv6 = value;
                                });
                              }),
                        ],
                      )),
                  Row(
                    children: [
                      Text("验证证书"),
                      Switch(
                          value: widget.config.isConfirmCertificate,
                          onChanged: (value) {
                            setState(() {
                              widget.config.isConfirmCertificate = value;
                            });
                          })
                    ],
                  ),
                  Row(
                    children: [
                      Text("过滤大陆域名/IP"),
                      Switch(
                          value: widget.config.isFilterMainLandIPAddress,
                          onChanged: (value) {
                            setState(() {
                              widget.config.isFilterMainLandIPAddress = value;
                            });
                          }),
                    ],
                  ),
                  Row(
                    children: [
                      Text("允许局域网访问"),
                      Switch(
                          value: widget.config.isAllowAccessLAN,
                          onChanged: (value) {
                            setState(() {
                              widget.config.isAllowAccessLAN = value;
                            });
                          }),
                    ],
                  ),
                  SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                          onPressed: () {
                            dumpControllerTo(widget.config);
                            bloc?.restRepository.add(widget.config);
                          },
                          child: Text("连接"))),
                  SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                          onPressed: () {
                            bloc?.restRepository.add(null);
                          },
                          child: Text("ReSet"))),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      child: Text("Net Page"),
                      onPressed: () {
                        //导航到新路由
                        Navigator.push( context,
                            MaterialPageRoute(builder: (context) {
                              return NetPage();
                            }));
                      },
                    ),
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      child: Text("Animation Page"),
                      onPressed: () {
                        //导航到新路由
                        Navigator.push( context,
                            MaterialPageRoute(builder: (context) {
                              return AnimationPage();
                            }));
                      },
                    ),
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      child: Text("Bloc Page"),
                      onPressed: () {
                        //导航到新路由
                        Navigator.push( context,
                            MaterialPageRoute(builder: (context) {
                              return ProviderPage();
                            }));
                      },
                    ),
                  ),
                ],
              ),
            )));
  }

  void dumpControllerTo(ModelConfig modelConfig) {
    modelConfig.name = _textControllerList[0].text;
    modelConfig.remoteAddress = _textControllerList[1].text;
    modelConfig.remoteServiceSNI = _textControllerList[2].text;
    modelConfig.port = _textControllerList[3].text;
    modelConfig.password = _textControllerList[4].text;
  }

  void resetController(ModelConfig modelConfig) {
    _textControllerList[0].text = modelConfig.name;
    _textControllerList[1].text = modelConfig.remoteAddress;
    _textControllerList[2].text = modelConfig.remoteServiceSNI;
    _textControllerList[3].text = modelConfig.port;
    _textControllerList[4].text = modelConfig.password;
  }

}
