import 'dart:io';

import 'package:biapay_app/app/configs/assets.dart';
import 'package:biapay_app/app/widgets/biapay_ui_package.dart';
import 'package:biapay_app/app/widgets/export_file.dart';
import 'package:biapay_app/generated/locales.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';

import '../../../configs/configs.dart';
import '../controllers/signin_controller.dart';

class SigninView extends GetView<SigninController> {
  @override
  Widget build(BuildContext context) {
    return BiaScaffold(
        appBar: BiaAppBar(
          centerTitle: false,
          showAction: false,
          showIcon: true,
        ),
        body: Container(
          decoration: const BoxDecoration(),
          child: ListView(
            shrinkWrap: true,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 00.w, vertical: 10.h),
                    child: BiaText(
                      LocaleKeys.login_title.tr,
                      align: TextAlign.center,
                      textType: TextType.headLine5,
                      color: Colors.white,
                      padding: EdgeInsets.symmetric(vertical: 40.h),
                    ),
                  ),
                  BiaTextField(
                    padding:
                        EdgeInsets.symmetric(horizontal: 0.w, vertical: 8.0),
                    hint: LocaleKeys.username_or_phone.tr,
                    // countryCode: country,
                    controller: controller.usernameController,
                  ),
                  BiaTextField(
                    padding:
                        EdgeInsets.symmetric(horizontal: 0.w, vertical: 8.0),
                    inputType: const InputFieldType.password(),
                    controller: controller.passwordController,
                    hint: LocaleKeys.your_pass.tr,
                    label: LocaleKeys.password.tr,
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  box.read(Config.keys.userType) != null &&
                          box.read(Config.keys.userType) == "MERCHANT"
                      ? showMerchantDropDownWidget()
                      : Container(),
                  box.read(Config.keys.userType) != null &&
                          box.read(Config.keys.userType) == "MERCHANT"
                      ? SizedBox(
                          height: 15.h,
                        )
                      : SizedBox(),
                  GetBuilder<SigninController>(
                    builder: (controller){
                      return  Row(
                        children: [
                          Expanded(
                            child: BiaCheckBox(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 0.w, vertical: 8.0),
                              initValue:userType=="USER"?controller.rememberMeCustomerValue.value:controller.rememberMeMerchantValue.value,
                              onChanged: controller.rememberMe,
                              title: LocaleKeys.remember.tr,
                            ),
                          ),
                          TextButton(
                              onPressed: () {
                                controller.moveToForgotPassword();
                              },
                              child: BiaText(
                                LocaleKeys.forgot.tr,
                                color: Colors.white,
                                textType: TextType.headLine6,
                              ))
                        ],
                      );
                    },
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  BiaButton(
                      margin:
                          EdgeInsets.symmetric(horizontal: 0.w, vertical: 8.0),
                      text: LocaleKeys.login.tr,
                      textColor: Colors.white,
                      color: Theme.of(context).colorScheme.secondary,
                      onPressed: controller.validateTextField),
                ],
              ),
              Obx(() => Visibility(
                    visible: controller.enabledBiometric.value,
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 0.w, vertical: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          GestureDetector(
                            onTap: controller.fingerAuth,
                            child: Column(
                              children: [
                                SvgPicture.asset(
                                  Assets.finger,
                                  height: 120.h,
                                ),
                                SizedBox(
                                  height: 3,
                                ),
                                BiaText(
                                  LocaleKeys.biometric_option.tr,
                                  color: Colors.white,
                                  fontSize: 13,
                                )
                              ],
                            ),
                          ),
                          if (Platform.isIOS)
                            Column(
                              children: [
                                SvgPicture.asset(
                                  Assets.face,
                                  height: 120.h,
                                ),
                                SizedBox(
                                  height: 3,
                                ),
                                BiaText(
                                  LocaleKeys.face_id.tr,
                                  color: Colors.white,
                                  fontSize: 13,
                                )
                              ],
                            ),
                        ],
                      ),
                    ),
                  ))
            ],
          ),
        ));
  }

  //show dropdown if user is merchant type
  showMerchantDropDownWidget() {
    return BiaDropdown<String>(
        options: controller.userTypeList,
        showBorder: true,
        margin: EdgeInsets.zero,
        outerLabel: false,
        controller: controller.userTypeController,
        hint: LocaleKeys.select_account_type.tr,
        displayName: (v) => v,
        onSelected: (v) {});
  }
}
