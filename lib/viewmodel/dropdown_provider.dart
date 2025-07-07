import 'package:flutter/material.dart';

class DropdownProvider extends ChangeNotifier{
  String? eventType;

  void selectEvent(String event){
     eventType = event;
     notifyListeners();
  }
}