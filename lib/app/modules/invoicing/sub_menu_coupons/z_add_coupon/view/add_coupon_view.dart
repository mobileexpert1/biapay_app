import 'package:biapay_app/app/modules/invoicing/sub_menu_coupons/z_add_coupon/components/add_coupon_component.dart';
import 'package:biapay_app/app/modules/invoicing/sub_menu_coupons/z_add_coupon/controller/add_coupon_controller.dart';
import '../../../../../widgets/export_file.dart';

class AddCouponView extends GetView<AddCouponController> {

  @override
  Widget build(BuildContext context) {
    return BiaScaffold(
      appBar: BiaAppBar.simple(LocaleKeys.add_new_coupon.tr, isShowFilter: true),
      body: Container(
        padding: EdgeInsets.only(top: 20.h),
        child: AddCouponComponent().viewHolder(controller, context)
      ),
    );
  }
}