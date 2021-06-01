import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter01_app/pages/auth_page.dart';
import 'package:flutter01_app/provider/page_notifiler.dart';
import 'package:provider/provider.dart';

import 'pages/my_home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  //String currentPage =MyHomePage.pageNume;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_)=> PageNotifier())],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,

        home: Consumer<PageNotifier>(
          builder: (context, pageNotifier, child) {
            return Navigator(
              pages: [
                MaterialPage(
                  key: ValueKey(MyHomePage.pageNume),
                  child: MyHomePage(title: 'Flutter Demo Home Page'),
                ),
                if(pageNotifier.currentPage == AuthPage.pageNume)AuthPage(),
              ],
              onPopPage: (route, result) {
                if(!route.didPop(result)){
                  return false;
                }
                return true;
              },
            );
          },
        ),
      ),
    );
  }
}
