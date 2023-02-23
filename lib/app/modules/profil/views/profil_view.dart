import 'package:biapay_app/app/configs/assets.dart';
import 'package:biapay_app/app/configs/configs.dart';
import 'package:biapay_app/app/modules/profil/views/edit_profil_view.dart';
import 'package:biapay_app/app/routes/app_pages.dart';
import 'package:biapay_app/app/widgets/biapay_ui_package.dart';
import 'package:biapay_app/app/widgets/export_file.dart';
import 'package:biapay_app/generated/locales.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';

import '../controllers/profil_controller.dart';

class ProfilView extends GetView<ProfilController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: BiaAppBar.simple(LocaleKeys.my_profile.tr),
      body: BiaScaffold(
          body: Padding(
        padding: EdgeInsets.symmetric(vertical: 40.h),
        child: SingleChildScrollView(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              color: Colors.white,
            ),
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                GetBuilder<ProfilController>(builder: (controller) {
                  return profileViewWidet(controller);
                }),
                Divider(
                  color: Config.colors.blueColor,
                  thickness: .4,
                  height: 40.h,
                ),
                /*  (getIsUser() == true) ? Container():*/
                item(LocaleKeys.account_settlement.tr, Assets.p1, onTap: () {
                  Get.toNamed(Routes.MERCHENT_PROFILE_SETTLEMENT);
                }),
                item(LocaleKeys.edit_pro.tr, Assets.p1, onTap: () {
                  if (getIsUser() == "USER") {
                    Get.toNamed(Routes.EDIT_PROFILE);
                  } else {
                    Get.toNamed(Routes.MERCHENT_PROFILE_VIEW);
                  }
                }),
                item(
                  LocaleKeys.update_kyc.tr,
                  Assets.p2,
                  onTap: () => Get.toNamed(Routes.KYC),
                ),
                item(
                  LocaleKeys.credit_debit_card.tr,
                  Assets.p3,
                ),
                item(
                  LocaleKeys.edit_pro.tr,
                  Assets.p4,
                ),
                item(
                  LocaleKeys.wallet.tr,
                  Assets.p5,
                ),
                item(LocaleKeys.qr_barcode.tr, Assets.p5, onTap: () {
                  if (getIsUser() == 'USER') {
                    Get.toNamed(Routes.CUSTOMER_QR_BARCODE);
                  } else {
                    Get.toNamed(Routes.MERCHENT_QR_BARCODE);
                  }
                }),
                item(LocaleKeys.settlement.tr, Assets.p5, onTap: () {
                  Get.toNamed(Routes.SETTLEMENTREPORTDETAIL);
                })
              ],
            ),
          ),
        ),
      )),
    );
  }

  profileViewWidet(ProfilController controller) {
    return Row(
      children: [
        controller.uint8list != null
            ? Container(
              decoration: BoxDecoration(
              shape: BoxShape.circle,
                border: Border.all(color: Colors.grey,width: 0.7.w)
              ),
                child: CircleAvatar(
                  backgroundImage: MemoryImage(controller.uint8list!),
                  radius: 35,
                ),
              )
            : CircleAvatar(
                child: Icon(
                  Icons.person,
                ),
                radius: 35,
              ),
        SizedBox(
          width: 20.w,
        ),
        Expanded(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BiaText(
              controller.merchentProfile?.merchantProfile?.merchant
                      ?.merchantName ??
                  "",
              textType: TextType.headLine5,
              fontWeight: FontWeight.w500,
              color: Config.colors.blueColor,
            ),
            SizedBox(
              height: 10.h,
            ),
            BiaText(
              getIsUser()??"",
              // textType: TextType.headLine6,
              // fontWeight: FontWeight.w500,
              color: Config.colors.blueColor,
            ),
          ],
        )),
      ],
    );
  }

  Widget item(String title, String asset, {void Function()? onTap}) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          ListTile(
            leading: SvgPicture.asset(asset),
            title: BiaText(title, fontSize: 20.sp),
            contentPadding: EdgeInsets.zero,
          ),
          Divider(
            color: Config.colors.blueColor,
            thickness: .4,
            height: 10.h,
          )
        ],
      ),
    );
  }
}
