import 'package:biapay_app/app/configs/configs.dart';
import 'package:biapay_app/app/modules/settings/controllers/settings_controller.dart';
import 'package:biapay_app/app/widgets/biapay_ui_package.dart';
import 'package:biapay_app/generated/locales.g.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BiometricView extends StatelessWidget {
  const BiometricView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<SettingsController>();
    return BiaScaffold(
      appBar: BiaAppBar.simple(LocaleKeys.biometric_option.tr),
      body: Container(
        padding: EdgeInsets.only(top: 25.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6)),
              margin: EdgeInsets.zero,
              child: ListTile(
                contentPadding: EdgeInsets.symmetric(vertical: 5),
                title: BiaText(
                  LocaleKeys.finger_print.tr,
                  fontSize: 25.sp,
                  color: Config.colors.greyColor2,
                ),
                leading: Obx(() => IgnorePointer(
                      ignoring: !controller.availableBiometric.value,
                      child: Switch.adaptive(
                          activeColor: Config.colors.greenColor,
                          value: controller.enabledBiometric.value,
                          onChanged: controller.changeStatusBiometric),
                    )),
              ),
            )
          ],
        ),
      ),
    );
  }
}
