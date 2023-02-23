import 'package:biapay_app/app/widgets/biapay_ui_package.dart';
import 'package:biapay_app/app/widgets/pending_approval_component.dart';
import 'package:biapay_app/generated/locales.g.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PendingApprovalView extends StatelessWidget {
  const PendingApprovalView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.height;
    return BiaScaffold(
      appBar: BiaAppBar.simple(LocaleKeys.pendin_approval.tr),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(top: 20.h),
        child: Column(
          children: [
            BiaTextField(
              padding: EdgeInsets.zero,
              hint: '',
            ),
            SizedBox(
              height: 20.h,
            ),
            for (var i = 0; i < 5; i++)
              Container(
                  margin: EdgeInsets.only(bottom: 15.h),
                  child: PendingApprovalComponent()),
          ],
        ),
      ),
    );
  }
}
