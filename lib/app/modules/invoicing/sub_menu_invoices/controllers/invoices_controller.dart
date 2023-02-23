import 'package:biapay_app/app/models/invoice_model.dart';
import 'package:biapay_app/app/widgets/export_file.dart';
import 'package:flutter/scheduler.dart';

class InvoicesController extends GetxController {

  // ------ INVOICES
  RxList<InvoiceModel> invoiceList = <InvoiceModel>[].obs;

  @override
  void onInit() {
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      onLoad();
    });
    super.onInit();
  }

  onLoad() {
    Get.showLoader();
    getInvoices();
  }

}

// ------------------------------------------------------------------------- CURRENCY
extension getInvoiceList on InvoicesController {
  getInvoices() async {
    await userProvider.invoiceListApiCall().then((value) {
      Get.closeLoader();
      if (value != null) {
        invoiceList.addAll(value);
        invoiceList.refresh();
        update();
      }
    }).onError((error, stackTrace) {
      Get.closeLoader();
      Get.showtoast(error.toString());
    });
  }

}