import 'package:biapay_app/app/widgets/biapay_ui_package.dart';
import 'package:biapay_app/app/widgets/export_file.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:pinput/pin_put/pin_put.dart';

import '../../../routes/app_pages.dart';
import '../controllers/pin_code_controller.dart';

class PinCodeView extends GetView<PinCodeController> {
  @override
  Widget build(BuildContext context) {
    return BiaScaffold(
        appBar:  BiaAppBar( centerTitle: false,
          showAction: false,
          showIcon: true,
          onBackPressed: (){
            Get.offAllNamed(Routes.LANDING);
          },


        ),
        body: Column(
          children: [
            SizedBox(
              height: 50.h,
            ),
            verificationTxtWidget(),
            SizedBox(
              height: 30.h,
            ),
            pinPutTextFieldWidget(),
            SizedBox(
              height: 30.h,
            ),
            resendOtpTextWidget(),
            SizedBox(
              height: 30.h,
            ),
            verifyButton(),
          ],
        ));
  }


  verificationTxtWidget() {
    return BiaText(
      LocaleKeys.received_code.tr,
      align: TextAlign.start,
      fontSize: 25.sp,
      fontWeight: FontWeight.w500,
      textType: TextType.body2,
      color: Colors.white,
    );
  }



  pinPutTextFieldWidget(){
    return Form(
      key: controller.formKey,
      child: PinPut(
        fieldsCount: 6,
        onSubmit: (String pin) {
          Logger().i(pin);
        },
        eachFieldHeight: 80.w,
        eachFieldWidth: 65.w,
        textStyle: TextStyle(
            color: Theme.of(Get.context!).colorScheme.secondary,
            fontSize: ScreenUtil().setSp(30)),
        controller: controller.otpController,
        submittedFieldDecoration: controller.pinPutDecoration.copyWith(
          borderRadius: BorderRadius.circular(20.0),
        ),
        selectedFieldDecoration: controller.pinPutDecoration,
        followingFieldDecoration: controller.pinPutDecoration.copyWith(
          borderRadius: BorderRadius.circular(5.0),
        ),
      ),
    );
  }




  resendOtpTextWidget() {
    return Align(
      alignment: Alignment.topLeft,
      child: InkWell(
        onTap: (){
          hidekeyboard();
          controller.otpController.text="";

          controller.hitApiToResendOtp();
        },
        child: BiaText(
          LocaleKeys.resend_otp.tr,
          align: TextAlign.center,
          fontSize: 25.sp,
          fontWeight: FontWeight.normal,
          color: Colors.white,
        ),
      ),
    );
  }


  verifyButton() {
    return BiaButton(
      margin: EdgeInsets.symmetric(horizontal: 0.w, vertical: 20.0),
      text: LocaleKeys.verify.tr,
      textColor: Colors.white,
      color: Theme.of(Get.context!).colorScheme.secondary,
      onPressed: () {
       /* Get.offAllNamed(Routes.PRIVATE_SIGNUP,arguments:Get.arguments );
        return;*/

           if(controller.otpController.text.isNotEmpty&&controller.otpController.text.toString().length==6){
             hidekeyboard();
             controller.hitApiTovalidateOtp();
           }
           print("value of controller is ${controller.otpController.text}");


       // Get.offAndToNamed(Routes.BASE_APP);
      },
    );
  }
}
