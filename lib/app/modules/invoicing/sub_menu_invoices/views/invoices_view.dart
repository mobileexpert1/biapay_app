import 'package:biapay_app/app/modules/invoicing/invoicing_list/components/invoicing_component.dart';
import 'package:biapay_app/app/modules/invoicing/sub_menu_invoices/component/invoices_component.dart';
import 'package:biapay_app/app/modules/invoicing/sub_menu_invoices/controllers/invoices_controller.dart';
import 'package:biapay_app/app/widgets/common/bia_scaffold.dart';
import 'package:biapay_app/app/widgets/export_file.dart';
import 'package:biapay_app/generated/locales.g.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:flutter/material.dart';
import '../../../../widgets/common/bia_appbar.dart';

class InvoicesView extends GetView<InvoicesController> {
  @override
  Widget build(BuildContext context) {
    return BiaScaffold(
        appBar: BiaAppBar.simple(LocaleKeys.invoices.tr, isShowFilter: true),
        body: Container(
          padding: EdgeInsets.only(top: 20.h),
          child: Column(
            children: [
              InvoicesComponent().searchBar(),
              InvoicesComponent().actionViews(controller),
              GetBuilder<InvoicesController>(builder: (controller){
                return InvoicesComponent().returnViewList(controller.invoiceList.length, InvoicingComponent().invoices);
              })
             // InvoicesComponent().returnViewList(InvoicingComponent().invoices.length, InvoicingComponent().invoices, InvoicingComponent().invoices)
            ],
          ),
        ),
    );
  }
}