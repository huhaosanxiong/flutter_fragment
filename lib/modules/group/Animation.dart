import 'package:flutter/material.dart';

class FadeTest extends StatefulWidget {
  final String title;

  const FadeTest({Key? key, required this.title}) : super(key: key);
  @override
  _FadeTestState createState() => _FadeTestState();
}

class _FadeTestState extends State<FadeTest> with TickerProviderStateMixin {
  late AnimationController controller;
  late CurvedAnimation curvedAnimation;
  bool isShow = false;
  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
    controller = AnimationController(duration: Duration(milliseconds: 250), vsync: this);
    curvedAnimation = CurvedAnimation(parent: controller, curve: Curves.easeIn);
  }

  showLogo() {
    isShow = !isShow;
    if (isShow) {
      controller.forward();
    } else {
      controller.reverse();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Container(
          child: FadeTransition(
            opacity: curvedAnimation,
            child: FlutterLogo(
              size: 100,
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Fade',
        onPressed: () {
          showLogo();
        },
        child: Icon(Icons.brush),
      ),
    );
  }

  @override
  void dispose() {
    // ignore: todo
    // TODO: implement dispose
    super.dispose();
    controller.dispose();
  }
}
