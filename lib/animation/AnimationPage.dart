import 'package:flutter/material.dart';

class AnimationPage extends StatefulWidget {
  AnimationPage({Key? key}) : super(key: key);

  @override
  _AnimationPageState createState() => _AnimationPageState();
}

class _AnimationPageState extends State<AnimationPage>
    with SingleTickerProviderStateMixin {
  var animation;
  AnimationController? animationController;

  @override
  void initState() {
    super.initState();

    animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 2000),
    );

    animation = Tween(
      begin: 0.0,
      end: 1.0,
    ).animate(animationController!);
  }

  @override
  void dispose() {
    animationController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    animationController?.forward();

    return Scaffold(
        appBar: AppBar(
          title: Text('Animation'),
        ),
        body: Container(
            padding: new EdgeInsets.all(10.0),
            child: FadeTransition(
              opacity: animation,
              child: Column(
                children: [
                  Image(image: AssetImage("images/ic_launcher.png")),
                  SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                          onPressed: () {
                            // dumpControllerTo(widget.config);
                            // bloc?.restRepository.add(widget.config);
                            animationController?.forward(from: 0.0);
                          },
                          child: Text("forward"))),
                  SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                          onPressed: () {
                            // bloc?.restRepository.add(null);
                            animationController?.reverse();
                          },
                          child: Text("reverse"))),
                ],
              ),
            )));
  }
}
