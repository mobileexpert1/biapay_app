import 'package:get/get.dart';

import '../controllers/paylink_controller.dart';



class PayLinkBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PayLinkController>(
      () => PayLinkController(),
    );
  }
}
