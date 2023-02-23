import 'package:get/get.dart';

import '../controllers/base_app_controller.dart';

class BaseAppBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BaseAppController>(
      () => BaseAppController(),
    );
  }
}
