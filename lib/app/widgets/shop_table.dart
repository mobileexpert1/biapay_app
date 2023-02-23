import 'package:biapay_app/app/widgets/common/bia_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ShopTable extends StatelessWidget {
  // final ShopList shopList;
  // const ShopTable({required this.shopList});

  @override
  Widget build(BuildContext context) {
    return Table(
      border: TableBorder.all(color: Colors.grey.shade300),
      columnWidths: const {
        0: FlexColumnWidth(4),
        1: FlexColumnWidth(2),
      },
      children: [
            TableRow(children: [
              Container(
                  alignment: Alignment.center,
                  color: Colors.greenAccent.withOpacity(0.3),
                  padding: EdgeInsets.symmetric(vertical: 10.h),
                  child: const BiaText(
                    'Name',
                    fontWeight: FontWeight.bold,
                  )),
              Container(
                  alignment: Alignment.center,
                  color: Colors.greenAccent.withOpacity(0.3),
                  padding: EdgeInsets.symmetric(vertical: 10.h),
                  child: const BiaText(
                    'Actions',
                    fontWeight: FontWeight.bold,
                  )),
            ]),
          ] +
          ["Shop 1", "Shop 2", "Shop 3", "Shop 4"]
              .map((shop) => TableRow(children: [
                    Container(
                        // alignment: Alignment.center,
                        padding: EdgeInsets.symmetric(
                            vertical: 10.h, horizontal: 5.w),
                        child: BiaText(
                          shop,
                          // color: shop.status ? Colors.blue : Colors.redAccent,
                          fontWeight: FontWeight.bold,
                        )),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () {
                            // Get.dialog(UpdateShopDialogue(
                            //   shop: shop,
                            // ));
                          },
                          child: Container(
                            margin: EdgeInsets.all(2.w),
                            decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.circular(5)),
                            alignment: Alignment.center,
                            padding: EdgeInsets.all(5.w),
                            child: const Icon(Icons.edit, color: Colors.white),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.all(2.w),
                          decoration: BoxDecoration(
                              color: Colors.teal,
                              borderRadius: BorderRadius.circular(5)),
                          alignment: Alignment.center,
                          padding: EdgeInsets.all(5.w),
                          child: const Icon(Icons.remove_red_eye,
                              color: Colors.white),
                        )
                      ],
                    ),
                  ]))
              .toList(),
    );
  }
}
