import 'package:get/get.dart';

import '../controllers/bulk_genearte_pay_link_controller.dart';
import '../controllers/request_money_merchant_controller.dart';



class BulkGeneratePayLinkBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BulkGeneratePayLinkController>(
      () => BulkGeneratePayLinkController(),
    );
  }
}
