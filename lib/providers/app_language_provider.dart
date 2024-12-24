import 'package:flutter/material.dart';

class AppLanguageProvider extends ChangeNotifier{
  //Used to save data(locale),,function changes language

  String appLanguage="en";
  void changeLanguage(String newLanguage){
    if(newLanguage==appLanguage){
return;
    }
    appLanguage=newLanguage;
    notifyListeners();

  }

}