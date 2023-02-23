import 'package:get/get.dart';

import '../controllers/subscription_information_controller.dart';



class SubscriptionInfoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SubscriptionInfoController>(
          () => SubscriptionInfoController(),
    );
  }
}
