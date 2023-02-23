


import 'dart:typed_data';

import 'package:flutter/scheduler.dart';

import '../../../models/merchent_profile_model.dart';
import '../../../widgets/export_file.dart';

class ProfilController extends GetxController {
  //TODO: Implement ProfilController

  Uint8List? uint8list;
  MerchentProfile? merchentProfile;
  final count = 0.obs;
  @override
  void onInit() {
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      if(getIsUser()!="USER"){
        hitApiToGetUserProfileInformation();
        hitApiToGetUserProfileImage();
      }

    });
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







  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}
