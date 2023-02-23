import 'package:biapay_app/app/configs/localization_service.dart';
import 'package:biapay_app/app/modules/settings/controllers/settings_controller.dart';
import 'package:biapay_app/app/widgets/biapay_ui_package.dart';
import 'package:biapay_app/app/widgets/common/bia_custom_radio.dart';
import 'package:biapay_app/generated/locales.g.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChangeLanguageView extends StatelessWidget {
  const ChangeLanguageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<SettingsController>();
    return BiaScaffold(
      appBar: BiaAppBar.simple(LocaleKeys.languages.tr),
      body: Container(
        padding: EdgeInsets.only(top: 25.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BiaText(
              LocaleKeys.select_language.tr,
              fontSize: 23.sp,
              color: Colors.white,
            ),
            SizedBox(height: 20.h),
            Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6)),
              margin: EdgeInsets.zero,
              child: ListView.separated(
                padding: EdgeInsets.all(20),
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  final e = LocalizationService.langs[index];
                  return Obx(
                    () => CustomRadio<String>(
                      value: e.languageCode,
                      groupValue: controller.language.value.languageCode,
                      onChanged: controller.onChanged,
                      title: e.name,
                    ),
                  );
                },
                separatorBuilder: (context, index) => Divider(),
                itemCount: LocalizationService.langs.length,
              ),
            )
          ],
        ),
      ),
    );
  }
}
