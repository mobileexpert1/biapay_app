import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../widgets/export_file.dart';

class PinCodeController extends GetxController {
  //TODO: Implement PinCodeController

  final count = 0.obs;

  String? completPhnNumber;
  final formKey = GlobalKey<FormState>();

    var otpController = TextEditingController();
  @override
  void onInit() {
    getPhnNumber();
    super.onInit();
  }

  getPhnNumber(){
    if(Get.arguments!=null&&Get.arguments!=null)
     completPhnNumber=Get.arguments;
    update();
  }



  hitApiTovalidateOtp()async{

    Get.showLoader();
    getPhnNumber();
    var rawData=otpvalidateRequestModel(phoneNumber:completPhnNumber,otpCode:otpController.text);

    await userProvider.validateOtpForUser(data:rawData).then((value) {
      Get.closeLoader();
      if (value=="") {
       Get.offAllNamed(Routes.PRIVATE_SIGNUP,arguments:Get.arguments );

      }
    }).onError((error, stackTrace) {
      Get.closeLoader();
      Get.showtoast(error.toString());
    });
  }



  hitApiToResendOtp() async {
    await  getPhnNumber();
    Get.showLoader();
    var rawData = otpGenerateRequestModel(phoneNumber: completPhnNumber);
    await userProvider.generateOtpForUser(data: rawData).then((value) {
      Get.closeLoader();
      if (value != null) {
        Get.showtoast(LocaleKeys.otp_sent_sucessfully.tr);
      }
    }).onError((error, stackTrace) {
      Get.closeLoader();
      Get.showtoast(error.toString());
    });
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;

  BoxDecoration get pinPutDecoration {
    return BoxDecoration(
      color: Colors.black26,
      // border: Border.all(color: Colors.deepPurpleAccent),
      borderRadius: BorderRadius.circular(15.0),
    );
  }
}
