import 'package:biapay_app/app/modules/ecommerce/z_ecommerce_detail/ecommerce_detail_controller/ecommerce_detail_controller.dart';
import 'package:get/get.dart';

class EcommerceDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EcommerceDetailController>(
          () => EcommerceDetailController(),
    );
  }
}