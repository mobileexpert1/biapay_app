import 'package:biapay_app/app/configs/assets.dart';
import 'package:biapay_app/app/configs/enums.dart';
import 'package:biapay_app/app/modules/landing/controllers/landing_controller.dart';
import 'package:biapay_app/app/widgets/biapay_ui_package.dart';
import 'package:biapay_app/generated/locales.g.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChooseAccountType extends GetView<LandingController> {
  const ChooseAccountType({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BiaScaffold(
      appBar: BiaAppBar(
        centerTitle: false,showAction: false,

      ),
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        padEnds: false,
        controller: controller.controller,
        scrollDirection: Axis.vertical,
        children: [
          ChooseView(),
          ChooseView(),
        ],
      ),
    );
  }
}

class ChooseView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = Get.find<LandingController>();
    return ListView(
      children: [
        BiaText(
          LocaleKeys.choose_type_title.tr,
          textType: TextType.headLine5,
          color: Colors.white,
          align: TextAlign.center,
          padding: EdgeInsets.symmetric(vertical: 15.h),
        ),
        AuthOptionCard(
          title: LocaleKeys.private_account.tr,
          description:
              LocaleKeys.private_account_detail.tr,
          image: Assets.private,
          onTap: () => controller.goToSignin("USER"),
        ),
        SizedBox(
          height: 15.h,
        ),
        AuthOptionCard(
          title: LocaleKeys.business_account.tr,
          description:LocaleKeys.business_account_detail.tr,
          image: Assets.business,
          onTap: () => controller.goToSignin("MERCHANT"),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             BiaText(
              LocaleKeys.donot_have_account.tr,
              textType: TextType.headLine6,
              color: Colors.white,
            ),
            TextButton(
                onPressed: controller.toggleAuthType,
                child: Obx(() => BiaText(
                      controller.authType.value == AuthType.login
                          ? LocaleKeys.register.tr
                          : LocaleKeys.login.tr,
                      textType: TextType.headLine6,
                      color: Theme.of(context).colorScheme.secondary,
                      fontWeight: FontWeight.bold,
                    )))
          ],
        )
      ],
    );
  }
}
