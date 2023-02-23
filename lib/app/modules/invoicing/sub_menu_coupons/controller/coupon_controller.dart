import 'package:biapay_app/app/models/coupon_model.dart';
import 'package:biapay_app/app/widgets/export_file.dart';
import 'package:flutter/scheduler.dart';

class CouponsController extends GetxController {

  // ------ COUPON
  RxList<CouponModel> couponList = <CouponModel>[].obs;

  @override
  void onInit() {
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
     onLoad();
    });
    super.onInit();
  }

  onLoad() {
    Get.showLoader();
    getCouponList();
  }

}

// ------------------------------------------------------------------------- COUPON
extension getCoupon on CouponsController {
  getCouponList() async {
    await userProvider.couponListApiCall().then((value) {
      Get.closeLoader();
      if (value != null) {
        couponList.addAll(value);
        couponList.refresh();
        update();
      }
    }).onError((error, stackTrace) {
      Get.closeLoader();
      Get.showtoast(error.toString());
    });
  }
}