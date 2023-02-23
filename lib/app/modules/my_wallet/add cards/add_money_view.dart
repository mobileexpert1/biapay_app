import 'package:biapay_app/app/modules/my_wallet/add%20cards/page1_view.dart';
import 'package:biapay_app/app/modules/my_wallet/add%20cards/page3_view.dart';
import 'package:biapay_app/app/modules/my_wallet/add%20cards/page2_view.dart';
import 'package:biapay_app/app/modules/my_wallet/controllers/my_wallet_controller.dart';
import 'package:biapay_app/app/widgets/biapay_ui_package.dart';
import 'package:biapay_app/app/widgets/custom_tab_component.dart';
import 'package:biapay_app/generated/locales.g.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddMoneyView extends StatelessWidget {
  const AddMoneyView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<MyWalletController>();
    return BiaScaffold(
      appBar: BiaAppBar.simple(LocaleKeys.add_money_to_wallet.tr),
      hasSidePadding: false,
      body: Column(
        children: [
          SizedBox(
            height: 20.h,
          ),
          Obx(
            () => CustomTabBar(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              titles: [
                LocaleKeys.credit_debit.tr,
                LocaleKeys.my_card.tr,
                LocaleKeys.back_to_top.tr,
              ],
              onChanged: controller.onChangedAdd,
              currentIndex: controller.pageAdd.value,
              textType: TextType.body3,
            ),
          ),
          Expanded(
            child: PageView(
              controller: controller.addPageController,
              children: [
                PageOneView(),
                PageTwoView(),
                PageThreeView(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
