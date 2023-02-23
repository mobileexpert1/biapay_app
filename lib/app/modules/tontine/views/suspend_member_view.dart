import 'package:biapay_app/app/widgets/biapay_ui_package.dart';
import 'package:biapay_app/generated/locales.g.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SuspendMembersView extends StatelessWidget {
  const SuspendMembersView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BiaScaffold(
      appBar: BiaAppBar.simple(LocaleKeys.suspend_member.tr),
      body: Stack(
        children: [
          SingleChildScrollView(
            padding: EdgeInsets.only(top: 15.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BiaDropdown(
                  options: ['Tontine 1', 'Tontine 2' 'Tontine 3'],
                  controller: TextEditingController(),
                  hint: LocaleKeys.select_tontine.tr,
                  displayName: (e) => e,
                  onSelected: (e) {},
                  margin: EdgeInsets.zero,
                ),
                SizedBox(
                  height: 15.h,
                ),
                BiaText(
                  LocaleKeys.suspend_member.tr,
                  textType: TextType.headLine5,
                  fontSize: 25.sp,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
                SizedBox(
                  height: 15.h,
                ),
                BiaDropdown(
                  margin: EdgeInsets.zero,
                  options: ['Member 1', 'Member 2' 'Member 3'],
                  controller: TextEditingController(),
                  hint: LocaleKeys.member.tr,
                  displayName: (e) => e,
                  onSelected: (e) {},
                ),
                SizedBox(
                  height: 20.h,
                ),
                BiaTextField(
                  padding: EdgeInsets.zero,
                  label: LocaleKeys.note_comment.tr,
                  hint: LocaleKeys.enter_note_comment.tr,
                )
              ],
            ),
          ),
          Positioned(
            bottom: 60,
            right: 0,
            left: 0,
            child: BiaButton.greenButtonInRow(
              text: LocaleKeys.save_submit.tr,
              onPressed: () {},
            ),
          )
        ],
      ),
    );
  }
}
