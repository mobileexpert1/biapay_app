import 'package:biapay_app/app/modules/invoicing/invoicing_list/components/invoicing_component.dart';
import 'package:biapay_app/app/modules/invoicing/invoicing_list/controller/invoicing_controller.dart';
import 'package:biapay_app/app/widgets/common/bia_appbar.dart';
import 'package:biapay_app/app/widgets/common/bia_scaffold.dart';
import 'package:biapay_app/generated/locales.g.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class InvoicingView extends GetView<InvoicingController> {
  @override
  Widget build(BuildContext context) {
    return BiaScaffold(
      appBar: BiaAppBar.simple(LocaleKeys.invoicing.tr, isShowFilter: true),
      body: InvoicingComponent().invoicingMenu(context)
    );
  }
}
