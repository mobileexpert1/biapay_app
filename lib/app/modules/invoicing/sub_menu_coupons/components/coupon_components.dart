import 'package:biapay_app/app/modules/coupon/controllers/coupon_controller.dart';
import 'package:biapay_app/app/modules/events/views/new_event.dart';
import 'package:biapay_app/app/modules/invoicing/invoicing_list/components/invoicing_component.dart';
import 'package:biapay_app/app/widgets/export_file.dart';
import 'package:flutter/material.dart';

import '../../../../routes/app_pages.dart';
import '../controller/coupon_controller.dart';

class CouponsComponents {

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

  Widget actionViews(BuildContext context, CouponsController controller) {
    return Container(
      width: double.infinity,
      height: 100.h,
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
                  var result = Get.toNamed(Routes.ADDCOUPON);
                  if (result != null) {
                    controller.getCouponList();
                  }
                },
                child: BiaText(
                  LocaleKeys.add_new_coupon.tr,
                  fontSize: 18.h,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                )),
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
    return GetBuilder<CouponsController>(builder: (controller) {
      print(controller.couponList.length);
      return Expanded(
        child: ListView.builder(
          itemCount: controller.couponList.length,
          itemBuilder: (c, i) {
            List<String> values = [];
            if (values != null) {
              values.clear();
            }
            values.add(controller.couponList[i].name.toString());
            values.add(controller.couponList[i].amount.toString());
            values.add(controller.couponList[i].couponType.toString());
            values.add(controller.couponList[i].startDate.toString());
            values.add(controller.couponList[i].endDate.toString());
            values.add(controller.couponList[i].couponStatus.toString());
            values.add(controller.couponList[i].maxUsage.toString());
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