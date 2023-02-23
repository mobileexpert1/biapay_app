import 'package:biapay_app/app/modules/invoicing/invoicing_list/components/invoicing_component.dart';
import 'package:biapay_app/app/modules/invoicing/sub_menu_product/components/product_components.dart';
import 'package:biapay_app/app/modules/invoicing/sub_menu_product/controller/product_controller.dart';
import 'package:biapay_app/app/widgets/common/bia_appbar.dart';
import 'package:biapay_app/app/widgets/common/bia_scaffold.dart';
import 'package:biapay_app/app/widgets/export_file.dart';
import 'package:biapay_app/generated/locales.g.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

class ProductView extends GetView<ProductController> {
  @override
  Widget build(BuildContext context) {
    return BiaScaffold(
      appBar: BiaAppBar.simple(LocaleKeys.product.tr, isShowFilter: true),
      body: Container(
        padding: EdgeInsets.only(top: 20.h),
        child: Column(
          children: [
            ProductComponents().searchBar(),
            ProductComponents().actionViews(context, controller),
            GetBuilder<ProductController>(builder: (controller){
              return ProductComponents().returnViewList(controller.productList.length, InvoicingComponent().product);
            })
          ],
        ),
      ),
    );
  }
}