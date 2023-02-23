import 'package:biapay_app/app/modules/signup/controllers/signup_controller.dart';
import 'package:biapay_app/app/widgets/common/bia_appbar.dart';
import 'package:biapay_app/app/widgets/common/bia_button.dart';
import 'package:biapay_app/app/widgets/common/bia_scaffold.dart';
import 'package:biapay_app/app/widgets/common/bia_text.dart';
import 'package:biapay_app/app/widgets/common/bia_textfield.dart';
import 'package:biapay_app/app/widgets/common/input_field_type/input_field_type.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class PrivateRegistrationPhone extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    // final PhoneController phoneController = usePhoneController();
    final controller = Get.find<SignupController>();
    return BiaScaffold(
      appBar: BiaAppBar(centerTitle: false,showAction: false,showIcon: true,),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 24.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BiaText(
                "Let's create a private account!",
                textType: TextType.headLine5,
                color: Colors.white,
                padding: EdgeInsets.symmetric(vertical: 20.h),
              ),

              const BiaText(
                "Please fill in your mobile phone number!",
                // textType: TextType.headLine4,
                color: Colors.white,
              ),
              BiaTextField(
                controller: controller.phoneController,
                hint: 'Phone Number',
                padding: EdgeInsets.symmetric(horizontal: 0.w, vertical: 8.0),
                inputType: const InputFieldType.phone(),
              ),
              // BiaText(
              //   'Mobile Number',
              //   color: Colors.white,
              //   textType: TextType.headLine6,
              //   fontWeight: FontWeight.w300,
              //   padding: EdgeInsets.only(bottom: 5.h, top: 20.h),
              // ),

              // PhoneFormField(
              //   defaultCountry: 'CM',
              //   autofocus: true,
              //   // controller: phoneController,
              //   // controller: privateRegisterationController.phoneController,
              //   validator: PhoneValidator.required(),
              //   style: TextType.headLine5.toStyle(context: context)!.copyWith(
              //         color: Colors.blue[900],
              //         fontWeight: FontWeight.w300,
              //       ),
              //   decoration: InputDecoration(
              //     contentPadding:
              //         EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
              //     isDense: true,
              //     fillColor: Colors.white,
              //     filled: true,
              //     hintText: 'Phone',
              //     border: OutlineInputBorder(
              //       borderRadius: BorderRadius.circular(5),
              //     ),
              //     focusedBorder: const OutlineInputBorder(
              //       borderSide: BorderSide(color: Colors.transparent),
              //     ),
              //     enabledBorder: const OutlineInputBorder(
              //       borderSide: BorderSide(color: Colors.transparent),
              //     ),
              //   ),
              // ),
              BiaText(
                "By clicking on Next, you confirm that you’re entitled to use this mobile phone number. You also accept to receive automated text messages to confirm the phone number and to take on any related charges that may apply.",
                // textType: TextType.headLine4,
                maxLine: 10,
                color: Colors.white,
                padding: EdgeInsets.only(top: 20.h),
              ),
              // SizedBox(
              //   height: 550.h,
              // ),
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
                        //   registerationController.generateMFA();
                        //   // Get.to(() => PrivateRegistrationOtp(
                        //   //       phoneNumber:
                        //   //           phoneController.value!.international,
                        //   //     ));
                        // }
                      }),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
