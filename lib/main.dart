import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Animation Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Animation Demo'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Circle(),
    );
  }
}

class Circle extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _AnimatedCircle();
}

class _AnimatedCircle extends State<Circle>
    with TickerProviderStateMixin {
  Animation animation, animation2, sizeAnimation;
  AnimationController animationController, sizeAnimationController;
  double measurement = 100;
  double x2 = 0;
  double y2 = 0;
  double x1 = 0;
  double y1 = 0;
  double x3 = 0;
  double y3 = 0;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );
    sizeAnimationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 50),
    );
    animation = Tween(begin: 0.0, end: -0.3).animate(animationController)
      ..addListener(() {
        setState(() {});
      });
    animation2 = Tween(begin: 0.0, end: -0.7).animate(animationController)
      ..addListener(() {
        setState(() {});
      });

    sizeAnimation =
    Tween(begin: 30.0, end: 75.0).animate(sizeAnimationController)
      ..addListener(() {
        setState(() {

        });
      });
    animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        sizeAnimationController.forward();
      }
    });
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: <Widget>[
          Container(
            alignment: Alignment(animation2.value, animation.value),
            child: Container(
              height: sizeAnimation.value,
              width: sizeAnimation.value,
              decoration: new BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.blue,
              ),
            ),
          ),
          AnimatedContainer(
            duration: Duration(milliseconds: 500),
            alignment: Alignment(x2, y2),
            child: Container(
              height: sizeAnimation.value,
              width: sizeAnimation.value,
              decoration: new BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.blue,
              ),
            ),
          ),
          AnimatedContainer(
            duration: Duration(milliseconds: 500),
            alignment: Alignment(x3, y3),
            child: Container(
              height: sizeAnimation.value,
              width: sizeAnimation.value,
              decoration: new BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.blue,
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: GestureDetector(
              onTapDown: (t) {
                setState(() {
                  measurement = measurement * 0.8;
                });
              },
              onTapUp: (t) {
                setState(() {
                  measurement = 100;
                  x2 = 0;
                  y2 = -0.5;
                  x3 = 0.7;
                  y3 = -0.3;
                  animationController.forward();
                });
              },
              child: AnimatedContainer(
                duration: Duration(milliseconds: 100),
                alignment: Alignment.center,
                width: measurement,
                height: measurement,
                decoration: new BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.blue,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
