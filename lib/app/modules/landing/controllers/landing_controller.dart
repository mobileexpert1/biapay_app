import 'package:biapay_app/app/configs/configs.dart';
import 'package:biapay_app/app/configs/enums.dart';
import 'package:biapay_app/app/routes/app_pages.dart';
import 'package:biapay_app/generated/locales.g.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class LandingController extends GetxController {
  final authType = AuthType.login.obs;

  final controller = PageController();
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  void goToSignin(String type) {
     box.write(Config.keys.userType, type);
    if (authType.value == AuthType.login) {
      var userType=box.read(Config.keys.userType);
      print(userType);
      Get.toNamed(Routes.SIGNIN);
    } else {
       var userType=box.read(Config.keys.userType);
      print("here type is signup ${userType}");
       Get.toNamed(Routes.SIGNUP);
      /*if(userType == Config.keys.user){
        Get.toNamed(Routes.PRIVATE_SIGNUP);
      }else{
        Get.toNamed(Routes.BUSINESS_SIGNUP);

      }*/

    }
  }

  void login() {
    authType(AuthType.login);
    Get.toNamed(Routes.CHOOSE_LOGIN_OPTION);
  }

  void register() {
    authType(AuthType.register);
    Get.toNamed(Routes.CHOOSE_LOGIN_OPTION);
  }

  void toggleAuthType() {
    if (authType.value == AuthType.login) {
      authType(AuthType.register);
      controller.animateToPage(1,  duration: Duration(milliseconds: 500), curve: Curves.linear);
    } else {
      authType(AuthType.login);
      controller.animateToPage(0,
          duration: Duration(milliseconds: 500), curve: Curves.linear);
    }
  }

  String get titlebody => authType.value == AuthType.login
      ? LocaleKeys.choose_type_title.tr
      : LocaleKeys.choose_type_title2.tr;
}
