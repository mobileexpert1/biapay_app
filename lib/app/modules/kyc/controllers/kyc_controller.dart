import 'dart:async';
import 'dart:io';

import 'package:biapay_app/app/configs/configs.dart';
import 'package:biapay_app/app/configs/get_extension.dart';
import 'package:biapay_app/app/configs/toast_controller.dart';
import 'package:biapay_app/app/models/kyc_model.dart';
import 'package:biapay_app/app/models/providers/user_provider.dart';
import 'package:biapay_app/generated/locales.g.dart';
import 'package:dio/dio.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/widgets.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../main.dart';
import '../../../models/providers/constants.dart';
import '../../../widgets/helper_widget.dart';

class KycController extends GetxController {
  //TODO: Implement KycController

  final count = 0.obs;
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final birthDateController = TextEditingController();
  final firstAddressController = TextEditingController();
  final secondAddressController = TextEditingController();
  final cityController = TextEditingController();
  final stateController = TextEditingController();
  final countryController = TextEditingController();
  final zipCodeController = TextEditingController();
  final latitudeController = TextEditingController();
  final longitudeController = TextEditingController();
  final deliveryDateController = TextEditingController();
  final endDateController = TextEditingController();
  final namgeOfOrgController = TextEditingController();
  final registeredDateController = TextEditingController();
  final taxPayerNumberController = TextEditingController();
  final websiteLinkController = TextEditingController();
  final tradeRegisteredController = TextEditingController();
  final idNumberController = TextEditingController();
  final idNumberDropController = TextEditingController();
  final stateDeliveryController = TextEditingController();
  final fromController = TextEditingController();

  // final stateDeliveryController = TextEditingController();
  final kyc = Kyc().obs;
  final identifications = IdentityInformation().obs;
  final identity = ''.obs;
  final locationKey = GlobalKey<FormState>();
  final formKey = GlobalKey<FormState>();
  final addressProof = ''.obs;
  final uploadProof = ''.obs;

  final completPhnNumber = "".obs;

  @override
  void onInit() {
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      getKyc();
      getLocation();
    });

    super.onInit();
    //  Timer(Duration(milliseconds: 300), getKyc);
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  void increment() => count.value++;

  void getKyc() async {

      final haveKyc = box.read(Config.keys.kyc);
      if (haveKyc == null)
        Get.showLoader(canUserPop: true);
      else {
        kyc.value = Kyc.fromJson(haveKyc);
        _loadData();
        await kyc.value.identityInformation?.getFileProof();
      }
      update();

      hitApiTogetKyc();

     /* final _kyc = await userProvider
          .getKyc(getIsUser() == true ? USER_KYC : MERCHENT_KYC);
      box.write(Config.keys.kyc, _kyc.toJson());
      kyc(_kyc);
      await kyc.value.identityInformation?.getFileProof();
      update();
      _loadData();
      Get.closeLoader();
    } on DioError catch (e) {
      Get.closeLoader();
      Get.showtoast(LocaleKeys.error_internet.tr);
      Get.back();
      print(e);
    }*/
  }

  hitApiTogetKyc() async {
    Kyc kycModel;
    Get.showLoader();
    await userProvider
        .getKyc(getIsUser() == "USER" ? USER_KYC : MERCHENT_KYC)
        .then((value) async {
      Get.closeLoader();
      if (value != null) {
        kycModel = value;
        box.write(Config.keys.kyc, kycModel.toJson());
        await kyc.value.identityInformation?.getFileProof();
      }
    }).onError((error, stackTrace) {
      Get.closeLoader();
      Get.showtoast(error.toString());
    });
  }


  validateAllFields() {
    if (isEmptyFiedds(nameController?.text) == true) {
      Get.showtoast(LocaleKeys.name_empty.tr);
      return;
    } else if (isEmptyFiedds(emailController?.text) == true) {
      Get.showtoast(LocaleKeys.email_empty.tr);
      return;
    } else if (!EmailValidator.validate(
        emailController?.text?.toString() ?? "")) {
      Get.showtoast(LocaleKeys.email_empty_invalid.tr);
      return;
    } else if (isEmptyFiedds(phoneController?.text) == true) {
      Get.showtoast(LocaleKeys.phn_number_empty.tr);
      return;
    } else if (isEmptyFiedds(birthDateController?.text) == true) {
      Get.showtoast(LocaleKeys.dob_empty.tr);
      return;
    } else if (isEmptyFiedds(firstAddressController?.text) == true) {
      Get.showtoast(LocaleKeys.first_address.tr);
      return;
    } else if (isEmptyFiedds(secondAddressController?.text) == true) {
      Get.showtoast(LocaleKeys.sec_address.tr);
      return;
    } else if (isEmptyFiedds(cityController?.text) == true) {
      Get.showtoast(LocaleKeys.city_empty.tr);
      return;
    } else if (isEmptyFiedds(stateController?.text) == true) {
      Get.showtoast(LocaleKeys.state_empty.tr);
      return;
    } else if (isEmptyFiedds(countryController?.text) == true) {
      Get.showtoast(LocaleKeys.country_empty.tr);
      return;
    } else if (isEmptyFiedds(zipCodeController?.text) == true) {
      Get.showtoast(LocaleKeys.zip_code_empty.tr);
      return;
    } else if (isEmptyFiedds(latitudeController?.text) == true) {
      Get.showtoast(LocaleKeys.lati_empty.tr);
      return;
    } else if (isEmptyFiedds(longitudeController?.text) == true) {
      Get.showtoast(LocaleKeys.longi_empty.tr);
      return;
    } else if (isEmptyFiedds(idNumberDropController?.text) == true) {
      Get.showtoast(LocaleKeys.select_idenitifcation.tr);
      return;
    } else if (isEmptyFiedds(idNumberController?.text) == true) {
      Get.showtoast(LocaleKeys.identication_number_empty.tr);
      return;
    } else if (isEmptyFiedds(deliveryDateController?.text) == true) {
      Get.showtoast(LocaleKeys.date_of_deli.tr);
      return;
    } else if (isEmptyFiedds(stateDeliveryController?.text) == true) {
      Get.showtoast(LocaleKeys.state_of_deli.tr);
      return;
    } else if (isEmptyFiedds(endDateController?.text) == true) {
      Get.showtoast(LocaleKeys.end_of_validaty_date.tr);
      return;
    } else if (uploadProof == "") {
      Get.showtoast(LocaleKeys.upload_proof_image.tr);
      return;
    } else if (addressProof == "") {
      Get.showtoast(LocaleKeys.address_proof_image.tr);
      return;
    } else {
      hidekeyboard();
      hitApiToSendkyc();
    }
  }

  void hitApiToSendkyc() async {
    if (isUser) {
      Get.showLoader(canUserPop: true);
      kyc.value.dateofbirth = birthDateController.text;
      identifications.value.stateofdelivery = stateDeliveryController.text;
      identifications.value.identification = idNumberDropController.text;
      identifications.value.number = double.parse(idNumberController.text);

      kyc.value.mobileno = double.parse(completPhnNumber.value.toString());
      kyc.value.identityInformation?.dateofdelivery =
          deliveryDateController.text;
      kyc.value.identityInformation?.endofvaliditydate = endDateController.text;
      kyc.value.identityInformation = identifications.value;
      print(kyc.value.toJson());

      Get.showLoader();
      await userProvider.saveKycForUser(kyc.value,getIsUser() == "USER" ? USER_SAVE_KYC : MERCHENT_SAVE_KYC).then((value) {
        Get.closeLoader();
        if (value != null) {
          Get.back();
          update();
          Get.showtoast(LocaleKeys.kyc_saved_sucessfully.tr);
        } else {
          Get.closeLoader();
        }
      }).onError((error, stackTrace) {
        Get.closeLoader();
        Get.showtoast(error.toString());
      });

      return;
    } else if (isMerchant) {}

    // bool canSubmit = false;
    // final bool isFreelancer = provider.category == provider.cateGories[0];
    // if (isFreelancer) {
    //   if (provider.uploadProof == null) {
    //     BiaSnackBar(context).message(message: 'Please submit upload proof');
    //   } else if (provider.addressProof == null) {
    //     BiaSnackBar(context).message(message: 'Please submit address proof');
    //   } else {
    //     canSubmit = true;
    //   }
    // } else {
    //   if (provider.companyRegistrationProof == null) {
    //     BiaSnackBar(context)
    //         .message(message: 'Please submit company register proof');
    //   } else if (provider.taxAddressProof == null) {
    //     BiaSnackBar(context).message(message: 'Please submit taxation proof');
    //   } else {
    //     canSubmit = true;
    //   }
    // }

    // if (_formKey.currentState!.validate() && canSubmit) {
    //   // final BusinessDetails businessDetails =
    //   //     provider.kycResponse!.kyc.businessDetails.copyWith(
    //   //         nameoforganization: namgeOfOrgController.text,
    //   //         registereddate: registeredDateController.text,
    //   //         categories: provider.businessCategory!,
    //   //         websitelink: websiteLinkController.text,
    //   //         traderegisternumber: tradeRegisteredController.text,
    //   //         taxpayernumber: taxPayerNumberController.text,
    //   //         companyRegProofContentType: '',
    //   //         taxOfficeAddressProofContentType: '',
    //   //         companyregisterproof: '',
    //   //         taxationofficeaddressproof: '');

    //   // final IdentityInformation identityInformation =
    //   //     provider.kycResponse!.kyc.identityInformation.copyWith(
    //   //   identification:
    //   //       provider.toCamelCase(provider.identityType!),
    //   //   number: double.parse(idNumberController.text),
    //   //   endofvaliditydate: endDateController.text,
    //   //   stateofdelivery: stateDeliveryController.text,
    //   //   dateofdelivery: deliveryDateController.text,
    //   //   addressproof: '',
    //   //   addressProofContentType: '',
    //   //   uploadProofContentType: '',
    //   //   // uploadproof: null
    //   // );

    //   // final KycData kycData = provider.kycResponse!.kyc.copyWith(
    //   //     name: nameController.text,
    //   //     emailid: emailController.text,
    //   //     mobileno: double.parse(mobileController.text),
    //   //     dateofbirth: dobController.text,
    //   //     addressone: addrs1Controller.text,
    //   //     addresstwo: addrs2Controller.text,
    //   //     city: cityController.text,
    //   //     state: stateController.text,
    //   //     zipcode: int.parse(zipCodeController.text),
    //   //     latitude: double.parse(latController.text),
    //   //     // identityInformation:
    //   //     //     isFreelancer ? identityInformation : null,
    //   //     // businessDetails: !isFreelancer ? businessDetails : null,
    //   //     kycApprovalStatus: 'PENDING_FIRST_KYC_APPROVAL');
    //   // controller.kycAction(kycData: kycData);
    // }
    try {} on DioError catch (e) {
      print(e);
    }
  }

  void _loadData() {
    nameController.text = kyc.value.name ?? "";
    emailController.text = kyc.value.emailid ?? "";
    phoneController.text = kyc.value.mobileno?.toString() ?? "";
    firstAddressController.text = kyc.value.addressone ?? "";
    secondAddressController.text = kyc.value.addresstwo ?? "";
    cityController.text = kyc.value.city ?? "";
    stateController.text = kyc.value.state ?? "";
    countryController.text = kyc.value.country ?? "";
    zipCodeController.text = kyc.value.zipcode?.toString() ?? "";
    birthDateController.text = kyc.value.dateofbirth?.toString() ?? "";
    latitudeController.text = kyc.value.latitude?.toString() ?? "";
    longitudeController.text = kyc.value.longitude?.toString() ?? "";
    deliveryDateController.text =
        kyc.value.identityInformation?.dateofdelivery ?? '';
    endDateController.text =
        kyc.value.identityInformation?.endofvaliditydate ?? '';
    idNumberController.text =
        kyc.value.identityInformation?.number?.toString() ?? '';
    stateDeliveryController.text =
        kyc.value.identityInformation?.stateofdelivery ?? '';
  }

  void getLocation() async {
    try {
      final status = await Geolocator.requestPermission();

      if (status == LocationPermission.denied ||
          status == LocationPermission.deniedForever) return;
      Get.showLoader();
      final position = await Geolocator.getCurrentPosition();
      latitudeController.text = position.latitude.toString();
      longitudeController.text = position.longitude.toString();
      kyc.value.latitude = position.latitude;
      kyc.value.longitude = position.longitude;
      update();
    } catch (e) {
    } finally {
      Get.closeLoader();
    }
  }

  void getImage(bool camera, int value, proofType) async {
    final picker = await ImagePicker()
        .pickImage(source: camera ? ImageSource.camera : ImageSource.gallery);
    if (picker != null) {
      if (proofType == "address") {
        if (value == 0) {
          addressProof.value = picker.path;
          identifications.value!.addressProofFile.value = File(picker.path);
        } else {
          addressProof.value = picker.path;
          identifications.value!.addressProofFile.value = File(picker.path);
        }
      } else {
        if (value == 0) {
          uploadProof.value = picker.path;
          identifications.value!.uploadProofFile.value = File(picker.path);
        } else {
          uploadProof.value = picker.path;
          identifications.value!.uploadProofFile.value = File(picker.path);
        }
      }

      kyc.value.identityInformation = identifications.value;
      update();
    }
  }
}
