import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Second screen',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: SecondBody(),
    );
  }
}

class SecondBody extends StatefulWidget {
  @override
  _SecondBodyState createState() => _SecondBodyState();
}

class _SecondBodyState extends State<SecondBody>
    with SingleTickerProviderStateMixin {
  Animation<double> animation;
  AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(duration: const Duration(seconds: 2), vsync: this);
    animation = Tween<double>(begin: 0, end: 250).animate(controller)
      ..addListener(() {
        //setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          controller.reverse();
        } else if (status == AnimationStatus.dismissed) {
          controller.forward();
        }
      });
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildContainer(),
    );
  }

  Widget _buildContainer() {
    // return AnimatedLogo(
    //   animation: animation,
    // );
    return ZoomOutInTransition(
      animation: animation,
      child: LogoWidget(),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}

// use widget to have reusable
class AnimatedLogo extends AnimatedWidget {
  AnimatedLogo({Key key, Animation<double> animation})
      : super(key: key, listenable: animation);

  @override
  Widget build(BuildContext context) {
    final animation = listenable as Animation<double>;
    return Center(
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        height: animation.value,
        width: animation.value,
        child: FlutterLogo(),
      ),
    );
  }
}

// Using Animation builder
class LogoWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: FlutterLogo(),
    );
  }
}

class ZoomOutInTransition extends StatelessWidget {
  ZoomOutInTransition({this.child, this.animation});

  final Widget child;
  final Animation<double> animation;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedBuilder(
        animation: animation,
        child: child,
        builder: (context, child) {
          return Container(
            height: animation.value,
            width: animation.value,
            child: child,
          );
        },
      ),
    );
  }
}
