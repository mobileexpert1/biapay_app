import 'package:biapay_app/app/widgets/browse/custom_file/custom_menu_item.dart';
import 'package:biapay_app/app/widgets/common/bia_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

class BrowseScreen extends StatelessWidget {
  const BrowseScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  BiaAppBar(),
      body: ListView(
        shrinkWrap: true,
        children: [
          SizedBox(
            height: 20.h,
          ),
          CustomMenuItem(
              title: 'my_wall'.tr,
              subTitle: 'topup'.tr,
              icon: Icons.account_balance_wallet,
              onTap: () {
                Get.toNamed('/comingSoon');
              }),
          CustomMenuItem(
              title: 'Kyc'.tr,
              subTitle: 'show kyc'.tr,
              icon: Icons.data_usage,
              onTap: () {
                Get.toNamed('/kyc');
              }),
          CustomMenuItem(
              title: 'my_qr'.tr,
              subTitle: 'unique_code'.tr,
              icon: Icons.pages,
              onTap: () {
                // Get.find<QrController>().showQrCode();
              }),
          CustomMenuItem(
              title: 'tra_history'.tr,
              subTitle: 'past_transections'.tr,
              icon: Icons.swap_vertical_circle,
              onTap: () {
                Get.toNamed('/transacion');
              }),
          CustomMenuItem(
              title: 'coupon_code'.tr,
              subTitle: 'voucher'.tr,
              icon: Icons.confirmation_number,
              onTap: () {
                Get.toNamed('/comingSoon');
              }),
          CustomMenuItem(
              title: 'event_hist'.tr,
              subTitle: 'recent_bookings'.tr,
              icon: Icons.calendar_today,
              onTap: () {
                Get.toNamed('/comingSoon');
              }),
          CustomMenuItem(
              title: 'request_money'.tr,
              subTitle: 'money_requests'.tr,
              icon: Icons.view_list,
              onTap: () {
                Get.toNamed('/comingSoon');
              }),
          CustomMenuItem(
              title: 'reward'.tr,
              subTitle: 'earn_points'.tr,
              icon: Icons.group_work,
              onTap: () {}),
          CustomMenuItem(
              title: 'my_benif'.tr,
              subTitle: 'add_beneficiary'.tr,
              icon: Icons.group,
              onTap: () {
                Get.toNamed('/comingSoon');
              }),
          CustomMenuItem(
              title: 'refer_earn'.tr,
              subTitle: 'refer_friend_earn'.tr,
              icon: Icons.share,
              onTap: () {
                Get.toNamed('/comingSoon');
              }),
          CustomMenuItem(
              title: 'profile'.tr,
              subTitle: 'manage_profile'.tr,
              icon: Icons.person,
              onTap: () {
                Get.toNamed('/my_profile');
              }),
          CustomMenuItem(
              title: 'settings'.tr,
              subTitle: 'allsettings'.tr,
              icon: Icons.settings,
              onTap: () {
                Get.toNamed('/comingSoon');
              }),
          CustomMenuItem(
              title: 'logout'.tr,
              subTitle: 'activity_logout'.tr,
              icon: Icons.power_settings_new,
              onTap: () {
                // Get.find<AuthController>().logOut();
              }),
        ],
      ),
    );
  }
}
