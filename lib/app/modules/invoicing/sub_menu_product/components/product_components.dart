import 'package:biapay_app/app/modules/events/views/new_event.dart';
import 'package:biapay_app/app/modules/invoicing/invoicing_list/components/invoicing_component.dart';
import 'package:biapay_app/app/modules/invoicing/sub_menu_product/controller/product_controller.dart';
import 'package:biapay_app/app/routes/app_pages.dart';
import 'package:biapay_app/app/widgets/biapay_ui_package.dart';
import 'package:biapay_app/generated/locales.g.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductComponents {

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

  Widget actionViews(BuildContext context, ProductController controller) {
    return SizedBox(
      width: double.infinity,
      height: 170.h,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 25, bottom: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.white, width: 1)
                  ),
                  width: MediaQuery.of(context).size.width / 2.25,
                  child: TextButton(
                      onPressed : (){
                        var result = Get.toNamed(Routes.ADDPRODUCT);
                        if (result != null) {
                          controller.getProductList();
                        }
                      },
                      child: BiaText(
                        LocaleKeys.add_product.tr,
                        fontSize: 18.h,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      )),
                ),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.white, width: 1)
                  ),
                  width: MediaQuery.of(context).size.width / 2.25,
                  child: TextButton(
                      onPressed : (){},
                      child: BiaText(
                        LocaleKeys.bulk_import_product.tr,
                        fontSize: 18.h,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      )),
                ),
              ],
            ),
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
    return GetBuilder<ProductController>(builder: (controller){
      return Expanded(
        child: ListView.builder(
          itemCount: controller.productList.length,
          itemBuilder: (c, i) {
            List<String> values = [];
            if (values != null) {
              values.clear();
            }
            values.add(controller.productList[i].name.toString());
            values.add(controller.productList[i].description.toString());
            values.add(controller.productList[i].tax.toString());
            values.add(controller.productList[i].salePrice.toString());
            values.add(controller.productList[i].purchasePrice.toString());
            values.add(controller.productList[i].category.toString());
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