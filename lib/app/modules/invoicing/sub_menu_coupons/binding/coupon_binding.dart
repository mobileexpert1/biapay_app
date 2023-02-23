import 'package:biapay_app/app/modules/invoicing/sub_menu_coupons/controller/coupon_controller.dart';
import 'package:biapay_app/app/widgets/export_file.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/bindings_interface.dart';

class CouponsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CouponsController>(
          () => CouponsController(),
    );
  }
}