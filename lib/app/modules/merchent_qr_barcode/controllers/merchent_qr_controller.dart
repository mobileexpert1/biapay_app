import 'dart:typed_data';

import 'package:biapay_app/app/widgets/export_file.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/scheduler.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

import '../../../models/merchent_shop_model.dart';

class MerchentQrController extends GetxController {
  Uint8List? qrCodeImage,barCodeImage;
  MerchentShopModel? merchentShopModel;
  var merchentShopController=TextEditingController();
  var merchentPosController=TextEditingController();
  RxList<MerchentShopDataModel>? merchentShopList=<MerchentShopDataModel>[].obs;
  RxList<MerchantPosModel>? merchentPosList=<MerchantPosModel>[].obs;
  final isvisible=false.obs;
  MerchantPosModel? merchantPosModel;
  String selectedShopLabel = LocaleKeys.select_shop.tr;
  var shopId=null;
  String selectedPosLabel = LocaleKeys.select_POS.tr;


  MerchentShopDataModel? merchentShopDataModel;
  @override
  void onInit() {
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      hitApiToGetAllShopList();
    });
    // TODO: implement onInit
    super.onInit();
  }


  hitApiToGetAllShopList() async {
    Get.showLoader();
    await userProvider.allShopListApiCall().then((value) {
      Get.closeLoader();
      if (value != null) {
        merchentShopModel=value;
        merchentShopList?.addAll(merchentShopModel?.shops??[]);
        merchentShopList?.refresh();
        update();
      }
    }).onError((error, stackTrace) {
      Get.closeLoader();
      Get.showtoast(error.toString());
    });
  }





  hitApiToGetMerchentQrCode(var posId) async {
    Get.showLoader();
    await userProvider .getCustomerQrCode(endPointUrl: MERCHENT_QR_CODE, udid: posId)
        .then((value) {
      Get.closeLoader();
      if (value != null) {
        qrCodeImage = Uint8List.fromList(value);
        update();
        hitApiToGetMerchentBarCode(posId);
        print(qrCodeImage);
      }
    }).onError((error, stackTrace) {
      Get.closeLoader();
      Get.showtoast(error.toString());
    });
  }



  hitApiToGetMerchentBarCode(var posId) async {
    Get.showLoader();
    await userProvider
        .getCustomerBarCodeCode(endPointUrl: MERCHENT_BAR_CODE, udid: posId)
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
