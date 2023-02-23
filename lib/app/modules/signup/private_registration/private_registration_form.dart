import 'package:biapay_app/app/modules/signup/controllers/signup_controller.dart';
import 'package:biapay_app/app/widgets/common/bia_appbar.dart';
import 'package:biapay_app/app/widgets/common/bia_button.dart';
import 'package:biapay_app/app/widgets/common/bia_text.dart';
import 'package:biapay_app/app/widgets/common/bia_textfield.dart';
import 'package:biapay_app/app/widgets/common/input_field_type/input_field_type.dart';
import 'package:biapay_app/generated/locales.g.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class PrivateRegistrationForm extends StatelessWidget {
  final String phone;
  final String password;
  final String confirmPassword;
  final String? countryCode;
  PrivateRegistrationForm(
      {required this.confirmPassword,
      required this.countryCode,
      required this.phone,
      required this.password,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<SignupController>();
    return Scaffold(
      appBar:  BiaAppBar(),
      body: Form(
        key: controller.formKey,
        child: ListView(
          shrinkWrap: true,
          children: [
            SizedBox(
              height: 100.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CountryCodePicker(
                  barrierColor: Colors.black12,
                  padding: EdgeInsets.only(left: 20.w),
                  showFlag: false,
                  enabled: false,
                  onChanged: (code) {
                    // Logger().i(code.code);
                  },
                  onInit: (code) {},
                  initialSelection: countryCode,
                  textStyle: TextStyle(
                      color: Theme.of(context).colorScheme.secondary,
                      fontSize: ScreenUtil().setSp(25)),
                ),
                Expanded(
                  child: BiaTextField(
                      inputType: const InputFieldType.phone(),
                      // controller: _phone,
                      enabled: false,
                      hint: 'phn_hint'.tr,
                      label: "phn".tr),
                ),
              ],
            ),
            BiaTextField(
                inputType: const InputFieldType.email(),
                // controller: _email,
                hint: 'email_your'.tr,
                textColor: Colors.grey,
                fillColor: Colors.white10,
                label: "email_reg".tr),
            BiaTextField(
                inputType: const InputFieldType.password(),
                // controller: _password,
                enabled: false,
                textColor: Colors.grey,
                hint: "err_password".tr,
                fillColor: Colors.white10,
                label: 'password'.tr),
            BiaTextField(
                inputType: const InputFieldType.password(),
                // controller: _confirmPassword,
                enabled: false,
                hint: "err_cnfirm".tr,
                label: 'confirm'.tr),
            SizedBox(
              height: 50.h,
            ),
            BiaText(
              'tnc'.tr,
              color: Colors.white,
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
            ),
            BiaButton(
                text: LocaleKeys.register.tr,
                color: Theme.of(context).colorScheme.secondary,
                onPressed: () {})
          ],
        ),
      ),
    );
  }
}
