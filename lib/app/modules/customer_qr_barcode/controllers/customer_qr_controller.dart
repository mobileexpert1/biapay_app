import 'dart:typed_data';

import 'package:biapay_app/app/widgets/export_file.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/scheduler.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

class CustomerQrController extends GetxController {
  Uint8List? qrCodeImage,barCodeImage;

  @override
  void onInit() {
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      getUdidFromToken();
    });
    // TODO: implement onInit
    super.onInit();
  }

  getUdidFromToken() async {
    Map<String, dynamic> decodedToken =
        await JwtDecoder.decode(box.read(Config.keys.tokenKey));

    if (decodedToken != null && decodedToken['profileInfo'] != null) {
      hitApiToGetCustomerQrCode(decodedToken['profileInfo']['uuid']);
    }
  }

  hitApiToGetCustomerQrCode(String? uuid) async {
    Get.showLoader();
    await userProvider
        .getCustomerQrCode(endPointUrl: CUSTOMER_QR_CODE, udid: uuid)
        .then((value) {
      Get.closeLoader();
      if (value != null) {
        qrCodeImage = Uint8List.fromList(value);
        update();
        hitApiToGetCustomerBarCode(uuid);
        print(qrCodeImage);
      }
    }).onError((error, stackTrace) {
      Get.closeLoader();
      Get.showtoast(error.toString());
    });
  }



  hitApiToGetCustomerBarCode(String? uuid) async {
    Get.showLoader();
    await userProvider
        .getCustomerBarCodeCode(endPointUrl: CUSTOMER_BAR_CODE, udid: uuid)
        .then((value) {
      Get.closeLoader();
      if (value != null) {
        barCodeImage = Uint8List.fromList(value);
        update();
        print(barCodeImage);
      }
    }).onError((error, stackTrace) {
      Get.closeLoader();
      Get.showtoast(error.toString());
    });
  }
}
