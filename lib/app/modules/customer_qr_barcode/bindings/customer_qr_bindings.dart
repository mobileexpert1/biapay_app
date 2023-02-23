import 'package:get/get.dart';

import '../controllers/customer_qr_controller.dart';


class CustomerQrBindings extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<CustomerQrController>(
          () => CustomerQrController(),
    );
  }
}