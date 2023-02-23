import 'package:get/get.dart';

import '../controllers/forgot_password_controller.dart';

class ForgotBindings extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<ForgotPasswordController>(
          () => ForgotPasswordController(),
    );
  }
}