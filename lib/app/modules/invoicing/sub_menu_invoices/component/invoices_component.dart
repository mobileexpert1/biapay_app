import 'package:biapay_app/app/modules/events/views/new_event.dart';
import 'package:biapay_app/app/modules/invoicing/invoicing_list/components/invoicing_component.dart';
import 'package:biapay_app/app/widgets/biapay_ui_package.dart';
import 'package:biapay_app/app/widgets/common/bia_text.dart';
import 'package:biapay_app/app/widgets/export_file.dart';
import 'package:biapay_app/generated/locales.g.dart';
import 'package:flutter/material.dart';

import '../../../../routes/app_pages.dart';
import '../controllers/invoices_controller.dart';

class InvoicesComponent {

  Widget searchBar() {
    return Container(
      width: double.infinity,
      height: 70.h,
      padding: EdgeInsets.all(20.h),
      decoration: BoxDecoration(
          border: Border.all(width: 1.4.h, color: Colors.white),
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(15),
            topRight: Radius.circular(15),
            bottomLeft: Radius.circular(15),
            bottomRight: Radius.circular(15),
          )),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          BiaText(
            LocaleKeys.search_records.tr,
            color: Colors.white,
            fontSize: 20.h,
          ),
          Icon(
            Icons.search,
            color: Colors.white,
          )
        ],
      ),
    );
  }

  Widget actionViews(InvoicesController controller) {
    return SizedBox(
      width: double.infinity,
      height: 120.h,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              BiaText(
                LocaleKeys.invoices.tr,
                fontSize: 25.h,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
              TextButton(
                  onPressed : (){
                    var result = Get.toNamed(Routes.CREATEINVOICE);
                    if (result != null){
                      controller.getInvoices();
                    }
                  },
                  child: Row(
                    children: <Widget>[
                      Icon(
                        Icons.add_circle_outline,
                        color: Colors.white,
                        size: 35.h,
                      ),
                      SizedBox(
                        width: 5.w,
                      ),
                      BiaText(
                        LocaleKeys.create_an_invoice.tr,
                        fontSize: 22.h,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      )
                    ],
                  )),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              GestureDetector(
                onTap: () {
                  print("button 1 tapped");
                },
                  child: Icon(Icons.request_page, size: 30, color: Colors.white,)),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: GestureDetector(
                    onTap: () {
                      print("button 2 tapped");
                    },
                    child: Icon(Icons.picture_as_pdf, size: 30, color: Colors.white,)),
              ),
              GestureDetector(onTap: () {
                print("button 3 tapped");
              },
                  child: Icon(Icons.print, size: 30, color: Colors.white,)),
            ],
          )
        ],
      ),
    );
  }

  Widget returnViewList(int viewCount, List<String> itemTitleKey) {
    /*return Expanded(
      child: ListView.builder(
        itemCount: InvoicingComponent().invoices.length,
        itemBuilder: (c, i) {
          return viewHolder(itemTitleKey, itemTitleValue);
        },
      ),
    );*/
    return GetBuilder<InvoicesController>(builder: (controller) {
      print(controller.invoiceList.length);
      return Expanded(
        child: ListView.builder(
          itemCount: controller.invoiceList.length,
          itemBuilder: (c, i) {
            List<String> values = [];
            if (values != null) {
              values.clear();
            }
            values.add(controller.invoiceList[i].invoiceNo.toString());
            values.add(controller.invoiceList[i].orderNo.toString());
            values.add(controller.invoiceList[i].invoiceDate.toString());
            values.add(controller.invoiceList[i].dueDate.toString());
            values.add(controller.invoiceList[i].total.toString());
            values.add("Actions");
            return viewHolder(itemTitleKey, values);
          },
        ),
      );
    });
  }
  Widget viewHolder(List<String> itemTitleKey, List<String> itemTitleValue) {
    return Padding(
      padding: const EdgeInsets.only(top: 5, bottom: 5),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10)
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 5, bottom: 5),
          child: Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      for(String item in itemTitleKey) Padding(
                        padding: const EdgeInsets.only(top: 3, bottom: 3),
                        child: BiaText(item, fontWeight: FontWeight.w700),
                      )
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      for(String item in itemTitleValue) Padding(
                        padding: const EdgeInsets.only(top: 3, bottom: 3),
                        child: BiaText(item),
                      )
                    ],
                  )
                ]),
          ),
        ),
      ),
    );
  }
}