import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ExplicitPage extends StatefulWidget {
  ExplicitPage({Key key, String title}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _ExplicitState();
  }
}

class _ExplicitState extends State<ExplicitPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [Text(("Hello"))],
        ),
      ),
    );
  }
}
