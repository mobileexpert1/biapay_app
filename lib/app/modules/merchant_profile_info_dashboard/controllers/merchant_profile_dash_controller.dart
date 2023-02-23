import 'dart:typed_data';

import 'package:biapay_app/app/widgets/export_file.dart';
import 'package:flutter/scheduler.dart';

import '../../../models/merchent_profile_model.dart';
import '../../../models/merchent_subscription_model.dart';


class MerchantProfileDashController extends GetxController{


  Uint8List? uint8list;
  MerchentProfile? merchentProfile;
  @override
  void onInit() {
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      hitApiToGetUserProfileImage();
      hitApiToGetUserProfileInformation();
    });
    // TODO: implement onInit
    super.onInit();
  }

  hitApiToGetUserProfileImage() async {
    Get.showLoader();
    await userProvider
        .getUserUploadImageFromServer(Url: GET_MERCHRNT_PRFOFILE)
        .then((value) {
      Get.closeLoader();
      if (value != null) {
        uint8list = Uint8List.fromList(value);
        update();
        print(uint8list);
      }
    }).onError((error, stackTrace) {
      Get.closeLoader();
      Get.showtoast(error.toString());
    });
  }
  hitApiToGetUserProfileInformation() async {

    Get.showLoader();
    await userProvider.merchentProfileFromServer().then((value) {
      Get.closeLoader();
      if (value != null) {
        merchentProfile = value;
        box.write(Config.keys.merchantId, merchentProfile?.merchantProfile?.merchant?.id);
        update();
      }
    }).onError((error, stackTrace) {
      Get.closeLoader();
      Get.showtoast(error.toString());
    });
  }




}