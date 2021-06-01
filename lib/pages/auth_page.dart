import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class AuthPage extends Page {
  static final String pageNume = 'AuthPage';

  @override
  Route createRoute(BuildContext context) {
    return MaterialPageRoute(
      settings: this,
      builder: (context) => AuthWidget(),
    );
  }
}

class AuthWidget extends StatefulWidget {
  @override
  _AuthWidgetState createState() => _AuthWidgetState();
}

class _AuthWidgetState extends State<AuthWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.amberAccent,
    );
  }
}
