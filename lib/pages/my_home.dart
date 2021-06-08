import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter01_app/pages/auth_page.dart';
import 'package:flutter01_app/provider/page_notifiler.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatefulWidget {
  static final String pageNume = 'MyHomePage';

  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          IconButton(
              icon: Icon(Icons.login),
              onPressed: () {
                Provider.of<PageNotifier>(context, listen: false)
                    .goToOtherPage(AuthPage.pageNume);
              }),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
