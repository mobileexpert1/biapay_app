import 'package:get/get.dart';

import '../controllers/genearte_pay_link_controller.dart';
import '../controllers/request_money_merchant_controller.dart';



class RequestMoneyMerchantBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GeneratePayLinkController>(
      () => GeneratePayLinkController(),
    );
  }
}
