import 'package:biapay_app/app/widgets/biapay_ui_package.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

import '../../../../generated/locales.g.dart';
import '../../../routes/app_pages.dart';
import '../controllers/signup_controller.dart';

class SignupView extends GetView<SignupController> {
  @override
  Widget build(BuildContext context) {
    return BiaScaffold(
      appBar: BiaAppBar(
        centerTitle: false,
        showAction: false,
        showIcon: true,
      ),
      body: Form(
        key: controller.formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 50.h,
            ),
            fillMobileTetWidget(),
            SizedBox(
              height: 15.h,
            ),
            phnTextWidget(),
            SizedBox(
              height: 20.h,
            ),
            clickNextTextWidget(),
            SizedBox(
              height: 30.h,
            ),
            nextButton()
          ],
        ),
      ),
    );
  }

  fillMobileTetWidget() {
    return BiaText(
      LocaleKeys.fill_mobile_number.tr,
      align: TextAlign.center,
      fontSize: 25.sp,
      fontWeight: FontWeight.w500,
      textType: TextType.body2,
      color: Colors.white,
    );
  }

  phnTextWidget() {
    return IntlPhoneField(
      autofocus: false,
      controller: controller.phoneController,
      decoration: InputDecoration(
        fillColor: Colors.white,
        floatingLabelBehavior: FloatingLabelBehavior.never,
        filled: true,
        counterText: "",
        labelText: 'Phone Number',
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
        ),
      ),
      initialCountryCode: 'IN',
      style: TextStyle(fontSize: 24.sp),
      onChanged: (phone) {
        if (phone.completeNumber.isNotEmpty) {
          controller.completPhnNumber.value=phone.completeNumber.replaceAll("+","");
         // controller.phoneController.text = phone.completeNumber;
          controller.update();
        }

        print("check complete phn number ${controller.phoneController.text}");
        print(phone.completeNumber);
      },
    );
  }

  clickNextTextWidget() {
    return BiaText(
      LocaleKeys.by_click_next.tr,
      align: TextAlign.start,
      fontSize: 20.sp,
      maxLine: 10,
      fontWeight: FontWeight.normal,
      color: Colors.white,
    );
  }

  nextButton() {
    return BiaButton(
      margin: EdgeInsets.symmetric(horizontal: 0.w, vertical: 20.0),
      text: LocaleKeys.next.tr,
      textColor: Colors.white,
      color: Theme.of(Get.context!).colorScheme.secondary,
      onPressed: () {



        if (controller.formKey.currentState?.validate() == true) {

          controller.hitApiToRegisterUser();
        }
        //    controller.moveToOtpScreen();
      },
    );
  }
}
