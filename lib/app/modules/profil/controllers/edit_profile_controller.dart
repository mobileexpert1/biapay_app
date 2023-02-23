import 'dart:typed_data';

import 'package:flutter/scheduler.dart';
import 'package:image_picker/image_picker.dart';

import '../../../models/sucees_model.dart';
import '../../../widgets/export_file.dart';

class EditController extends GetxController {
  //TODO: Implement ProfilController

  final profileImage = ''.obs;
  Uint8List? uint8list;

  @override
  void onInit() {
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      hitApiToGetUserProfileInformation();
      hitApiToGetUserProfileImage();
    });
    super.onInit();
  }

  void getImage(bool camera, int value, proofType) async {
    final picker = await ImagePicker()
        .pickImage(source: camera ? ImageSource.camera : ImageSource.gallery);
    if (picker != null) {
      hitApiToUploadImage(picker.path);
      update();
    }
  }

  hitApiToUploadImage(String path) async {
    SuccessModel successModel;
    Get.showLoader();
    await userProvider.uploadImageOnServer(fileImge: path).then((value) {
      Get.closeLoader();
      if (value != null) {
        successModel = value;
        profileImage.value = path;
        update();
        Get.showtoast(successModel.message ?? " ");
      }
    }).onError((error, stackTrace) {
      Get.closeLoader();
      Get.showtoast(error.toString());
    });
  }

  hitApiToGetUserProfileImage() async {
    Get.showLoader();
    await userProvider.getUserUploadImageFromServer(Url: GET_USER_PRFOFILE).then((value) {
      Get.closeLoader();
      if (value != null) {
        uint8list=Uint8List.fromList(value);
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
    await userProvider.getCustomerProfileFromServer().then((value) {
      Get.closeLoader();
      if (value != null) {

      }
    }).onError((error, stackTrace) {
      Get.closeLoader();
      Get.showtoast(error.toString());
    });
  }
}
