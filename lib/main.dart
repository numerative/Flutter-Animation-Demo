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
    with SingleTickerProviderStateMixin {
  Animation animation, animation2;
  AnimationController animationController;
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
    animation = Tween(begin: 0.0, end: -0.3).animate(animationController)
      ..addListener(() {
        setState(() {

        });
      });
    animation2 = Tween(begin: 0.0, end: -0.7).animate(animationController)
      ..addListener(() {
        setState(() {

        });
      });
    animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        animationController.reverse();
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
          Align(
            child: Container(
              height: 250,
              width: 250,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(),
              ),
            ),
          ),
          AnimatedContainer(
            duration: Duration(milliseconds: 0),
            alignment: Alignment(animation2.value, animation.value),
            child: AnimatedContainer(
              duration: Duration(milliseconds: 0),
              height: 75,
              width: 75,
              decoration: new BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.red,
              ),
            ),
          ),
          AnimatedContainer(
            duration: Duration(milliseconds: 500),
            alignment: Alignment(x2, y2),
            child: AnimatedContainer(
              duration: Duration(milliseconds: 0),
              height: 75,
              width: 75,
              decoration: new BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.red,
              ),
            ),
          ),
          AnimatedContainer(
            duration: Duration(milliseconds: 500),
            alignment: Alignment(x3, y3),
            child: AnimatedContainer(
              duration: Duration(milliseconds: 0),
              height: 75,
              width: 75,
              decoration: new BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.red,
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
                  x1 = -0.7;
                  y1 = -0.3;
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
