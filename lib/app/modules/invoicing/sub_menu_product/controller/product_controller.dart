import 'package:biapay_app/app/widgets/export_file.dart';
import 'package:flutter/scheduler.dart';

import '../../../../models/product_model.dart';

class ProductController extends GetxController {

  // ------ PRODUCT
  RxList<ProductModel> productList = <ProductModel>[].obs;

  @override
  void onInit() {
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      onLoad();
    });
    super.onInit();
  }

  onLoad() {
    getProductList();
  }
}

// ------------------------------------------------------------------------- PRODUCT
extension getProduct on ProductController {
  getProductList() async {
    Get.showLoader();
    await userProvider.productListApiCall().then((value) {
      Get.closeLoader();
      if (value != null) {
        productList.addAll(value);
        productList.refresh();
        update();
      }
    }).onError((error, stackTrace) {
      Get.closeLoader();
      Get.showtoast(error.toString());
    });
  }
}