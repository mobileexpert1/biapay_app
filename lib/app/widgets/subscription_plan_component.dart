import 'package:biapay_app/app/configs/configs.dart';
import 'package:biapay_app/app/widgets/biapay_ui_package.dart';
import 'package:biapay_app/generated/locales.g.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SubscriptionPlanComponent extends StatelessWidget {
  const SubscriptionPlanComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      child: Container(
        padding: EdgeInsets.all(20.sp),
        width: Get.width,
        child: Column(
          children: [
            Card(
              margin: EdgeInsets.zero,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
              color: Config.colors.blueColor,
              child: Container(
                padding:
                    EdgeInsets.symmetric(horizontal: 20.sp, vertical: 25.sp),
                width: Get.width,
                child: Column(
                  children: [
                    BiaText(
                      "Mobile money plan",
                      color: Colors.white,
                      fontSize: 20.sp,
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    Text.rich(
                      TextSpan(children: [
                        TextSpan(
                          text: "\$ 1000",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 40.sp,
                          ),
                        ),
                        TextSpan(
                          text: "  30 Days",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16.sp,
                          ),
                        )
                      ]),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            for (var i = 0; i < 4; i++)
              option("Lorem ipsum dolor sit amet, con"),
            BiaButton(
              margin: EdgeInsets.zero,
              text: LocaleKeys.buy.tr,
              onPressed: () {},
              width: 120,
              borderRadius: 6,
              color: Config.colors.blueColor,
              textColor: Colors.white,
              elevation: .5,
            ),
            SizedBox(
              height: 10,
            ),
            BiaButton(
              margin: EdgeInsets.zero,
              text: LocaleKeys.view_detail.tr,
              onPressed: () {},
              width: 200,
              borderRadius: 6,
              color: Config.colors.blueColor,
              textColor: Colors.white,
              elevation: .5,
            )
          ],
        ),
      ),
    );
  }

  Widget option(String title) {
    return Row(
      children: [
        Card(
          elevation: .4,
          shape: CircleBorder(),
          child: Padding(
            padding: const EdgeInsets.all(5),
            child: Icon(
              Icons.close,
              color: Config.colors.blueColor,
              size: 30.sp,
            ),
          ),
        ),
        SizedBox(
          width: 5,
        ),
        Expanded(
          child: BiaText(
            title,
            color: Config.colors.blueColor,
          ),
        )
      ],
    );
  }
}
