import 'package:biapay_app/app/configs/assets.dart';
import 'package:biapay_app/app/widgets/common/bia_scaffold.dart';
import 'package:biapay_app/app/widgets/common/bia_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  @override
  Widget build(BuildContext context) {
    Get.put(SplashController());
    return BiaScaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 15.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox.shrink(),
            Container(
              height: 140.h,
              padding: EdgeInsets.symmetric(horizontal: 50.w),
              margin: EdgeInsets.symmetric(horizontal: 40.w),
              // width: 100.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.sp),
                color: Colors.white,
              ),
              child: Image.asset(Assets.landingLogo, fit: BoxFit.contain),
            ),
            const BiaText(
              'A product of Business Intelligence Agency SAS',
              color: Colors.white,
            )
          ],
        ),
      ),
    );
  }
}
