import 'package:biapay_app/app/configs/assets.dart';
import 'package:biapay_app/app/configs/configs.dart';
import 'package:biapay_app/app/configs/get_extension.dart';
import 'package:biapay_app/app/modules/my_wallet/add%20cards/add_money_view.dart';
import 'package:biapay_app/app/widgets/biapay_ui_package.dart';
import 'package:biapay_app/app/widgets/custom_tab_component.dart';
import 'package:biapay_app/generated/locales.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';

import '../controllers/my_wallet_controller.dart';

class MyWalletView extends GetView<MyWalletController> {
  @override
  Widget build(BuildContext context) {
    return BiaScaffold(
      appBar: BiaAppBar.simple(
        LocaleKeys.my_wallet.tr,
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            padding: EdgeInsets.only(top: 20.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      height: 45,
                      width: 45,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Config.colors.blueColor2,
                      ),
                      alignment: Alignment.center,
                      child: SvgPicture.asset(
                        Assets.p5,
                        color: Colors.white,
                        width: 25,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    BiaText(
                      LocaleKeys.my_wall.tr,
                      color: Colors.white,
                    ),
                  ],
                ),
                SizedBox(
                  height: 20.h,
                ),
                Text.rich(TextSpan(children: [
                  TextSpan(
                    text: Get.formatNumber(4500000),
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30.sp,
                      color: Colors.white,
                    ),
                  ),
                  TextSpan(
                    text: "  XAF",
                    style: TextStyle(
                      fontSize: 18.sp,
                      color: Colors.white,
                    ),
                  ),
                ])),
                BiaText(
                  LocaleKeys.current_balance.tr,
                  color: Colors.white,
                ),
                SizedBox(
                  height: 20.h,
                ),
                Obx(
                  () => CustomTabBar(
                    titles: [
                      LocaleKeys.refill.tr,
                      LocaleKeys.withdrawal.tr,
                    ],
                    onChanged: controller.onChanged,
                    currentIndex: controller.page.value,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: BiaTextField(
                        padding: EdgeInsets.zero,
                        hint: LocaleKeys.enter_amount.tr,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      flex: 2,
                      child: BiaDropdown(
                        margin: EdgeInsets.zero,
                        options: ["FCFA", "USD"],
                        controller: controller.currency,
                        hint: LocaleKeys.currency.tr,
                        displayName: (e) => e,
                        onSelected: controller.onSelected,
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
          Positioned(
            bottom: 50,
            right: 0,
            left: 0,
            child: BiaButton.greenButtonInRow(
              text: LocaleKeys.save.tr,
              onPressed: () {
                Get.to(() => AddMoneyView());
              },
              width: Get.width,
            ),
          )
        ],
      ),
    );
  }
}
