import 'package:biapay_app/app/widgets/export_file.dart';
import 'package:flutter/scheduler.dart';

import '../../../models/merchent_shop_model.dart';

class ShopViewController extends GetxController{

  MerchentShopModel? merchentShopModel;
  RxList<MerchentShopDataModel>? merchentShopList = <MerchentShopDataModel>[].obs;
   RxInt listLength=0.obs;
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
        merchentShopModel = value;
        merchentShopList?.addAll(merchentShopModel?.shops ?? []);
        listLength.value=merchentShopList?.length??0;
        listLength.refresh();
        merchentShopList?.refresh();
        update();
      }
    }).onError((error, stackTrace) {
      Get.closeLoader();
      Get.showtoast(error.toString());
    });
  }

}