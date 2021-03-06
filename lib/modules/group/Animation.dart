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
    controller = AnimationController(duration: Duration(seconds: 2), vsync: this);
    curvedAnimation = CurvedAnimation(parent: controller, curve: Curves.easeIn);
    curvedAnimation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        print('completed');
        //动画执行结束时反向执行动画
        controller.reverse();
      } else if (status == AnimationStatus.dismissed) {
        print('dismissed');
        //动画恢复到初始状态时执行动画（正向）
        controller.forward();
      }
    });
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
            SizedBox(
              height: 20,
            ),
            Container(
              width: 300,
              height: 100,
              color: Colors.blue.shade50,
              child: Drag(),
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
    controller.dispose();
    super.dispose();
  }
}

class Drag extends StatefulWidget {
  @override
  _DragState createState() => _DragState();
}

class _DragState extends State<Drag> {
  double _left = 0;
  double _top = 0;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          left: _left,
          top: _top,
          child: GestureDetector(
            child: CircleAvatar(
              child: Text(
                '拖',
                style: TextStyle(color: Colors.white),
              ),
            ),
            //手指按下时会触发此回调
            onPanDown: (details) {
              //打印手指按下的位置(相对于屏幕)
              print("用户手指按下：${details.globalPosition}");
            },
            //手指滑动时会触发此回调
            onPanUpdate: (details) {
              //用户手指滑动时，更新偏移，重新构建
              setState(() {
                _left += details.delta.dx;
                _top += details.delta.dy;
              });
            },
            onPanEnd: (details) {
              //打印滑动结束时在x、y轴上的速度
              print(details.velocity);
            },
          ),
        ),
      ],
    );
  }
}

//Flutter中正是通过这种方式封装了很多动画，如：FadeTransition、ScaleTransition、SizeTransition等，很多时候都可以复用这些预置的过渡类。
class CustomTransition extends StatelessWidget {
  final Widget? child;
  final Animation<double> animation;

  const CustomTransition({Key? key, required this.animation, this.child}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedBuilder(
        animation: animation,
        builder: (context, child) {
          return Container(
            height: animation.value,
            width: animation.value,
            child: child,
          );
        },
        child: child,
      ),
    );
  }
}

/*
...
Widget build(BuildContext context) {
  return CustomTransition(
    child: Image.asset("images/avatar.png"), 
    animation: animation,
  );
}
*/
