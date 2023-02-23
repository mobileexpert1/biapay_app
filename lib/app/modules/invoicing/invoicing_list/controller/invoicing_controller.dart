import 'package:biapay_app/app/routes/app_pages.dart';
import 'package:biapay_app/app/widgets/export_file.dart';
import 'package:get/get.dart';

class InvoicingController extends GetxController {
  handleNavigationFormInvoicing(int selectedRow) {
    switch (selectedRow) {
      case 0:
        Get.toNamed(Routes.INVOICES);
        break;
      case 1:
        Get.toNamed(Routes.QUOTATION);
        break;
      case 2:
        Get.toNamed(Routes.CUSTOMER);
        break;
      case 3:
        Get.toNamed(Routes.PRODUCT);
        break;
      case 4:
        Get.toNamed(Routes.COUPONS);
        break;
    }
  }
}
