import 'package:biapay_app/app/modules/my_wallet/controllers/my_wallet_controller.dart';
import 'package:biapay_app/app/widgets/biapay_ui_package.dart';
import 'package:biapay_app/generated/locales.g.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PageOneView extends StatelessWidget {
  const PageOneView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<MyWalletController>();
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        children: [
          SizedBox(
            height: 15.h,
          ),
          BiaDropdown(
            margin: EdgeInsets.zero,
            options: [
              "Option 1",
              "Option 2",
              "Option 3",
            ],
            controller: controller.cardTypeController,
            hint: LocaleKeys.select_card_type.tr,
            displayName: (e) => e,
            onSelected: controller.onSelectedCardType,
          ),
          SizedBox(
            height: 15.h,
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
          ),
          SizedBox(
            height: 15.h,
          ),
          BiaTextField(
            padding: EdgeInsets.zero,
            hint: LocaleKeys.card_number.tr,
            inputType: InputFieldType.number(),
          ),
          SizedBox(
            height: 15.h,
          ),
          Row(
            children: [
              Expanded(
                flex: 3,
                child: BiaTextField(
                  padding: EdgeInsets.zero,
                  hint: LocaleKeys.expire_date.tr,
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
                  hint: LocaleKeys.cw.tr,
                  displayName: (e) => e,
                  onSelected: controller.onSelected,
                ),
              )
            ],
          ),
          SizedBox(
            height: 30.h,
          ),
          BiaCheckBox(
            padding: EdgeInsets.zero,
            initValue: false,
            title: LocaleKeys.save_card_for_future_use.tr,
            onChanged: controller.onChangedSaveCardStatus,
          ),
          SizedBox(
            height: 40.h,
          ),
          BiaButton.greenButtonInRow(
            text: LocaleKeys.next.tr,
            onPressed: () {},
            width: Get.width,
          )
        ],
      ),
    );
  }
}
