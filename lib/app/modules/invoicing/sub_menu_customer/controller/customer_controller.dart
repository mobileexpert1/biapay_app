import 'package:biapay_app/app/models/customer_model.dart';
import 'package:biapay_app/app/widgets/export_file.dart';
import 'package:flutter/scheduler.dart';

class CustomerController extends GetxController {

  // ------ CUSTOMER
  RxList<CustomerModel> customerList = <CustomerModel>[].obs;

  @override
  void onInit() {
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      onLoad();
    });
    super.onInit();
  }

  onLoad() {
    getCustomerList();
  }

}

// ------------------------------------------------------------------------- CUSTOMER
extension getCustomer on CustomerController {
  getCustomerList() async {
    Get.showLoader();
    await userProvider.customerListApiCall().then((value) {
      Get.closeLoader();
      if (value != null) {
        customerList.addAll(value);
        customerList.refresh();
        update();
      }
    }).onError((error, stackTrace) {
      Get.closeLoader();
      Get.showtoast(error.toString());
    });
  }
}