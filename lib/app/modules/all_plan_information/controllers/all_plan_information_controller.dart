import 'package:biapay_app/app/widgets/export_file.dart';
import 'package:flutter/scheduler.dart';

import '../../../models/merchent_subscription_model.dart';


class AllPlanViewController extends GetxController{

  MerchentSubscriptionModel? merchentSubscriptionModel;
  RxList<MerchantSubscriptionDataModel>? merchantSubscriptionList=<MerchantSubscriptionDataModel>[].obs;
  RxInt listLength=0.obs;
  @override
  void onInit() {
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {

      hitApiToGetAllSubscriptionList();

    });
    // TODO: implement onInit
    super.onInit();
  }



  hitApiToGetAllSubscriptionList() async {
    Get.showLoader();
    await userProvider.getAllSubscriptionInformation().then((value) {
      Get.closeLoader();
      if (value != null) {
        merchentSubscriptionModel = value;
        merchantSubscriptionList?.addAll(merchentSubscriptionModel?.merchantSubscriptionList ?? []);
        listLength.value=merchantSubscriptionList?.length??0;
        listLength.refresh();
        merchantSubscriptionList?.refresh();
        print("check subscription list length ${merchantSubscriptionList?.length}");
        update();
      }
    }).onError((error, stackTrace) {
      Get.closeLoader();
      Get.showtoast(error.toString());
    });
  }
}