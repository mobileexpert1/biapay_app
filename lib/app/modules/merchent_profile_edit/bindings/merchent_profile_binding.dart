import 'package:get/get.dart';

import '../controllers/merchent_profile_controller.dart';


class MerchentProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MerchentProfileController>(
      () => MerchentProfileController(),
    );
  }
}
