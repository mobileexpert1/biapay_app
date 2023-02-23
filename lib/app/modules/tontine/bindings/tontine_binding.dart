import 'package:get/get.dart';

import '../controllers/tontine_controller.dart';

class TontineBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TontineController>(
      () => TontineController(),
    );
  }
}
