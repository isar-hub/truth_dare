import 'package:get/get.dart';

import '../controllers/rolling_controller.dart';

class RollingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RollingController>(
      () => RollingController(),
    );
  }
}
