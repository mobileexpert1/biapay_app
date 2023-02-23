import 'package:biapay_app/app/modules/invoicing/quotation/controller/quotation_controller.dart';
import '../../../../widgets/export_file.dart';

class QuotationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<QuotationController>(
          () => QuotationController(),
    );
  }
}