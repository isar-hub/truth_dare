import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class RollingController extends GetxController {
  double _move = 10;
  double _startPos = 0;

  double get startPos => _startPos;
  double get move => _move;

  @override
  void onInit() {
    _startPos = 0;
    super.onInit();
  }

  void setPos(double valueStart){
    _startPos = valueStart;
    _move = move +10;
    update();
  }

  void setMove(){
    _move = 10;
    update();
  }
}
