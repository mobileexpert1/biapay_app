import 'package:biapay_app/app/configs/configs.dart';
import 'package:biapay_app/app/modules/tontine/views/pending_approval_view.dart';
import 'package:biapay_app/app/modules/tontine/views/suspend_member_view.dart';
import 'package:biapay_app/app/modules/tontine/views/tontine_members_view.dart';
import 'package:biapay_app/app/widgets/biapay_ui_package.dart';
import 'package:biapay_app/generated/locales.g.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TontineDetailView extends StatelessWidget {
  const TontineDetailView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BiaScaffold(
      hasSidePadding: false,
      appBar: BiaAppBar.simple('Tontine'),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: 30.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: Config.defaultPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BiaText(
                    'Tontine 1',
                    fontSize: 30.h,
                    color: Colors.white,
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      BiaText(
                        '43473.50 ',
                        fontSize: 34.h,
                        color: Colors.white,
                      ),
                      BiaText(
                        'XAF ',
                        fontSize: 24.h,
                        color: Colors.white,
                      ),
                      Icon(
                        Icons.arrow_circle_down,
                        color: Colors.white,
                        size: 26.h,
                      )
                    ],
                  ),
                  BiaText(
                    'Tontine total balance',
                    fontSize: 20.h,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
            Container(
              height: 150.h,
              margin: EdgeInsets.only(bottom: 30.h),
              child: ListView.builder(
                padding: EdgeInsets.only(
                  left: Config.defaultPadding,
                ),
                itemCount: 3,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => Container(
                  width: 250.w,
                  margin: EdgeInsets.only(top: 20.h, right: 20.h),
                  padding: EdgeInsets.all(20.h),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15),
                      bottomLeft: Radius.circular(15),
                      bottomRight: Radius.circular(15),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      BiaText(
                        '20',
                        fontSize: 35.h,
                        fontWeight: FontWeight.w500,
                      ),
                      SizedBox(
                        height: 8.h,
                      ),
                      BiaText(
                        'Active members',
                        fontSize: 22.h,
                      )
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: Config.defaultPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BiaText(
                    'Important links',
                    fontSize: 30.sp,
                    color: Colors.white,
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  BiaButton.withRightArrow(
                    radius: 6,
                    height: 80.h,
                    onPressed: () {},
                    text: LocaleKeys.contribution.tr,
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  BiaButton.withRightArrow(
                    text: LocaleKeys.invit_new_member.tr,
                    radius: 6,
                    height: 80.h,
                    onPressed: () {},
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  BiaButton.withRightArrow(
                    text: LocaleKeys.suspend_member.tr,
                    radius: 6,
                    height: 80.h,
                    onPressed: () => Get.to(() => SuspendMembersView()),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  BiaButton.withRightArrow(
                    text: LocaleKeys.reactivated_member.tr,
                    radius: 6,
                    height: 80.h,
                    onPressed: () {},
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  BiaButton.withRightArrow(
                    text: LocaleKeys.pendin_approval.tr,
                    radius: 6,
                    height: 80.h,
                    onPressed: () => Get.to(() => PendingApprovalView()),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  BiaButton.withRightArrow(
                    text: LocaleKeys.delete_member.tr,
                    radius: 6,
                    height: 80.h,
                    onPressed: () {},
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  BiaButton.withRightArrow(
                    radius: 6,
                    height: 80.h,
                    onPressed: () {},
                    text: LocaleKeys.tontine_history.tr,
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  BiaButton.withRightArrow(
                    text: LocaleKeys.list_of_member.tr,
                    radius: 6,
                    height: 80.h,
                    onPressed: () => Get.to(() => TontineMembers()),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
