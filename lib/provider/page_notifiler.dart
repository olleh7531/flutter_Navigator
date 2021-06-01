import 'package:flutter/cupertino.dart';
import 'package:flutter01_app/pages/my_home.dart';

class PageNotifier extends ChangeNotifier {
  String _currentPage = MyHomePage.pageNume;

  String get currentPage => _currentPage;

  void goToMain(){
    _currentPage = MyHomePage.pageNume;
    notifyListeners();
  }

  void goToOtherPage(String name){
    _currentPage = name;
    notifyListeners();
  }
}