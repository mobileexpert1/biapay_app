import 'dart:typed_data';

import 'package:flutter/scheduler.dart';
import 'package:image_picker/image_picker.dart';

import '../../../models/merchent_profile_model.dart';
import '../../../models/sucees_model.dart';
import '../../../widgets/export_file.dart';

class MerchentProfileController extends GetxController {
  //TODO: Implement ProfilController
  // RxList<MerchentProfile> merchantmodel = <MerchentProfile>[].obs;
  final profileImage = ''.obs;
  final logoImage = ''.obs;
  Uint8List? uint8list;
  Uint8List? profileUint8list;
  MerchentProfile? merchentProfile;

  var firstNameController = TextEditingController();
  var lastNameController = TextEditingController();
  var emailController = TextEditingController();
  var phnNumberController = TextEditingController();

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
    await userProvider.uploadMerchentImageOnServer(fileImge: path).then((value) {
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

  // hitApiToGetUserProfileInformation() async {
  //   Get.showLoader();
  //   await userProvider.merchentProfileFromServer().then((value) {
  //     Get.closeLoader();
  //     if (value != null) {
  //       merchentProfile = value;
  //       box.write(Config.keys.merchantId, merchentProfile?.merchantProfile?.merchant?.id);
  //
  //       setDataOnfields(merchentProfile);
  //
  //       update();
  //     }
  //   }).onError((error, stackTrace) {
  //     Get.closeLoader();
  //     Get.showtoast(error.toString());
  //   });
  // }


  hitApiToGetUserProfileInformation() async {
    Get.showLoader();
    await userProvider.merchentProfileFromServer().then((value) {
      Get.closeLoader();
      if (value != null) {
        merchentProfile = value;
        // box.write(Config.keys.merchantId, merchentProfile?.merchantProfile?.merchant?.id);
        print(merchentProfile);
        // merchantmodel.refresh();
        // setDataOnfields(merchentProfile);
refresh();
        update();
      }
    }).onError((error, stackTrace) {
      Get.closeLoader();
      Get.showtoast(error.toString());
    });
  }


  setDataOnfields(MerchentProfile? merchentProfile) {
    if (merchentProfile?.merchantProfile != null) {
      firstNameController.text =
          merchentProfile?.merchantProfile?.merchant?.merchantName ?? "";
      emailController.text =
          merchentProfile?.merchantProfile?.merchant?.email ?? "";
      phnNumberController.text =
          merchentProfile?.merchantProfile?.merchant?.phoneNo?.toString() ?? "";
      update();
    }
  }
}
