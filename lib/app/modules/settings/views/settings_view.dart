import 'package:biapay_app/app/configs/configs.dart';
import 'package:biapay_app/app/modules/settings/views/biometric_view.dart';
import 'package:biapay_app/app/modules/settings/views/my_account_view.dart';
import 'package:biapay_app/app/modules/settings/views/notification_option_view.dart';
import 'package:biapay_app/app/routes/app_pages.dart';
import 'package:biapay_app/app/widgets/biapay_ui_package.dart';
import 'package:biapay_app/generated/locales.g.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../change_password/views/change_password_view.dart';
import '../controllers/settings_controller.dart';

class SettingsView extends GetView<SettingsController> {
  @override
  Widget build(BuildContext context) {
    final assets =
        List.generate(7, (index) => "assets/icons/s${index + 1}.png");
    return BiaScaffold(
      appBar: BiaAppBar.simple('Settings'),
      body: Container(
        padding: EdgeInsets.only(top: 25.h),
        child: Column(
          children: [
            BiaButton.withRightArrow(
              onPressed: () => Get.toNamed(Routes.BACKGROUND_IMAGES),
              text: LocaleKeys.background_images.tr,
              height: 80.h,
              assetIcon: assets.first,
            ),
            SizedBox(height: 20.h),
            BiaButton.withRightArrow(
              onPressed: controller.changeLanguage,
              text: LocaleKeys.languages.tr,
              height: 80.h,
              assetIcon: assets[1],
            ),
         //   if (isLogin) ...[
              SizedBox(height: 20.h),
              BiaButton.withRightArrow(
                onPressed: () => Get.to(() => MyAccountView()),
                text: LocaleKeys.my_account.tr,
                height: 80.h,
                assetIcon: assets[2],
              ),
              SizedBox(height: 20.h),
              BiaButton.withRightArrow(
                onPressed: () {},
                text: LocaleKeys.auth_services.tr,
                height: 80.h,
                assetIcon: assets[3],
              ),
              SizedBox(height: 20.h),
              BiaButton.withRightArrow(
                onPressed: () => Get.to(() => NotificationOptionView()),
                text: LocaleKeys.notif_option.tr,
                height: 80.h,
                assetIcon: assets[4],
              ),
              SizedBox(height: 20.h),
              BiaButton.withRightArrow(
                onPressed: () {
                  Get.to(() => BiometricView());
                },
                text: LocaleKeys.biometric_option.tr,
                height: 80.h,
                assetIcon: assets[5],
              ),
              SizedBox(height: 20.h),
              BiaButton.withRightArrow(
                onPressed: () {
                  Get.to(() => ChangePassword());
                },
                text: LocaleKeys.change_password.tr,
                height: 80.h,
                assetIcon: assets[6],
              ),
           // ]
          ],
        ),
      ),
    );
  }
}
