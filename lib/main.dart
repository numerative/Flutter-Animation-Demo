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

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Circle(),
    );
  }
}

class Circle extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _AnimatedCircle();
}

class _AnimatedCircle extends State<Circle> {
  double measurement = 100;
  double x2 = 0;
  double y2 = -0.5;
  double x1 = -0.7;
  double y1 = -0.3;
  double x3 = 0.7;
  double y3 = -0.3;

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
            duration: Duration(milliseconds: 500),
            alignment: Alignment(x1, y1),
            child: AnimatedContainer(
              duration: Duration(milliseconds: 0),
              height: 75,
              width: 75,
              decoration: new BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.black),
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
                  y2 = -0.5;
                });
              },
              onTapUp: (t) {
                setState(() {
                  measurement = 100;
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
