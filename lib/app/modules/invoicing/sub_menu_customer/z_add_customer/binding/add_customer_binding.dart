import 'package:biapay_app/app/modules/invoicing/sub_menu_customer/z_add_customer/controller/add_customer_controller.dart';
import '../../../../../widgets/export_file.dart';

class AddCustomerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddCustomerController>(
          () => AddCustomerController(),
    );
  }
}