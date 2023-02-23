import 'package:biapay_app/app/modules/invoicing/sub_menu_coupons/z_add_coupon/controller/add_coupon_controller.dart';
import '../../../../../widgets/export_file.dart';

class AddCouponBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddCouponController>(
          () => AddCouponController(),
    );
  }
}