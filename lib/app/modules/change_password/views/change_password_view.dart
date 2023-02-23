import 'package:flutter/material.dart';

import '../../../widgets/export_file.dart';
import '../controllers/change_password_controller.dart';

class ChangePassword extends StatelessWidget {
  var controller = Get.put(ChangePasswordController());

  @override
  Widget build(BuildContext context) {
    return BiaScaffold(
        appBar: BiaAppBar.simple(LocaleKeys.change_password.tr),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Get.arguments==null? BiaTextField(
                controller: controller.oldPass,
                hint: LocaleKeys.old_password.tr,
              ):SizedBox(),
              BiaTextField(
                controller: controller.newPass,
                hint: LocaleKeys.new_password.tr,
              ),
              BiaTextField(
                controller: controller.confirmPass,
                hint: LocaleKeys.confirm_password.tr,
              ),
              SizedBox(
                height: 25.h,
              ),
              BiaButton.greenButtonInRow(
                  width: Get.width,
                  margin:
                      EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.h),
                  text: LocaleKeys.save_submit.tr,
                  onPressed: () {
                    if (Get.arguments != null) {
                      controller.validateTextFieled();
                    }
                  })
            ],
          ),
        ));
  }
}
