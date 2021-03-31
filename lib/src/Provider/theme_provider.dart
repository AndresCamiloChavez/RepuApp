



import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ThemeChanger with ChangeNotifier{


  bool _themeDark = false;
  int _numTema = 1;
  ThemeData _themeData;

  ThemeChanger(int value){
    switch (value) {
      case 1:
      _themeDark = false;
      _themeData = ThemeData.light();
       break;
      case 2:
      _themeDark = true;
      _themeData = ThemeData.dark();
       break; 
      default:
       _themeDark = false;
      _themeData = ThemeData.light();
      
    }
  }

  bool get themeDark => _themeDark;

  set themeDark (bool value){

    _themeDark = value;

    if(value){
      _themeData = ThemeData.dark().copyWith(
        accentColor: Color.fromRGBO(139, 53, 61, 1.0)
      );
      _numTema = 2;
    }else{

      _themeData = ThemeData.light();
      _numTema = 1;
    }
    notifyListeners();

  }

  int get numTema =>_numTema;

  set numTema (int actual ) {
    _numTema =  actual;
    notifyListeners();
  }
  ThemeData get themeData => _themeData;
}