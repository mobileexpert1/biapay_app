import 'package:biapay_app/app/configs/assets.dart';
import 'package:biapay_app/app/configs/configs.dart';
import 'package:biapay_app/app/referal_friends/views/referal_view.dart';
import 'package:biapay_app/app/routes/app_pages.dart';
import 'package:biapay_app/app/widgets/app/Ornob/app_version.dart';
import 'package:biapay_app/app/widgets/app/Ornob/contact.dart';
import 'package:biapay_app/app/widgets/app/Ornob/impressum.dart';
import 'package:biapay_app/app/widgets/app/Ornob/policies.dart';
import 'package:biapay_app/app/widgets/export_file.dart';
import 'package:biapay_app/generated/locales.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'bia_text.dart';

class SidebarItem {
  final String title;
  final dynamic icon;
  final VoidCallback onTap;

  SidebarItem({required this.title, required this.icon, required this.onTap});
}

class Menu extends StatefulWidget {
  final List<SidebarItem> items;
  const Menu._(this.items);

  factory Menu.demo(BuildContext context) {

    final List<SidebarItem> items = [
    //  if (isLogin) ...[
        SidebarItem(
            title: LocaleKeys.my_profile.tr,
            icon: Icons.person,
            onTap: () {
              Get.toNamed(Routes.PROFIL);
            }),
        SidebarItem(
            title: LocaleKeys.tikets.tr,
            icon: Icons.tab,
            onTap: () {
              Get.toNamed(Routes.TICKET);
            }),
      SidebarItem(
          title: LocaleKeys.event.tr,
          icon: Icons.event,
          onTap: () {
            Get.toNamed(Routes.EVENT_MANAGEMENT);
          }),
      box.read(Config.keys.userType) == 'USER'?
      SidebarItem(
          title: LocaleKeys.loyalty.tr,
          icon: Icons.loyalty,
          onTap: () {
            // Get.toNamed(Routes.LOYALTY);
          }):
      SidebarItem(
          title: LocaleKeys.invoicing.tr,
          icon: Icons.tab,
          onTap: () {
            Get.toNamed(Routes.INVOICING);
          }),


      if(box.read(Config.keys.userType) == 'MERCHANT')
      SidebarItem(
          title: LocaleKeys.pricing.tr,
          icon: Icons.tab,
          onTap: () {
            Get.toNamed(Routes.PRICING);
          }),
      if(box.read(Config.keys.userType) == 'MERCHANT')
      SidebarItem(
          title: LocaleKeys.billing.tr,
          icon: Icons.tab,
          onTap: () {
            Get.toNamed(Routes.BILLING);
          }),


     // ],
      SidebarItem(
          title: LocaleKeys.tutorials.tr,
          icon: Icons.play_circle_outline,
          onTap: () {
            Get.toNamed(Routes.TUTORIALS);
          }),
      SidebarItem(
          title: LocaleKeys.tontine.tr,
          icon: Icons.tab,
          onTap: () {
            Get.toNamed(Routes.TONTINE);
          }),

      SidebarItem(
          title: LocaleKeys.ecommerce.tr,
          icon: Icons.tab,
          onTap: () {
            Get.toNamed(Routes.ECOMMERCE);
          }),

      if(box.read(Config.keys.userType) == 'MERCHANT')
        SidebarItem(
          title: LocaleKeys.my_message.tr,
          icon: Icons.message,
          onTap: () {
            Get.toNamed(Routes.CHAT);
          }),

      SidebarItem(
          title: LocaleKeys.settings.tr,
          icon: Assets.sideSetting,
          onTap: () {
            Get.back();
            Get.toNamed(Routes.SETTINGS);
          }),
      SidebarItem(
          title: 'Policies',
          icon: Assets.sidePolicies,
          onTap: () {
            Get.to(() =>   Policies());
          }),
      SidebarItem(
          title: LocaleKeys.impressum.tr,
          icon: Assets.sideImpressum,
          onTap: () {
            Get.to(() => const Impressum());
          }),
      SidebarItem(
          title: LocaleKeys.contact.tr,
          icon: Assets.sideContact,
          onTap: () {
            Get.to(() =>  Contact());
          }),
// if(box.read(Config.keys.userType) == 'USER')
  SidebarItem(
          title: LocaleKeys.referal_a_friend.tr,
          icon: Icons.offline_share,
          onTap: () {
            Get.to(() =>  ReferalView());
          }),


      // SidebarItem(title: '', icon: Assets.users, onTap: (){}),
      SidebarItem(
          title: LocaleKeys.app_version.tr,
          icon: Assets.sideAppversion,
          onTap: () {
            Get.to(() => const AppVersion());
          }),
     // if (isLogin)
        SidebarItem(
            title: LocaleKeys.logout.tr,
            icon: Icons.logout,
            onTap: () {
              box.remove(Config.keys.tokenKey);
              Get.offAllNamed(Routes.LANDING);
            }),
      // SidebarItem(
      //     title: 'Congratulations',
      //     icon: Assets.congratulation,
      //     onTap: () {
      //       Navigator.push(
      //           context,
      //           MaterialPageRoute(
      //               builder: (context) => CongratulationsScreen()));
      //     }),
      // SidebarItem(
      //     title: 'Warning screen',
      //     icon: Assets.warning,
      //     onTap: () {
      //       Navigator.push(context,
      //           MaterialPageRoute(builder: (context) => WarningScreen()));
      //     }),
    ];

    return Menu._(items);
  }

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      margin: EdgeInsets.only(right: 120.w),
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: <Widget>[
          Container(
            height: 250.h,
            margin: EdgeInsets.only(bottom: 40.h),
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(Assets.background),
                    fit: BoxFit.cover,
                    alignment: Alignment.bottomCenter)),
            child: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 8.0),
                    child: BiaText(
                      'v 0.10',
                      color: Colors.white,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 80.w, top: 50.h),
                    padding: EdgeInsets.all(10.w),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15.sp)),
                    width: 200.w,
                    child: Image.asset(
                      Assets.landingLogo,
                      fit: BoxFit.contain,
                    ),
                  )
                ],
              ),
            ),
          ),
        ]..addAll(List<Widget>.from(widget.items.map(
            (item) => MaterialButton(
              onPressed: item.onTap,
              padding: EdgeInsets.symmetric(horizontal: 10),
              minWidth: 0,
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 16.w),
                padding: EdgeInsets.symmetric(vertical: 24.h),
                decoration: BoxDecoration(
                    border: Border(
                        bottom:
                            BorderSide(color: Colors.blue[100]!, width: 0.5))),
                child: Row(
                  children: [
                    if (item.icon is IconData)
                      Icon(
                        item.icon,
                        color: Config.colors.greenColor,
                      )
                    else
                      Image.asset(
                        item.icon,
                        width: 25.w,
                      ),
                    SizedBox(width: 15.w),
                    BiaText(
                      item.title,
                      textType: TextType.headLine6,
                      color: Colors.blue[900],
                    ),
                  ],
                ),
              ),
            ),
          ))),
      ),
    );
  }
}
