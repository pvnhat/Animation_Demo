import 'dart:developer' as developer;
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ImplicitDemoPage extends StatefulWidget {
  ImplicitDemoPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _ImplicitDemoState createState() => _ImplicitDemoState();
}

class _ImplicitDemoState extends State<ImplicitDemoPage> {
  double opacity = 0.0;

  Color _randomColor() => Color(0xFFFFFFFF & Random().nextInt(0xFFFFFFFF));

  double _randomSize() => Random().nextDouble() * 64;

  double _randomLeftSpace() => Random().nextDouble() * 200;

  @override
  Widget build(BuildContext context) {
    developer.log("vo day");
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Container(
              width: 300,
              height: 100,
              child: Stack(
                children: [
                  AnimatedPositioned(
                    duration: Duration(seconds: 2),
                    left: _randomLeftSpace(),
                    child: AnimatedContainer(
                      width: _randomSize(),
                      height: _randomSize(),
                      duration: Duration(seconds: 1),
                      margin: EdgeInsets.all(_randomSize()),
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(
                          _randomSize(),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(
              child: SizedBox(
                width: 128,
                height: 128,
                child: AnimatedContainer(
                  curve: Curves.bounceInOut,
                  duration: Duration(seconds: 1),
                  margin: EdgeInsets.all(_randomSize()),
                  decoration: BoxDecoration(
                    color: _randomColor(),
                    borderRadius: BorderRadius.circular(
                      _randomSize(),
                    ),
                  ),
                ),
              ),
            ),
            Container(
              width: 100,
              height: 100,
              child: AnimatedOpacity(
                duration: Duration(seconds: 1),
                opacity: opacity,
                curve: Curves.easeIn,
                child: Image.network(
                    "https://cdn.24h.com.vn/upload/3-2019/images/2019-09-15/1568562240-300-a--8--1568544356-width650height866.jpg"),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            opacity = opacity == 0 ? 1 : 0;
          });
        },
        tooltip: 'Increment',
        child: Icon(Icons.opacity),
      ),
    );
  }
}
