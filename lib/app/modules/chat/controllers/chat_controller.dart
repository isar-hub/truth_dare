import 'package:get/get.dart';
import 'package:truth_dare/app/data/chat_model.dart';

class ChatController extends GetxController {

  var chats = <ChatModel>[].obs;

  final count = 0.obs;
  @override
  void onInit() {

    chats.addAll(
      [
        ChatModel(message: 'message'),
        ChatModel(message: 'message'),
        ChatModel(message: 'message'),
        ChatModel(message: 'message'),
      ]
    );
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
