import 'package:biapay_app/app/modules/invoicing/sub_menu_invoices/controllers/invoices_controller.dart';
import 'package:get/get.dart';

class InvoicesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<InvoicesController>(
          () => InvoicesController(),
    );
  }
}