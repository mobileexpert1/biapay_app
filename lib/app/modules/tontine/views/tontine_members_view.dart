import 'package:biapay_app/app/widgets/biapay_ui_package.dart';
import 'package:biapay_app/app/widgets/members_component.dart';
import 'package:biapay_app/generated/locales.g.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TontineMembers extends StatelessWidget {
  const TontineMembers({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BiaScaffold(
      appBar: BiaAppBar.simple(LocaleKeys.list_of_member.tr),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(top: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BiaText(
              LocaleKeys.all_members.tr,
              color: Colors.white,
              textType: TextType.headLine5,
            ),
            SizedBox(
              height: 10.h,
            ),
            MemberComponent()
          ],
        ),
      ),
    );
  }
}
