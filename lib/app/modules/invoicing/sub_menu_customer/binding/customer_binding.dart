import 'package:biapay_app/app/modules/invoicing/sub_menu_customer/controller/customer_controller.dart';
import 'package:get/get.dart';

class CustomerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CustomerController>(
          () => CustomerController(),
    );
  }
}