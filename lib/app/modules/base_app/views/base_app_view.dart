import 'package:biapay_app/app/configs/assets.dart';
import 'package:biapay_app/app/configs/configs.dart';
import 'package:biapay_app/app/modules/analystics/views/analystics_view.dart';
import 'package:biapay_app/app/modules/scan/views/scan_view.dart';
import 'package:biapay_app/app/modules/transaction/views/transaction_view.dart';
import 'package:biapay_app/app/modules/transfert/views/transfert_view.dart';
import 'package:biapay_app/app/widgets/biapay_ui_package.dart';
import 'package:biapay_app/generated/locales.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';

import '../../request_money/views/request_main_view.dart';
import '../controllers/base_app_controller.dart';

class BaseAppView extends GetView<BaseAppController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => IndexedStack(
          index: controller.page.value,
          children: [
            DashboardView(),
            RequestMoneyMainView(),
            //TransfertView(),
            Visibility(
              visible: controller.page.value == 2,
              child: ScanView(),
            ),
            AnalysticsView(),
            TransactionView(),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        color: Colors.white,
        height: 85.h,
        child: Row(
          children: [
            item(LocaleKeys.home.tr, Assets.b1, 0),
            item(LocaleKeys.transfert.tr, Assets.b2, 1),
            Expanded(
              child: Center(
                child: InkWell(
                  onTap: () => controller.onChangedPage(2),
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Config.colors.qrCodeColor,
                    ),
                    height: 75.w,
                    width: 75.w,
                    alignment: Alignment.center,
                    child: Obx(() => SvgPicture.asset(
                          Assets.b3,
                          color: controller.page.value == 2
                              ? Config.colors.greenColor
                              : Colors.white,
                          width: 25,
                        )),
                  ),
                ),
              ),
            ),
            item(LocaleKeys.analytics.tr, Assets.b4, 3),
            item(LocaleKeys.transaction.tr, Assets.b5, 4),
          ],
        ),
      ),
    );
  }

  Widget item(String title, String asset, int index) {
    return Expanded(
        child: Center(
      child: InkWell(
        onTap: () => controller.onChangedPage(index),
        child: Obx(() => Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  asset,
                  width: 40.sp,
                  color: controller.page.value == index
                      ? Config.colors.greenColor
                      : Config.colors.primaryColor,
                ),
                SizedBox(
                  height: 6.h,
                ),
                BiaText(
                  title,
                  color: controller.page.value == index
                      ? Config.colors.greenColor
                      : Config.colors.primaryColor,
                ),
              ],
            )),
      ),
    ));
  }
}


