// import 'package:biapay_app/presentation/app/home/chart/top_up/widget/top_up_form.dart';
// import 'package:biapay_app/presentation/common/biapay_ui_package.dart';
import 'package:biapay_app/app/widgets/export_file.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../generated/locales.g.dart';
import '../../../../widgets/common/bia_appbar.dart';
import '../../../../widgets/common/bia_text.dart';
// import 'package:get/get.dart';

class TopUpScreen extends StatelessWidget {
  const TopUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: BiaAppBar.simple(LocaleKeys.topup.tr),
      // appBar:  BiaAppBar(
      //     trail: InkWell(
      //       onTap: () {
      //         Get.toNamed('/top-up-history');
      //       },
      //       child: Row(
      //         children: [
      //           const Icon(Icons.history),
      //           SizedBox(
      //             width: 10.w,
      //           ),
      //           const BiaText(
      //             'History',
      //             textType: TextType.headLine6,
      //           ),
      //         ],
      //       ),
      //     ),
      //     ),
      body: Center(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                margin: EdgeInsets.only(top: 20.w),
                padding: EdgeInsets.symmetric(
                  vertical: 40.h,
                ),
                decoration: const BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20))),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    BiaText(
                      'INR 1272.00',
                      textType: TextType.headLine3,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: double.infinity,
                    ),
                    BiaText(
                      'Available Balance',
                      textType: TextType.headLine6,
                      color: Colors.white70,
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(bottom: 20.h),
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20))),
                // child: const TopUpForm(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
