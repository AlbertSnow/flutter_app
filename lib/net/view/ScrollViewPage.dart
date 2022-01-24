
import 'package:flutter/material.dart';

class ScrollViewPage extends StatefulWidget {

  ScrollViewPage({Key? key}) : super(key: key);

  @override
  _ScrollViewPageState createState() => _ScrollViewPageState();
}

class _ScrollViewPageState extends State<ScrollViewPage> {
  ScrollController scrollViewController = ScrollController();

  bool isListItemExposed = false;
  Size listItemSize = Size(0, 0);
  Offset listItemPosition = Offset(0, 0);
  final scrollViewKey = GlobalKey();
  final targetListItemKey = GlobalKey();

  listenScroll() {
    print("Jia hello layout scroll ++++++++++++++++++ ");
    setState(() {
      RenderObject? renderObject = targetListItemKey.currentContext?.findRenderObject();
      if (!(renderObject is RenderBox)) {
        return;
      }
      RenderBox renderBox = renderObject;
      listItemPosition = renderBox.localToGlobal(Offset.zero);
      listItemSize = renderBox.size;


      RenderObject? scrollViewRenderObject = scrollViewKey.currentContext?.findRenderObject();
      if (!(scrollViewRenderObject is RenderBox)) {
        return;
      }
      RenderBox scrollViewRenderBox = scrollViewRenderObject;
      Offset scrollViewPosition = scrollViewRenderBox.localToGlobal(Offset.zero);
      Size scrollViewSize = scrollViewRenderBox.size;

      var minScrollDy =  listItemPosition.dy + listItemSize.height -
      scrollViewPosition.dy - scrollViewSize.height;

      isListItemExposed = minScrollDy < 0;
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
        title: Text('ListItemExposePage'),
      ),
      body: Container(
          height: MediaQuery.of(context).size.height,
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("List item expose: $isListItemExposed"),
              Text("Scroll: ${scrollViewController.offset}"),
              Text("Position: ${listItemPosition.distance}"),
              Text("Position: dx: ${listItemPosition.dx}"),
              Text("Position: dy: ${listItemPosition.dy}"),
              Text("Size: width${listItemSize.width} height${listItemSize.height}"),
              SizedBox(
                height: 600,
                child: SingleChildScrollView(
                  key: scrollViewKey,
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
                      key: targetListItemKey,
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
