import 'package:get/get.dart';

import '../controllers/recover_password_controller.dart';


class RecoverBindings extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<RecoverPasswordController>(
          () => RecoverPasswordController(),
    );
  }
}