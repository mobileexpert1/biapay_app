import 'package:get/get.dart';

import '../controllers/request_money_merchant_controller.dart';



class GeneratePayLinkBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RequestMoneyMerchantController>(
      () => RequestMoneyMerchantController(),
    );
  }
}
