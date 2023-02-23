import 'package:biapay_app/app/modules/signup/controllers/signup_controller.dart';
import 'package:biapay_app/app/widgets/biapay_ui_package.dart';
import 'package:biapay_app/app/widgets/common/bia_appbar.dart';
import 'package:biapay_app/app/widgets/common/bia_button.dart';
import 'package:biapay_app/app/widgets/common/bia_scaffold.dart';
import 'package:biapay_app/app/widgets/common/bia_text.dart';
import 'package:biapay_app/app/widgets/common/bia_textfield.dart';
import 'package:biapay_app/app/widgets/common/input_field_type/input_field_type.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BusinessRegistrationEmailPass extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = Get.find<SignupController>();
    return BiaScaffold(
        appBar: BiaAppBar(centerTitle: false,showAction: false,showIcon: true,),
        body: Form(
          key: controller.formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 32.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const BiaText(
                  "Let's create your business account!",
                  textType: TextType.headLine5,
                  color: Colors.white,
                ),
                const SizedBox(
                  height: 24.0,
                ),
                BiaTextField(
                  controller: controller.emailController,
                  hint: 'E-mail address',
                  inputType: const InputFieldType.email(),
                  padding: EdgeInsets.symmetric(horizontal: 0.w, vertical: 8.0),
                ),
                BiaTextField(
                  padding: EdgeInsets.symmetric(horizontal: 0.w, vertical: 8.0),
                  // inputType: controller.hidePassword
                  //     ? const InputFieldType.password()
                  //     : const InputFieldType.regular(),
                  controller: controller.passwordController,
                  // suffixIcon: Material(
                  //   child: InkWell(
                  //     onTap: () {
                  //       controller.swithPasswordView();
                  //     },
                  //     child: controller.hidePassword
                  //         ? const Icon(
                  //             CupertinoIcons.eye_slash,
                  //             color: Colors.grey,
                  //           )
                  //         : const Icon(
                  //             CupertinoIcons.eye_fill,
                  //             color: Colors.green,
                  //           ),
                  //   ),
                  // ),
                  hint: 'Password',
                  inputType: const InputFieldType.password(),
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
                        text: 'Next',
                        onPressed: () {
                          // if (_formKey.currentState!.validate()) {
                          //   Get.to(() => BusinessRegistrationMain());
                          // }
                        }),
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
