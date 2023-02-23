import 'package:biapay_app/app/modules/invoicing/invoicing_list/components/invoicing_component.dart';
import 'package:biapay_app/app/modules/invoicing/sub_menu_customer/controller/customer_controller.dart';
import 'package:biapay_app/app/modules/invoicing/sub_menu_invoices/controllers/invoices_controller.dart';
import 'package:biapay_app/app/widgets/common/bia_scaffold.dart';
import 'package:biapay_app/app/widgets/export_file.dart';
import 'package:biapay_app/generated/locales.g.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:flutter/material.dart';

import '../components/customer_components.dart';

class CustomerView extends GetView<CustomerController> {
  @override
  Widget build(BuildContext context) {
    return BiaScaffold(
      appBar: BiaAppBar.simple(LocaleKeys.customer.tr, isShowFilter: true),
      body: Container(
        padding: EdgeInsets.only(top: 20.h),
        child: Column(
          children: [
            CustomerComponents().searchBar(),
            CustomerComponents().actionViews(context, controller),
            GetBuilder<CustomerController>(builder: (controller) {
              return CustomerComponents().returnViewList(
                  controller.customerList.length,
                  InvoicingComponent().customer);
            })
          ],
        ),
      ),
    );
  }
}
