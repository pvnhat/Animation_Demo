import 'package:flutter/cupertino.dart';

class ColorAnimation extends AnimatedWidget {
  ColorAnimation({Key key, Animation<Color> animation})
      : super(key: key, listenable: animation);

  @override
  Widget build(BuildContext context) {
    final Animation<Color> animation = listenable;
    double maxWidth = MediaQuery.of(context).size.width;
    double margin = (maxWidth * .3) / 2;
    return AspectRatio(
      aspectRatio: 1.0,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: margin),
        constraints: BoxConstraints(maxWidth: maxWidth),
        decoration:
            BoxDecoration(shape: BoxShape.circle, color: animation.value),
      ),
    );
  }
}
