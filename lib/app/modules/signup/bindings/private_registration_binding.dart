import 'package:get/get.dart';

import '../controllers/private_registration_controller.dart';


class PrivateRegistrationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PrivateRegistrationController>(
          () => PrivateRegistrationController(),
    );
  }
}
