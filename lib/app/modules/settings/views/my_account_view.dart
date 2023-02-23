import 'package:biapay_app/app/configs/assets.dart';
import 'package:biapay_app/app/widgets/biapay_ui_package.dart';
import 'package:biapay_app/app/widgets/my_account_component.dart';
import 'package:biapay_app/generated/locales.g.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyAccountView extends StatelessWidget {
  const MyAccountView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BiaScaffold(
      appBar: BiaAppBar.simple(LocaleKeys.my_account.tr),
      body: SingleChildScrollView(
        child: Column(
          children: [
            MyAccountComponent(
              title: "Wallet account",
              color: Color(0xFFFBF5BB),
              asset: Assets.a1,
            ),
            SizedBox(
              height: 15.sp,
            ),
            MyAccountComponent(
              title: "Bank account",
              color: Color(0xFFC9DBFF),
              asset: Assets.a2,
            ),
            SizedBox(
              height: 15.sp,
            ),
            MyAccountComponent(
              title: "Credit/Debit card",
              color: Color(0xFFCDFDFF),
              asset: Assets.a3,
            ),
            SizedBox(
              height: 15.sp,
            ),
            MyAccountComponent(
              title: "Virtuel Card",
              color: Color(0xFFD1FED3),
              asset: Assets.a4,
            ),
            SizedBox(
              height: 15.sp,
            ),
          ],
        ),
      ),
    );
  }
}
