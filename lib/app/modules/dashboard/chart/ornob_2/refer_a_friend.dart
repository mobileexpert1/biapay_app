// import 'package:biapay_app/presentation/common/biapay_ui_package.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../widgets/common/bia_appbar.dart';
import '../../../../widgets/common/bia_button.dart';
import '../../../../widgets/common/bia_scaffold.dart';
import '../../../../widgets/common/bia_text.dart';

class ReferAFriend extends StatelessWidget {
  const ReferAFriend({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const String text =
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud.";

    return BiaScaffold(
        appBar: BiaAppBar.simple('Refer a friend'),
        body: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(vertical: 30.h),
          child: Column(
            children: [
              Align(
                  alignment: Alignment.centerLeft,
                  child: BiaText(
                    'Share refferal',
                    fontSize: 30.h,
                    color: Colors.white,
                  )),
              SizedBox(
                height: 20.h,
              ),
              BiaText(
                text,
                fontSize: 22.h,
                color: Colors.white,
                maxLine: 4,
                padding: EdgeInsets.only(left: 30.h),
                align: TextAlign.center,
              ),
              SizedBox(
                height: 30.h,
              ),
              DottedBorder(
                strokeWidth: 0.5,
                borderType: BorderType.RRect,
                radius: Radius.circular(5.h),
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(vertical: 20.h),
                  height: 110.h,
                  decoration: BoxDecoration(
                      // border: Border.all(width: 1),
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(5.h))),
                  child: Column(
                    children: [
                      BiaText(
                        'Your refferal code',
                        fontSize: 22.h,
                      ),
                      BiaText(
                        'ADES678697',
                        fontSize: 30.h,
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 80.h,
              ),
              Image.asset(
                "assets/images/refer a friend.png",
                height: 250.h,
              ),
              SizedBox(
                height: 30.h,
              ),
              BiaText(
                'Share via web link',
                fontSize: 22.h,
                color: Colors.white,
              ),
              Row(
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.only(left: 30.h),
                    height: 60.h,
                    width: 310.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(5.h)),
                      color: Colors.white,
                    ),
                    child: BiaText(
                      'https://www.google.com',
                      fontSize: 22.h,
                      color: Colors.grey,
                    ),
                  ),
                  BiaButton(
                    text: 'Copy',
                    onPressed: () {},
                    width: 80,
                    borderRadius: 5,
                    color: Colors.lightGreen,
                    textColor: Colors.white,
                  )
                ],
              )
            ],
          ),
        ));
  }
}
