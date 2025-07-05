import 'package:flutter/material.dart';

class CarouselProvider extends ChangeNotifier{
  int index =0;
  
  void change(int value){
   index=value;
   notifyListeners();
  }

}