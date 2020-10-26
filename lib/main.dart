import 'package:flutte_animation_demo/explicit_page.dart';
import 'package:flutte_animation_demo/implicit_demo.dart';
import 'package:flutte_animation_demo/utils.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case IMPLICIT_PAGE:
            return PageRouteBuilder(
                pageBuilder: (_, __, ___) => ImplicitDemoPage(
                      title: "Implicit demo",
                    ));
          case EXPLICIT_PAGE:
            return PageRouteBuilder(
                pageBuilder: (_, __, ___) => ExplicitPage(
                      title: "Explicit demo",
                    ));
          case LOTTIE_PAGE:
            return PageRouteBuilder(
                pageBuilder: (_, __, ___) => ImplicitDemoPage(
                      title: "Lottie demo",
                    ));
        }
        return null;
      },
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              FlatButton(
                color: Color(0xFFC7C7C7),
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    IMPLICIT_PAGE,
                  );
                },
                child: Text("GoTo Implicit Page"),
              ),
              FlatButton(
                color: Color(0xFFC7C7C7),
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    EXPLICIT_PAGE,
                  );
                },
                child: Text("GoTo Explicit Page"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
