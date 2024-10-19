import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:truth_dare/app/constants.dart';
import 'package:truth_dare/app/routes/app_pages.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.background,
      appBar: AppBar(
        title: const Text(
          'HomeView',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: CustomColors.white,
        bottom: TabBar(
          controller: controller.tabController,
          tabs: controller.myTabs,
          indicatorColor: Colors.blue,
          labelColor: Colors.black,
        ),
      ),
      body: TabBarView(
        controller: controller.tabController,
        children: [
          buildHostAGame(),
          buildJoinAGame(),
        ],
      ),
    );
  }

  Widget buildHostAGame() {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Room Name',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter Room Name',
              ),
            ),
            const SizedBox(height: 16),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Logic to create a game
                  Get.toNamed(AppPages.ROOM);
                },
                child: const Text('Create'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildJoinAGame() {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Room Name',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter Room code to Join',
              ),
            ),
            const SizedBox(height: 16),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Logic to join a game
                },
                child: const Text('Join'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
