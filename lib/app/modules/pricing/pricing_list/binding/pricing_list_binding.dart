import 'package:biapay_app/app/modules/pricing/pricing_list/controller/pricing_list_controller.dart';
import 'package:biapay_app/app/widgets/export_file.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/bindings_interface.dart';

class PricingListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PricingListController>(
          () => PricingListController(),
    );
  }
}