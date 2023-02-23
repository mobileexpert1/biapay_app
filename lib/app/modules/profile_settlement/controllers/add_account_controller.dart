import 'package:biapay_app/app/modules/events/views/new_event.dart';
import 'package:biapay_app/app/widgets/export_file.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/scheduler.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../../models/merchent_profile_model.dart';
import '../../../models/merchent_shop_model.dart';

class AddAccountController extends GetxController {
  RxBool isShopvisible = false.obs;
  RxBool isPosvisible = false.obs;

  MerchentShopModel? merchentShopModel;
  var merchentShopController = TextEditingController();
  var merchentPosController = TextEditingController();
  RxList<MerchentShopDataModel>? merchentShopList =
      <MerchentShopDataModel>[].obs;
  RxList<MerchantPosModel>? merchentPosList = <MerchantPosModel>[].obs;
  String selectedShopLabel = LocaleKeys.select_shop.tr;
  String selectedPosLabel = LocaleKeys.select_POS.tr;

  @override
  void onInit() {
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      hitApiToGetAllShopList();
      hitApiToGetPaymentCategoriesList();
    });
    // TODO: implement onInit
    super.onInit();
  }

  hitApiToGetAllShopList() async {
    Get.showLoader();
    await userProvider.allShopListApiCall().then((value) {
      Get.closeLoader();
      if (value != null) {
        merchentShopModel = value;
        merchentShopList?.addAll(merchentShopModel?.shops ?? []);
        merchentShopList?.refresh();
        update();
      }
    }).onError((error, stackTrace) {
      Get.closeLoader();
      Get.showtoast(error.toString());
    });
  }


  hitApiToGetPaymentCategoriesList() async {
    Get.showLoader();
    await userProvider.paymentListApiCall().then((value) {
      Get.closeLoader();
      if (value != null) {
        update();
       }
    }).onError((error, stackTrace) {
      Get.closeLoader();
      Get.showtoast(error.toString());
    });
  }

  changeShopVisibilty(){
    isShopvisible.value=!isShopvisible.value;
    isPosvisible.value=false;
    update();
  }

  changePosVisibilty(){
    isPosvisible.value=!isPosvisible.value;
    update();
  }

}
