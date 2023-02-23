import 'package:dio/dio.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/scheduler.dart';

import '../../../../main.dart';
import '../../../models/usertype_model.dart';
import '../../../widgets/export_file.dart';

class SigninController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final userTypeController = TextEditingController();
  final auth = LocalAuthentication();
  final enabledBiometric = false.obs;
  final rememberMeCustomerValue = false.obs;
  final rememberMeMerchantValue = false.obs;
  List<String> userTypeList = [
    LocaleKeys.merchant_admin.tr,
    LocaleKeys.pos_manager.tr,
    LocaleKeys.shop_manager.tr
  ];
  RxString userType="".obs;


  @override
  void onInit() {
    super.onInit();
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      getCredntialForUser();
    });

    final enabled = box.read<bool?>(Config.keys.enabledBiometric) ?? false;
    enabledBiometric(auth != null && enabled);
  }

  getCredntialForUser()async {
    userType.value=await box.read(Config.keys.userType);
    userType.refresh();
    if (userType.value=="USER") {
      var value=box.read(Config.keys.rememberMeCustomer);
      if(value!=null){
        rememberMeCustomerValue.value=true;
        rememberMeCustomerValue.refresh();
      }
      final auth = box.read(Config.keys.userAuth);
      usernameController.text = auth?['username'] ?? '';
      passwordController.text = auth?['password'] ?? '';
    } else {
       var value=box.read(Config.keys.rememberMemerchant);
       if(value!=null){
         rememberMeMerchantValue.value=true;
         rememberMeMerchantValue.refresh();
       }
      final auth = box.read(Config.keys.merchantAuth);
      usernameController.text = auth?['username'] ?? '';
      passwordController.text = auth?['password'] ?? '';
    }

    update();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  validateTextField() {
    if (isEmptyFiedds(usernameController?.text) == true) {
      Get.showtoast(LocaleKeys.username_empty.tr);
      return;
    } else if (isEmptyFiedds(passwordController.text) == true) {
      Get.showtoast(LocaleKeys.password_empty.tr);
      return;
    } else {
      if (box.read(Config.keys.userType) != null &&
          box.read(Config.keys.userType) == "MERCHANT") {
        if (isEmptyFiedds(userTypeController.text) == true) {
          Get.showtoast(LocaleKeys.please_select_account_type.tr);
          return;
        } else {
          authenticate();
        }
      } else {
        authenticate();
      }
    }
  }

  void authenticate() async {
    Get.showLoader();
    var data = loginRequestModel(
        email: usernameController.text,
        password: passwordController.text,
        userType: box.read(Config.keys.userType));
    await userProvider.loginApicall(data: data).then((value) {
      Get.closeLoader();
      if (value != null) {
        if (getIsUser() == "USER") {
          box.write(Config.keys.userAuth, {
            "username": usernameController.text,
            "password": passwordController.text,
          });
          if(rememberMeCustomerValue.value==true){
            box.write(Config.keys.rememberMeCustomer, rememberMeCustomerValue.value);
          }
        } else {
          box.write(Config.keys.merchantAuth, {
            "username": usernameController.text,
            "password": passwordController.text,
          });
          if(rememberMeMerchantValue.value==true){
            box.write(Config.keys.rememberMemerchant, rememberMeMerchantValue.value);
          }
        }
        if (value['token'] != null) {
          box.write(Config.keys.tokenKey, value['token']);
          Get.offAllNamed(Routes.BASE_APP);
          Get.showtoast(LocaleKeys.login_sucessfully.tr);
        }
      }
    }).onError((error, stackTrace) {
      Get.closeLoader();
      Get.showtoast(error.toString());
    });
  }

  moveToForgotPassword() {
    Get.toNamed(Routes.FORGOT_PASSWORD);
  }

  void rememberMe(bool? p1) {
    if(userType.value=="USER"){
      rememberMeCustomerValue(p1);
    }else{
      rememberMeMerchantValue(p1);

      //
    }
    print(p1);

  }

  void fingerAuth() async {
    auth
        .authenticate(
      localizedReason: LocaleKeys.auth_and_access_to_app.tr,
    )
        .then((auth) async {
      if (auth) {
        try {
          Get.showLoader();
          final data = box.read(Config.keys.userAuth);
          var rawdata = loginRequestModel(
              email: data['username'], password: data['password']);

          await userProvider.loginApicall(data: rawdata);
          ToastController(message: LocaleKeys.succes_login.tr);
        } on DioError catch (e) {
          Get.closeLoader();
          print(e);
        }
      }
    });
  }
}
