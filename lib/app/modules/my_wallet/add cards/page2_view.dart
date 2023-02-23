import 'package:biapay_app/app/widgets/biapay_ui_package.dart';
import 'package:biapay_app/app/widgets/my_card_component.dart';
import 'package:flutter/material.dart';

class PageTwoView extends StatelessWidget {
  const PageTwoView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        children: [
          SizedBox(
            height: 15.h,
          ),
          MyCardComponent(value: true, groupValue: true, onChanged: (v) {}),
          SizedBox(
            height: 15.h,
          ),
          MyCardComponent(value: true, groupValue: false, onChanged: (v) {}),
          SizedBox(
            height: 15.h,
          ),
          MyCardComponent(value: true, groupValue: false, onChanged: (v) {}),
        ],
      ),
    );
  }
}
