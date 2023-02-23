import 'package:biapay_app/app/modules/signup/controllers/signup_controller.dart';
import 'package:biapay_app/app/widgets/common/bia_appbar.dart';
import 'package:biapay_app/app/widgets/common/bia_button.dart';
import 'package:biapay_app/app/widgets/common/bia_scaffold.dart';
import 'package:biapay_app/app/widgets/common/bia_text.dart';
import 'package:biapay_app/app/widgets/common/bia_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class PrivateRegistrationOtp extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final controller = Get.find<SignupController>();
    return BiaScaffold(
      appBar:  BiaAppBar(),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 24.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BiaText(
                "Verification Code",
                textType: TextType.headLine5,
                color: Colors.white,
                padding: EdgeInsets.symmetric(vertical: 20.h),
              ),
              BiaText(
                "Please enter the verification code you received on ${controller.emailController.text}",
                // textType: TextType.headLine4,
                color: Colors.white,
              ),
              BiaTextField.otp(controller: controller.otpTextController),
              Center(
                child: BiaText(
                  '00:00',
                  padding: EdgeInsets.symmetric(vertical: 20.h),
                  color: Colors.white,
                ),
              ),
              const Center(
                child: BiaText(
                  'Resend Code',
                  color: Colors.white,
                  textType: TextType.headLine6,
                ),
              ),
              Expanded(child: Container()),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  BiaButton.greenButtonInRow(
                      text: 'Back',
                      onPressed: () {
                        Get.back();
                      }),
                  BiaButton.greenButtonInRow(
                    text: 'Verify',
                    onPressed: controller.validateOtp,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
