import 'package:biapay_app/app/routes/app_pages.dart';
import 'package:biapay_app/app/widgets/export_file.dart';
import 'package:get/get.dart';

class SettlementController extends GetxController {
  handleNavigationFormInvoicing(int selectedRow) {
    switch (selectedRow) {
      case 0:
        // Get.toNamed(Routes.SETTLEMENTREPORT);
        break;
      case 1:
        Get.toNamed(Routes.SETTLEMENTREPORT);
        break;
    }
  }
}