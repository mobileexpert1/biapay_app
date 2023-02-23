import 'package:biapay_app/app/configs/configs.dart';
import 'package:biapay_app/app/configs/toast_controller.dart';
import 'package:biapay_app/app/models/providers/user_provider.dart';
import 'package:biapay_app/app/widgets/export_file.dart';
import 'package:biapay_app/generated/locales.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../models/kyc_model.dart';

class BaseAppController extends SuperController {
  final controller = PageController();
  final page = 0.obs;
  final _userProvider = UserProvider();

  @override
  void onInit() {
    checkToken();
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      hitApiTogetKyc();
    });
    super.onInit();
  }

  hitApiTogetKyc() async {
    Kyc kycModel;
    Get.showLoader();
    await userProvider
        .getKyc(getIsUser() == "USER" ? USER_KYC : MERCHENT_KYC)
        .then((value) {
      Get.closeLoader();
      if (value != null) {
        kycModel = value;
        box.write(Config.keys.kyc, kycModel.toJson());
      }
    }).onError((error, stackTrace) {
      Get.closeLoader();
      Get.showtoast(error.toString());
    });
  }

  checkToken() {
    print("user_token is ${box.read(Config.keys.tokenKey)}");
    update();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  void onChangedPage(int value) async {
    if (value == 2) {
      final statut = await Permission.camera.request();
      if (!statut.isGranted) {
        ToastController(message: LocaleKeys.error_permission_camera.tr)
            .showToast();
        return;
      }
      return;
    }
    page(value);
    // controller.jumpToPage(value);
  }

  @override
  void onDetached() {}

  @override
  void onInactive() {}

  @override
  void onPaused() {}

  @override
  void onResumed() {}
}
