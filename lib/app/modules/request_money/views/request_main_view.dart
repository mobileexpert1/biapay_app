import 'package:biapay_app/app/modules/kyc/components/identity_information.dart';
import 'package:biapay_app/app/modules/kyc/components/location_info.dart';
import 'package:biapay_app/app/modules/kyc/components/personnals_infos.dart';
import 'package:biapay_app/app/routes/app_pages.dart';
import 'package:biapay_app/app/widgets/app/Ornob/contact.dart';
import 'package:biapay_app/app/widgets/biapay_ui_package.dart';
import 'package:biapay_app/app/widgets/export_file.dart';
import 'package:biapay_app/generated/locales.g.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../configs/configs.dart';
import '../controllers/request_money_controller.dart';

class RequestMoneyMainView extends StatelessWidget {
  var controller = Get.put(RequestMoneyController());

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<RequestMoneyController>();
    return BiaScaffold(
      drawer: Menu.demo(context),
      appBar: BiaAppBar(
        showAction: false,
      ),
      body: Column(
        children: [
          SizedBox(
            height: 20.h,
          ),
          for (int i = 0; i < controller.length; i++)
            i == 2 && box.read(Config.keys.userType) == "MERCHANT"
                ? Container()
                : requestMoneyItemsWidget(title: controller.mlist![i], index: i)
        ],
      ),
    );
  }

  requestMoneyItemsWidget({title, index}) {
    return InkWell(
      onTap: () {
        if (index == 0) {
          Get.toNamed(Routes.SEND_MONEY);
        } else if (index == 1) {
          if (getIsUser() == "USER") {
            Get.toNamed(Routes.REQUEST_MONEY);
          } else {
            Get.toNamed(Routes.REQUEST_MONEY_MERCHANT_VIEW);
          }
        } else {
          Get.toNamed(Routes.PAY_LINK);
        }
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 15.h),
        padding: EdgeInsets.all(20.h),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.r), color: Colors.white),
        child: Row(
          children: [
            BiaText(
              title ?? "",
              color: Colors.black,
              fontSize: 18.sp,
            ),
            Spacer(),
            Icon(
              Icons.arrow_forward_ios_outlined,
              size: 25.h,
            )
          ],
        ),
      ),
    );
  }
}
