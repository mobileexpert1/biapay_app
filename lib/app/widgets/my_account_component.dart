import 'package:biapay_app/app/configs/configs.dart';
import 'package:biapay_app/app/widgets/common/bia_custom_radio.dart';
import 'package:flutter/material.dart';

import 'package:biapay_app/app/widgets/biapay_ui_package.dart';

class MyAccountComponent extends StatelessWidget {
  const MyAccountComponent({
    Key? key,
    this.color,
    required this.title,
    required this.asset,
  }) : super(key: key);
  final Color? color;
  final String title;
  final String asset;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10.h, top: 10.h),
      padding: EdgeInsets.all(20.h),
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(15),
          topLeft: Radius.circular(15),
          bottomRight: Radius.circular(15),
          bottomLeft: Radius.circular(15),
        ),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: color,
                ),
                alignment: Alignment.center,
                child: Image.asset(
                  asset,
                  width: 22,
                  height: 22,
                ),
              ),
              BiaText(
                title,
                fontSize: 18,
              ),
            ],
          ),
          Row(
            children: [
              CustomRadio(
                value: true,
                groupValue: true,
                onChanged: (dynamic v) {},
                enabledColor: Config.colors.blueColor,
              ),
              SizedBox(
                width: 10,
              ),
              BiaText(
                "Select as primary account",
                color: Config.colors.blueColor,
                fontSize: 20.sp,
              )
            ],
          )
        ],
      ),
    );
  }
}
