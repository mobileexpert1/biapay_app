import 'package:biapay_app/app/widgets/export_file.dart';
import 'package:flutter/scheduler.dart';

import '../../../../models/pricing_featured_model.dart';
import '../../../../models/pricing_model.dart';
import '../../../../models/providers/access_history_model.dart';

class PricingListController extends GetxController {

  // ------ PRICING
  RxList<MerchantSubscriptionList> pricingList = <MerchantSubscriptionList>[].obs;
  // ------ FEATURES
  RxList<SubscriptionPlanList> pricingFeaturedList = <SubscriptionPlanList>[].obs;

  @override
  void onInit() {
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      onLoad();
    });
    super.onInit();
  }

  onLoad() {
    getPriceSubscriptions();
    getPriceFeatured();

  }
}




// ------------------------------------------------------------------------- PRICING
extension getPricing on PricingListController {
  getPriceSubscriptions() async {
    Get.showLoader();
    await userProvider.pricingListApiCall().then((value) {
      Get.closeLoader();
      if (value != null) {
        PricingModel model = value;
        pricingList.addAll(model.merchantSubscriptionList!.toList());
        pricingList.refresh();
        update();
      }
    }).onError((error, stackTrace) {
      Get.closeLoader();
      Get.showtoast(error.toString());
    });
  }
}

// ------------------------------------------------------------------------- FEATURES
extension getFeature on PricingListController {
  getPriceFeatured() async {
    await userProvider.pricingFeaturedListApiCall().then((value) {
      Get.closeLoader();
      if (value != null) {
        PricingFeaturedModel model = value;
        pricingFeaturedList.addAll(model.subscriptionPlanList!.toList());
        pricingFeaturedList.refresh();
        update();
      }
    }).onError((error, stackTrace) {
      Get.closeLoader();
      Get.showtoast(error.toString());
    });
  }
}