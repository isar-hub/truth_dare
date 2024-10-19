import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../constants.dart';
import '../../room/views/room_view.dart';
import '../controllers/chat_controller.dart';

class ChatView extends GetView<ChatController> {
  const ChatView({super.key});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: CustomColors.background,
        body: Stack(
          children: [
            Column(
              children: [
      
                Expanded(
                  child: Obx(() {
                    // Ensure persons list is observable and loaded correctly
                    return ListView.builder(
                      itemCount: controller.chats.length,
                      itemBuilder: (context, index) {
                        final person = controller.chats[index];
                        return ListTile(
                          title: Text(person.message),
                        );
                      },
                    );
                  }),
                ),
              ],
            ),
             DraggableButton(
              onTap:  (){
                Get.back();
              },
            ),
      
          ],
        ),
      ),
    );
  }
}
