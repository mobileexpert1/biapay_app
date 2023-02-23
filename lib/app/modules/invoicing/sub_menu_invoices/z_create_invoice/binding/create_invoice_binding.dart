import 'package:biapay_app/app/modules/invoicing/sub_menu_invoices/z_create_invoice/controller/create_invoice_controller.dart';
import '../../../../../widgets/export_file.dart';

class CreateInvoiceBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CreateInvoiceController>(
          () => CreateInvoiceController(),
    );
  }
}