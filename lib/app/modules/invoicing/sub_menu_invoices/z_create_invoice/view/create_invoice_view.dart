import 'package:biapay_app/app/modules/invoicing/sub_menu_invoices/z_create_invoice/components/create_invoice_components.dart';
import 'package:biapay_app/app/modules/invoicing/sub_menu_invoices/z_create_invoice/controller/create_invoice_controller.dart';
import '../../../../../widgets/export_file.dart';

class CreateInvoiceView extends GetView<CreateInvoiceController> {
  @override
  Widget build(BuildContext context) {
    return BiaScaffold(
      appBar: BiaAppBar.simple(LocaleKeys.create_an_invoice.tr, isShowFilter: true),
      body: Container(
        padding: EdgeInsets.only(top: 20.h),
        child: CreateInvoiceComponent().viewHolder(controller, context)
      ),
    );
  }
}
