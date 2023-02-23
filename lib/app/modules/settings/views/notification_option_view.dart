import 'package:biapay_app/app/configs/configs.dart';
import 'package:biapay_app/app/modules/settings/controllers/settings_controller.dart';
import 'package:biapay_app/app/widgets/biapay_ui_package.dart';
import 'package:biapay_app/app/widgets/custom_switch.dart';
import 'package:biapay_app/generated/locales.g.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NotificationOptionView extends StatelessWidget {
  const NotificationOptionView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<SettingsController>();
    return BiaScaffold(
      appBar: BiaAppBar.simple(LocaleKeys.notif_option.tr),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(top: 20.h),
        child: Column(
          children: [
            Obx(
              () => item(
                LocaleKeys.push_notif.tr,
                value: controller.pushNotifStatus.value,
                onChanged: controller.onChangedPushNotificationStatus,
                color: Config.colors.greenColor,
              ),
            ),
            SizedBox(
              height: 15.h,
            ),
            Obx(
              () => item(
                LocaleKeys.sms.tr,
                value: controller.smsStatus.value,
                onChanged: controller.onChangedSmsStatus,
                color: Config.colors.redColor,
              ),
            ),
            SizedBox(
              height: 15.h,
            ),
            Obx(
              () => item(
                LocaleKeys.email.tr,
                value: controller.emailStatus.value,
                onChanged: controller.onChangedEmailStatus,
                color: Config.colors.greenColor,
              ),
            ),
            //vues presques ok
          ],
        ),
      ),
    );
  }

  Widget item(
    String title, {
    Color? color,
    required void Function(bool value) onChanged,
    required bool value,
  }) {
    return Card(
      margin: EdgeInsets.zero,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10),
        height: 60,
        child: Row(
          children: [
            CustomSwitch(
              value: value,
              onChanged: onChanged,
              color: color,
            ),
            SizedBox(
              width: 10,
            ),
            Expanded(
              child: BiaText(
                title,
                textType: TextType.headLine5,
                fontSize: 25.sp,
                fontWeight: FontWeight.w500,
                color: Config.colors.blueColor,
              ),
            )
          ],
        ),
      ),
    );
  }
}
