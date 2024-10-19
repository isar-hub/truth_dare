import 'package:get/get.dart';

import '../modules/chat/bindings/chat_binding.dart';
import '../modules/chat/views/chat_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/rolling/bindings/rolling_binding.dart';
import '../modules/rolling/views/rolling_view.dart';
import '../modules/room/bindings/room_binding.dart';
import '../modules/room/views/room_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;
  static const ROOM = Routes.ROOM;
  static const CHAT = Routes.CHAT;
  static const ROLL = Routes.ROLLING;


  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.ROOM,
      page: () => const RoomView(),
      binding: RoomBinding(),
    ),
    GetPage(
      transition: Transition.zoom,
      name: _Paths.CHAT,
      page: () => const ChatView(),
      binding: ChatBinding(),
    ),
    GetPage(
      name: _Paths.ROLLING,
      page: () => const RollingView(),
      binding: RollingBinding(),
    ),
  ];
}
