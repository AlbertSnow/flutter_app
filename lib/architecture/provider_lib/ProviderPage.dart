import 'package:flutter/material.dart';
import 'package:flutter_app/architecture/provider_lib/model/provider_view_model.dart';
import 'package:provider/provider.dart';

import 'TestUpdateWidget.dart';

class ProviderPage extends StatefulWidget {
  ProviderPage({Key? key}) : super(key: key);

  @override
  _ProviderPageState createState() => _ProviderPageState();
}

class _ProviderPageState extends State<ProviderPage> {
  final ProviderViewModel viewModel = ProviderViewModel();

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
          title: Text('ProviderPage'),
        ),
        body: ChangeNotifierProvider<ProviderViewModel>.value(
            value: viewModel,
            child: Consumer<ProviderViewModel>(builder: (context, model, _) {
              return Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    listItem(
                        "Normal count: " + viewModel.normalCount.toString(), null),
                    listItem(
                        "ValueNotifier count: " + viewModel.notifyCount.value.toString(),
                        null),
                    // Padding(
                    //     padding: (jia),
                    //     child: TestUpdateWidget()),
                    ValueListenableBuilder(
                        valueListenable: viewModel.notifyCount,
                        builder:
                            (BuildContext context, int value, Widget? child) {
                          // return listItem(
                              // "ValueListenableBuilder notify: " +
                              //     viewModel.notifyCount.value.toString(),
                              // null);
                              print("zhao jia : out ----");

                              return TestUpdateWidget();
                        }),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text("Normal Count: "),
                        listItem("  1  ", () {
                          viewModel.normalCount = 1;
                        }),
                        listItem(" 100 ", () {
                          viewModel.normalCount = 100;
                        }),
                        listItem("Whole notify", viewModel.normalNotify),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text("Notifier Count: "),
                        listItem("  -1  ", () {
                          viewModel.notifyCount.value = -1;
                        }),
                        listItem(" -100 ", () {
                          viewModel.notifyCount.value = -100;
                        }),
                        listItem("Partial Notify", viewModel.partialNotify),
                      ],
                    ),
                  ],
                ),
              );
            })));
  }

  Widget listItem(String text, VoidCallback? onTap) {
    return ElevatedButton(onPressed: onTap, child: Text(text));
  }
}
