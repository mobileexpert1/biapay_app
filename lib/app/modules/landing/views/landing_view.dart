import 'package:biapay_app/app/configs/assets.dart';
import 'package:biapay_app/app/widgets/biapay_ui_package.dart';
import 'package:biapay_app/app/widgets/export_file.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/landing_controller.dart';

class LandingView extends GetView<LandingController> {
  @override
  Widget build(BuildContext context) {
    return BiaScaffold(
        hasSidePadding: false,
        appBar:  BiaAppBar(centerTitle: false,showAction: false,showIcon: false),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
               LandingPageAsset(
                  biapayLogo: Assets.logo,
                  imageFile: Assets.register,
                  text: LocaleKeys.welcome_to.tr),
              Column(
                children: [
                  BiaButton(
                    text: LocaleKeys.login.tr,
                    onPressed: controller.login,
                    // isTransparent: true,
                  ),
                  BiaButton(
                    text: LocaleKeys.register.tr,
                    onPressed: controller.register,
                    color: Theme.of(context).colorScheme.secondary,
                    // isTransparent: true,
                  ),
                  BiaText(
                    LocaleKeys.product_of_saas.tr,
                    color: Colors.white,
                    padding: EdgeInsets.symmetric(vertical: 20.h),
                  )
                ],
              )
            ],
          ),
        ));
  }
}
