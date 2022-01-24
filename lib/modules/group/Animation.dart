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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: FadeTransition(
                opacity: curvedAnimation,
                child: FlutterLogo(
                  size: 100,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            DecoratedBox(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4.0),
                gradient: LinearGradient(colors: [Colors.red, Colors.orange]),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 3.0,
                    offset: Offset(3.0, 3.0),
                    blurStyle: BlurStyle.normal,
                    color: Colors.black45,
                  )
                ],
              ),
              //旋转
              child: RotatedBox(
                quarterTurns: 1, //旋转90度(1/4圈)
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                  child: Text(
                    'DecoratedBox',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            ),
          ],
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
