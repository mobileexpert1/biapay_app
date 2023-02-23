import 'package:biapay_app/app/modules/invoicing/invoicing_list/controller/invoicing_controller.dart';
import 'package:get/get.dart';

class InvoicingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<InvoicingController>(
          () => InvoicingController(),
    );
  }
}