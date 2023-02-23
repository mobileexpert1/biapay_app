import 'package:get/get.dart';

import '../controllers/merchant_profile_dash_controller.dart';






class MerchantProfileDashBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MerchantProfileDashController>(
          () => MerchantProfileDashController(),
    );
  }
}
