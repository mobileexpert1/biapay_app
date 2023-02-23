import 'package:biapay_app/app/modules/invoicing/invoicing_list/controller/invoicing_controller.dart';
import 'package:biapay_app/app/widgets/common/bia_text.dart';
import 'package:biapay_app/app/widgets/export_file.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InvoicingComponent {
  List<String> menus = [LocaleKeys.invoices.tr, LocaleKeys.quotation.tr, LocaleKeys.customer.tr, LocaleKeys.product.tr, LocaleKeys.coupons.tr];

  // Submenus
  List<String> invoices = [
    LocaleKeys.invoiceNo.tr, LocaleKeys.orderNo.tr,
    LocaleKeys.invoiceDateTime.tr, LocaleKeys.dueDateTime.tr,
    LocaleKeys.total.tr, LocaleKeys.actions.tr
  ];
  List<String> customer = [
    LocaleKeys.fullName.tr, LocaleKeys.phoneNumber.tr,
    LocaleKeys.email.tr, LocaleKeys.city.tr,
    LocaleKeys.zip_code.tr, LocaleKeys.addr_one.tr,
    LocaleKeys.reference.tr, LocaleKeys.website.tr,
    LocaleKeys.taxRate.tr, LocaleKeys.actions.tr
  ];
  List<String> product = [
    LocaleKeys.name.tr, LocaleKeys.description.tr,
    LocaleKeys.tax.tr, LocaleKeys.salesPrice.tr,
    LocaleKeys.purchasePrice.tr, LocaleKeys.category.tr,
    LocaleKeys.actions.tr
  ];
  List<String> coupons = [
    LocaleKeys.name.tr, LocaleKeys.discountAmount.tr,
    LocaleKeys.type.tr, LocaleKeys.start_date.tr,
    LocaleKeys.end_date.tr, LocaleKeys.status.tr,
    LocaleKeys.maxUser.tr
  ];

  Widget invoicingMenu(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 25.h),
      child: invoicingMenuList(context),
    );
  }

  Widget invoicingMenuList(BuildContext context) {
    return Column(
      children: [for (var item in menus) invoicingMenuItem(context, menus.indexOf(item))],
    );
  }

  Widget invoicingMenuItem(BuildContext context, int selectedRow) {
    return Padding(
      padding: EdgeInsets.only(top: 10.h, bottom: 10.h),
      child: GestureDetector(
        onTap: () {
          InvoicingController().handleNavigationFormInvoicing(selectedRow);
        },
        child: Container(
            width: Get.width,
            height: 55.h,
            decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(15.r)),
            child: menuItemRow(menus[selectedRow])),
      ),
    );
  }

  Widget menuItemRow(String rowTitle) {
    return Align(
        alignment: Alignment.centerLeft, child: Padding(padding: EdgeInsets.only(left: 20.w, right: 20.w), child: menuItemRowBody(rowTitle)));
  }

  Widget menuItemRowBody(String rowTitle) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        BiaText(
          rowTitle,
          fontSize: 18.sp,
          fontWeight: FontWeight.w600,
        ),
        Icon(Icons.arrow_forward_ios_rounded, size: 20.h)
      ],
    );
  }
}
