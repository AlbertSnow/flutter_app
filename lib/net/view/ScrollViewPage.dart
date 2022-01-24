
import 'package:flutter/material.dart';

class ScrollViewPage extends StatefulWidget {

  ScrollViewPage({Key? key}) : super(key: key);

  @override
  _ScrollViewPageState createState() => _ScrollViewPageState();
}

class _ScrollViewPageState extends State<ScrollViewPage> {
  ScrollController scrollViewController = ScrollController();
  Size size = Size(0, 0);
  Offset position = Offset(0, 0);
  final scrollViewKey = GlobalKey();
  final targetViewKey = GlobalKey();

  listenScroll() {
    print("Jia hello layout scroll ++++++++++++++++++ ");
    setState(() {
      RenderObject? renderObject = targetViewKey.currentContext?.findRenderObject();
      if (!(renderObject is RenderBox)) {
        return;
      }
      RenderBox container = renderObject;
      position = container.localToGlobal(Offset.zero);
      size = container.size;
    });
  }


  @override
  void initState() {
    print("Jia hello init state ++++++++++++++++++ ");

    super.initState();
    scrollViewController.addListener(() => listenScroll());
  }

  @override
  void dispose() {
    super.dispose();
    scrollViewController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('NetStatefulPage'),
      ),
      body: Container(
          height: MediaQuery.of(context).size.height,
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("Scroll: ${scrollViewController.offset}"),
              Text("Position: ${position.distance}"),
              Text("Position: dx: ${position.dx}"),
              Text("Position: dy: ${position.dy}"),
              Text("Size: width${size.width} height${size.height}"),
              SizedBox(
                height: 600,
                child: SingleChildScrollView(
                  key: targetViewKey,
                  controller: scrollViewController,
                child: Column(
                  children: [
                    SizedBox(
                      height: 500,
                      child: ElevatedButton(
                          onPressed: () {
                          },
                          child: Text("Click Future")),
                    ),
                    ElevatedButton(
                        onPressed: () {
                        },
                        child: Text("Click Timer")),
                    SizedBox(
                      height: 1800,
                      child: ElevatedButton(
                          onPressed: () {
                          },
                          child: Text("Null Exception")
                      ),
                    ),
                    Text("hello",
                        // onPressed: () {
                        // },
                        // child: Text("the measure view")
                    ),

                    SizedBox(
                      height: 60,
                      child: ElevatedButton(
                          onPressed: () {
                          },
                          child: Text("Target View")),
                    ),
                    SizedBox(
                      height: 60,
                      child: ElevatedButton(
                          onPressed: () {
                          },
                          child: Text("the measure view")),
                    ),
                  ],
                ),
            ),
              )]
          )),
    );
  }

}
