import 'package:biapay_app/app/configs/configs.dart';
import 'package:biapay_app/app/configs/get_extension.dart';
import 'package:biapay_app/app/widgets/biapay_ui_package.dart';
import 'package:flutter/material.dart';

import 'package:biapay_app/app/widgets/common/bia_custom_radio.dart';
import 'package:get/get.dart';

class MyCardComponent<T> extends StatelessWidget {
  const MyCardComponent({
    Key? key,
    required this.value,
    required this.groupValue,
    required this.onChanged,
  }) : super(key: key);
  final T value;
  final T groupValue;
  final void Function(T value) onChanged;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      elevation: 1,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      child: Container(
        height: 75,
        padding: EdgeInsets.all(10),
        child: Row(
          children: [
            CustomRadio(
              value: value,
              groupValue: groupValue,
              onChanged: onChanged,
              enabledColor: Config.colors.blueColor2,
            ),
            SizedBox(
              width: 10,
            ),
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BiaText(
                  "HDFC Bank Debit Card",
                  textType: TextType.headLine5,
                  color: Config.colors.blueColor2,
                  fontWeight: FontWeight.w800,
                  fontSize: 20.sp,
                ),
                SizedBox(
                  height: 10.h,
                ),
                BiaText(
                  Get.formatNumberCard("1234123412341234"),
                  color: Config.colors.blueColor2,
                  fontSize: 20.sp,
                ),
              ],
            )),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Icon(Icons.payment),
              ],
            )
          ],
        ),
      ),
    );
  }
}
