import 'package:get/get.dart';

import '../controllers/referal_controller.dart';


class ReferalBindings extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<ReferalController>(
          () => ReferalController(),
    );
  }
}