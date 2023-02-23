import 'package:biapay_app/app/modules/signup/controllers/signup_controller.dart';
import 'package:biapay_app/app/widgets/biapay_ui_package.dart';
import 'package:biapay_app/app/widgets/common/bia_appbar.dart';
import 'package:biapay_app/app/widgets/common/bia_button.dart';
import 'package:biapay_app/app/widgets/common/bia_check_box.dart';
import 'package:biapay_app/app/widgets/common/bia_dropdown.dart';
import 'package:biapay_app/app/widgets/common/bia_scaffold.dart';
import 'package:biapay_app/app/widgets/common/bia_switch.dart';
import 'package:biapay_app/app/widgets/common/bia_text.dart';
import 'package:biapay_app/app/widgets/common/bia_textfield.dart';
import 'package:biapay_app/app/widgets/common/input_field_type/input_field_type.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BusinessRegistrationMain extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = Get.find<SignupController>();

    return BiaScaffold(
        appBar:  BiaAppBar(),
        body: Form(
            key: controller.formKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: ListView(
              children: [
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
                  child: BiaText(
                    "Let's create your business account!",
                    textType: TextType.headLine5,
                    color: Colors.white,
                    padding: EdgeInsets.symmetric(vertical: 20.h),
                  ),
                ),
                BiaDropdown<String>(
                    controller: controller.genderController,
                    margin:
                        EdgeInsets.symmetric(horizontal: 0.w, vertical: 8.0),
                    options: const ['Male', 'Female'],
                    hint: 'Gender',
                    displayName: (data) => data,
                    onSelected: (value) {}),
                BiaTextField(
                  padding: EdgeInsets.symmetric(horizontal: 0.w, vertical: 8.0),
                  // controller: registerationController.firstNameTextController,
                  hint: 'First name',
                  inputType: const InputFieldType.phone(),
                ),
                BiaTextField(
                  padding: EdgeInsets.symmetric(horizontal: 0.w, vertical: 8.0),
                  // controller: registerationController.lastNameTextController,
                  hint: 'Last name',
                ),
                BiaTextField(
                  padding: EdgeInsets.symmetric(horizontal: 0.w, vertical: 8.0),
                  // controller: registerationController.emailTextController,
                  hint: 'E-mail',
                  enabled: false,
                  inputType: const InputFieldType.email(),
                ),
                BiaTextField(
                  padding: EdgeInsets.symmetric(horizontal: 0.w, vertical: 8.0),
                  // controller: registerationController.phoneNumberTextController,
                  hint: 'Phone Number',
                  inputType: const InputFieldType.phone(),
                ),
                BiaSwitch(
                  title: 'Two-factor authenticator:',
                  initValue: false,
                  onChanged: (value) {},
                  padding: EdgeInsets.symmetric(horizontal: 0.w, vertical: 0.h),
                ),
                BiaTextField(
                  padding: EdgeInsets.symmetric(horizontal: 0.w, vertical: 8.0),
                  // controller: registerationController.passwordTextController,
                  hint: 'Password',
                  enabled: false,
                  inputType: const InputFieldType.password(),
                ),
                BiaTextField(
                  padding: EdgeInsets.symmetric(horizontal: 0.w, vertical: 8.0),
                  // controller:
                  //     registerationController.confirmPasswordTextController,
                  hint: 'Confirm Password',
                  inputType: const InputFieldType.password(),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 10.0),
                  child: BiaText(
                    "Security questions",
                    textType: TextType.headLine5,
                    color: Colors.white,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 20.h),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Image.asset(
                      //   Assets.icQuestion,
                      //   width: 20.w,
                      // ),
                      Flexible(
                        // height: 40.h,
                        child: BiaText(
                          "Security questions will help to recover your account when you forgot your password", // textType: TextType.headLine4,
                          maxLine: 10,
                          color: Colors.white,
                          padding: EdgeInsets.only(left: 20.w),
                        ),
                      ),
                    ],
                  ),
                ),
                BiaDropdown<String>(
                  options: controller.securityQuestions,
                  controller: controller.securityQuestion1TextController,
                  hint: 'Security Question 1',
                  displayName: (data) {
                    // return (data as SecurityQuestionResponse).question;
                  },
                  onSelected: (value) {
                    // controller.selectedSecurityQuestion1.value =
                    //     value as SecurityQuestionResponse;
                  },
                  margin: EdgeInsets.symmetric(horizontal: 0.w, vertical: 8.0),
                ),
                BiaTextField(
                  // controller: controller
                  //     .securityQuestion1AnswerTextController,
                  hint: "Security Question 1 Answer",
                  padding: EdgeInsets.symmetric(horizontal: 0.w, vertical: 8.0),
                ),
                BiaDropdown<String>(
                  options: controller.securityQuestions,
                  controller: controller.securityQuestion2TextController,
                  hint: 'Security Question 2',
                  displayName: (data) {
                    // return (data as SecurityQuestionResponse).question;
                  },
                  onSelected: (value) {
                    // registerationController.selectedSecurityQuestion2.value =
                    //     value as SecurityQuestionResponse;
                  },
                  margin: EdgeInsets.symmetric(horizontal: 0.w, vertical: 8.0),
                ),
                BiaTextField(
                  // controller: registerationController
                  //     .securityQuestion2AnswerTextController,
                  hint: "Security Question 2 Answer",
                  padding: EdgeInsets.symmetric(horizontal: 0.w, vertical: 8.0),
                ),
                BiaCheckBox(
                    padding:
                        EdgeInsets.symmetric(horizontal: 0.w, vertical: 8.0),
                    initValue: false,
                    onChanged: (value) {},
                    title: 'I agree to the terms and conditions'),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    BiaButton.greenButtonInRow(
                        text: 'Back',
                        onPressed: () {
                          Get.back();
                        }),
                    BiaButton.greenButtonInRow(text: 'Next', onPressed: () {}),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const BiaText(
                      "Already have an account?",
                      textType: TextType.headLine6,
                      color: Colors.white,
                    ),
                    TextButton(
                        onPressed: () {
                          // Get
                          //   ..back()
                          //   ..toNamed();
                        },
                        child: BiaText(
                          'Login',
                          textType: TextType.headLine6,
                          color: Theme.of(context).colorScheme.secondary,
                          fontWeight: FontWeight.bold,
                        ))
                  ],
                )
              ],
            )));
  }
}
