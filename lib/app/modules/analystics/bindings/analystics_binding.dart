import 'package:get/get.dart';

import '../controllers/analystics_controller.dart';

class AnalysticsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AnalysticsController>(
      () => AnalysticsController(),
    );
  }
}
