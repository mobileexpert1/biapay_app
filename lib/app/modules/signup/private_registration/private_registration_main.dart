import 'package:biapay_app/app/configs/assets.dart';
import 'package:biapay_app/app/modules/signup/controllers/signup_controller.dart';
import 'package:biapay_app/app/widgets/biapay_ui_package.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../models/security_question.dart';
import '../../../widgets/common/bia_model_dropdown.dart';
import '../../../widgets/common/custom_generate_dialog.dart';
import '../../../widgets/common/custom_select_view.dart';
import '../../../widgets/export_file.dart';
import '../controllers/private_registration_controller.dart';

class PrivateRegistrationMain extends StatelessWidget {
  final controller = Get.find<PrivateRegistrationController>();

  @override
  Widget build(BuildContext context) {
    return BiaScaffold(
        appBar: BiaAppBar(
          centerTitle: false,
          showAction: false,
          showIcon: true,
          onBackPressed: () {
            // Get.back();
            Get.offAllNamed(Routes.LANDING);
          },
        ),
        body: Form(
            key: controller.formKey,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 24.h),
              child: ListView(
                children: [
                  BiaText(
                    LocaleKeys.lets_create_account.tr,
                    textType: TextType.headLine5,
                    color: Colors.white,
                    padding: EdgeInsets.symmetric(vertical: 20.h),
                  ),
                  /*  BiaDropdown<String>(
                    options:  [LocaleKeys.male.tr, LocaleKeys.female.tr],
                    controller: controller.genderController,
                    hint: LocaleKeys.gender.tr,
                    displayName: (data) => data,
                    onSelected: (value) {},
                    margin:
                    EdgeInsets.symmetric(horizontal: 0.w, vertical: 8.0),
                  ),*/
                  BiaTextField(
                    controller: controller.firstNameTextController,
                    hint: LocaleKeys.first_name.tr,
                    padding:
                        EdgeInsets.symmetric(horizontal: 0.w, vertical: 8.0),
                  ),
                  BiaTextField(
                    controller: controller.lastNameTextController,
                    hint: LocaleKeys.last_name.tr,
                    padding:
                        EdgeInsets.symmetric(horizontal: 0.w, vertical: 8.0),
                  ),
                  BiaTextField(
                    controller: controller.emailTextController,
                    hint: LocaleKeys.email.tr,
                    padding:
                        EdgeInsets.symmetric(horizontal: 0.w, vertical: 8.0),
                    inputType: const InputFieldType.email(),
                  ),

                  BiaTextField(
                    controller: controller.phoneNumberTextController,
                    hint: LocaleKeys.phn_number.tr,
                    padding:
                        EdgeInsets.symmetric(horizontal: 0.w, vertical: 8.0),
                    enabled: false,
                    //inputType: const InputFieldType.phone(),
                  ),
                  /*  BiaTextField(
                      controller: controller.phoneNumberTextController,
                      hint: LocaleKeys.phn_number.tr,

                      padding:
                      EdgeInsets.symmetric(horizontal: 0.w, vertical: 8.0),
                      inputType: const InputFieldType.phone())*/
                  // Padding(
                  //   padding:
                  //       EdgeInsets.symmetric(horizontal: 0.w, vertical: 8.0),
                  //   child: Column(
                  //     crossAxisAlignment: CrossAxisAlignment.start,
                  //     children: [
                  //       BiaText(
                  //         'Mobile Number',
                  //         color: Colors.white,
                  //         textType: TextType.headLine6,
                  //         fontWeight: FontWeight.w300,
                  //         padding: EdgeInsets.only(bottom: 5.h),
                  //       ),
                  //       PhoneFormField(
                  //         // controller: phoneController,
                  //         enabled: false,
                  //         validator: PhoneValidator.required(),
                  //         style: TextType.headLine5
                  //             .toStyle(context: context)!
                  //             .copyWith(
                  //               color: Colors.blue[900],
                  //               fontWeight: FontWeight.w300,
                  //             ),
                  //         decoration: InputDecoration(
                  //           isDense: true,
                  //           fillColor: Colors.white,
                  //           filled: true,
                  //           hintText: 'Phone',
                  //           border: OutlineInputBorder(
                  //             borderRadius: BorderRadius.circular(5),
                  //           ),
                  //           focusedBorder: const OutlineInputBorder(
                  //             borderSide: BorderSide(color: Colors.transparent),
                  //           ),
                  //           enabledBorder: const OutlineInputBorder(
                  //             borderSide: BorderSide(color: Colors.transparent),
                  //           ),
                  //           contentPadding: EdgeInsets.symmetric(
                  //               horizontal: 16.w, vertical: 16.h),
                  //         ),
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  BiaSwitch(
                    title: LocaleKeys.two_factor.tr,
                    initValue: controller.twoFactorAuthEnabled.value,
                    onChanged: (value) {
                      controller.twoFactorAuthEnabled.value = value;
                    },
                    padding:
                        EdgeInsets.symmetric(horizontal: 0.w, vertical: 8.0),
                  ),
                  BiaTextField(
                    controller: controller.passwordController,
                    hint: LocaleKeys.password.tr,
                    inputType: const InputFieldType.password(),
                    padding:
                        EdgeInsets.symmetric(horizontal: 0.w, vertical: 8.0),
                  ),
                  BiaTextField(
                    controller: controller.confirmPasswordController,
                    hint: LocaleKeys.confirm_password.tr,
                    inputType: const InputFieldType.password(),
                    padding:
                        EdgeInsets.symmetric(horizontal: 0.w, vertical: 8.0),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10.0),
                    child: BiaText(
                      LocaleKeys.security_question.tr,
                      textType: TextType.headLine5,
                      color: Colors.white,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 20.h),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(
                          Assets.analytics,
                          width: 20.w,
                        ),
                        Flexible(
                          // height: 40.h,
                          child: BiaText(
                            LocaleKeys.security_question_help.tr,
                            // textType: TextType.headLine4,
                            maxLine: 10,
                            color: Colors.white,
                            padding: EdgeInsets.only(left: 20.w),
                          ),
                        ),
                      ],
                    ),
                  ),

                  headingTextWidget(title: LocaleKeys.select_shop.tr),
                  SizedBox(
                    height: 10.h,
                  ),

                  GetBuilder<PrivateRegistrationController>(
                      builder: (controller) {
                    return securitySelectionOneDropWidget(controller);
                  }),
                  BiaTextField(
                    controller:
                        controller.securityQuestionAnswer1TextController,
                    hint: LocaleKeys.security_question_answer_one.tr,
                    padding:
                        EdgeInsets.symmetric(horizontal: 0.w, vertical: 8.0),
                  ),


                  headingTextWidget(title: LocaleKeys.security_question_two.tr),
                  SizedBox(
                    height: 10.h,
                  ),


                  GetBuilder<PrivateRegistrationController>(
                      builder: (controller) {
                    return securitySelectionSecDropWidget(controller);
                  }),

                  BiaTextField(
                    controller:
                        controller.securityQuestionAnswer2TextController,
                    hint: LocaleKeys.security_question_answer_two.tr,
                    padding:
                        EdgeInsets.symmetric(horizontal: 0.w, vertical: 8.0),
                  ),
                  BiaCheckBox(
                    initValue: controller.termsAndConditions.value,
                    onChanged: (value) {
                      controller.termsAndConditions.value = value;
                      controller.update();
                      print(
                          "check value ${controller.termsAndConditions.value}");
                    },
                    title: LocaleKeys.agree_terms_conditions.tr,
                    padding:
                        EdgeInsets.symmetric(horizontal: 0.w, vertical: 8.0),
                  ),

                  SizedBox(
                    height: 40.h,
                  ),
                  BiaButton.greenButtonInRow(
                      text: LocaleKeys.save.tr,
                      onPressed: () {
                        controller.validateAllFields();
                      }),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      BiaText(
                        LocaleKeys.already_added.tr,
                        textType: TextType.headLine6,
                        color: Colors.white,
                      ),
                      TextButton(
                          onPressed: () {
                            // controller.hitApiToregisterUser();

                            // Get
                            //   ..back()
                            //   ..to(() =>   LoginOptionScreen());
                          },
                          child: BiaText(
                            LocaleKeys.login.tr,
                            textType: TextType.headLine6,
                            color: Theme.of(context).colorScheme.secondary,
                            fontWeight: FontWeight.bold,
                          ))
                    ],
                  ),
                ],
              ),
            )));
  }

  headingTextWidget({title}) {
    return BiaText(
      title ?? "",
      color: Colors.white,
      align: TextAlign.start,
      fontSize: 20.sp,
      fontWeight: FontWeight.w300,
      textType: TextType.headLine6,
      padding: EdgeInsets.zero,
    );
  }

  securitySelectionOneDropWidget(PrivateRegistrationController controller) {
    return CustomSelectView(
      padding: EdgeInsets.all(20.r),
      onTab: () {
        securityQuestionFirstDropDown(controller);
      },
      label: controller.selectFirstQuestion.tr,
    );
  }

  securityQuestionFirstDropDown(PrivateRegistrationController controller) {
    return showGenerateDialog(
        context: Get.overlayContext!,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListView.builder(
                shrinkWrap: true,
                itemCount: controller.mSecurityFirstList.value.length,
                itemBuilder: (context, index) {
                  return controller.mSecurityFirstList.value[index].question
                              ?.isNotEmpty ==
                          true
                      ? InkWell(
                          onTap: () {
                            controller.selectFirstQuestion = controller
                                    .mSecurityFirstList.value[index].question ??
                                "";
                            controller.firstQuesId =  controller.mSecurityFirstList.value[index].id;

                          //  controller.updateSecDropDownList(selectedId: controller.firstQuesId);
                            controller.update();
                            Get.back();
                          },
                          child: Padding(
                            padding: EdgeInsets.only(
                                top: 10.h, left: 20.h, bottom: 10.h),
                            child: BiaText(
                                controller.mSecurityFirstList?.value[index]
                                        .question ??
                                    "",
                                color: Colors.black,
                                fontSize: 20.sp,
                                fontWeight: FontWeight.w500),
                          ),
                        )
                      : Container();
                })
            //your content
          ],
        ));
  }




  securitySelectionSecDropWidget(PrivateRegistrationController controller) {
    return CustomSelectView(
      padding: EdgeInsets.all(20.r),
      onTab: () {
        securityQuestionSecondDropDown(controller);
      },
      label: controller.selectSecQuestion.tr,
    );
  }

  securityQuestionSecondDropDown(PrivateRegistrationController controller) {
    return showGenerateDialog(
        context: Get.overlayContext!,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListView.builder(
                shrinkWrap: true,
                itemCount: controller.mSecuritySecList.value.length,
                itemBuilder: (context, index) {
                  return controller.mSecuritySecList.value[index].question
                      ?.isNotEmpty ==
                      true
                      ? InkWell(
                    onTap: () {
                      controller.selectSecQuestion = controller.mSecuritySecList.value[index].question ??
                          "";
                      controller.secQuestionId =  controller.mSecuritySecList.value[index].id;
                      controller.update();
                      Get.back();
                    },
                    child: Padding(
                      padding: EdgeInsets.only(
                          top: 10.h, left: 20.h, bottom: 10.h),
                      child: BiaText(
                          controller.mSecurityFirstList?.value[index]
                              .question ??
                              "",
                          color: Colors.black,
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w500),
                    ),
                  )
                      : Container();
                })
            //your content
          ],
        ));
  }


}
