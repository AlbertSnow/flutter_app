import 'package:flutter/material.dart';
import 'package:flutter_app/architecture/provider_lib/model/provider_view_model.dart';

class TestUpdateWidget extends StatefulWidget {

  TestUpdateWidget({Key? key}) : super(key: key);

  @override
  _TestUpdateWidgetState createState() => _TestUpdateWidgetState();
}

class _TestUpdateWidgetState extends State<TestUpdateWidget> {
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

    print("zhao jia : build ++++");
    return Text("+++++++++----");
  }

  Widget listItem(String text, VoidCallback? onTap) {
    return ElevatedButton(onPressed: onTap, child: Text(text));
  }
}
