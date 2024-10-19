import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController with GetSingleTickerProviderStateMixin {
  late TabController tabController;
  final List<Tab> myTabs = const [
    Tab(text: 'Host a Game'),
    Tab(text: 'Join a Game'),
  ];

  @override
  void onInit() {
    // Initialize the TabController with 2 tabs
    tabController = TabController(length: myTabs.length, vsync: this);
    super.onInit();
  }

  @override
  void onClose() {
    tabController.dispose();
    super.onClose();
  }
}
