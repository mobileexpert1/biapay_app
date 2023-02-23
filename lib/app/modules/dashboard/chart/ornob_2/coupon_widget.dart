// import 'package:biapay_app/presentation/app/home/chart/ornob_2/refer_a_friend.dart';
// import 'package:biapay_app/presentation/common/biapay_ui_package.dart';
import 'package:biapay_app/app/modules/dashboard/chart/ornob_2/refer_a_friend.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../widgets/common/bia_button.dart';
import '../../../../widgets/common/bia_text.dart';

class CouponWidget extends StatelessWidget {
  const CouponWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20.h),
      padding: EdgeInsets.only(left: 20.h, top: 20.h, bottom: 20.h),
      // height: 320.h,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(20.h)),
      ),
      child: Column(
        children: [
          Image.asset(
            "assets/images/refer a friend.png",
            height: 100.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  const BiaText(
                    'Lorem Ispumx',
                    textType: TextType.headLine6,
                  ),
                  BiaText(
                    'welcome01',
                    textType: TextType.headLine5,
                    color: Colors.indigo[900],
                  )
                ],
              ),
              BiaButton(
                text: 'View code',
                onPressed: () {
                  Get.to(() => const ReferAFriend());
                },
                width: 120.w,
                // margin: EdgeInsets.zero,
                color: Colors.indigo[900],
                textColor: Colors.white,
                textType: TextType.body1,
              )
            ],
          ),
          BiaText(
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's ",
            textType: TextType.body3,
            color: Colors.grey,
            padding: EdgeInsets.symmetric(vertical: 10.h),
          ),
          const Align(
              alignment: Alignment.centerLeft,
              child: BiaText(
                'Expire on: 31 June,2021',
                textType: TextType.headLine5,
              ))
        ],
      ),
    );
  }
}
