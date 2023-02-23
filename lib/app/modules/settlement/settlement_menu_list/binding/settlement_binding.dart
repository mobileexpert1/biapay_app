import 'package:biapay_app/app/modules/settlement/settlement_menu_list/controller/settlement_controller.dart';
import 'package:get/get.dart';

class SettlementBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SettlementController>(
          () => SettlementController(),
    );
  }
}