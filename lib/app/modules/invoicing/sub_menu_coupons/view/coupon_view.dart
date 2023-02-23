import 'package:biapay_app/app/modules/invoicing/invoicing_list/components/invoicing_component.dart';
import 'package:biapay_app/app/modules/invoicing/sub_menu_coupons/components/coupon_components.dart';
import 'package:biapay_app/app/widgets/common/bia_appbar.dart';
import 'package:biapay_app/app/widgets/common/bia_scaffold.dart';
import 'package:biapay_app/app/widgets/export_file.dart';
import 'package:biapay_app/generated/locales.g.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import '../../sub_menu_product/controller/product_controller.dart';
import '../controller/coupon_controller.dart';

class CouponsView extends GetView<CouponsController> {
  @override
  Widget build(BuildContext context) {
    return BiaScaffold(
      appBar: BiaAppBar.simple(LocaleKeys.coupons.tr, isShowFilter: true),
      body: Container(
        padding: EdgeInsets.only(top: 20.h),
        child: Column(
          children: [
            CouponsComponents().searchBar(),
            CouponsComponents().actionViews(context, controller),
            GetBuilder<CouponsController>(builder: (controller){
              return CouponsComponents().returnViewList(controller.couponList.length, InvoicingComponent().coupons);
            })
          ],
        ),
      ),
    );
  }
}