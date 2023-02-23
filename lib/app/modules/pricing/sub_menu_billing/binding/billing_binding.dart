import 'package:biapay_app/app/modules/pricing/sub_menu_billing/controller/billing_controller.dart';
import '../../../../widgets/export_file.dart';

class BillingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BillingController>(
          () => BillingController(),
    );
  }
}