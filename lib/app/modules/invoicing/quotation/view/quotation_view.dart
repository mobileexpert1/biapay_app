import 'package:biapay_app/app/modules/invoicing/quotation/components/quotation_components.dart';
import 'package:biapay_app/app/modules/invoicing/quotation/controller/quotation_controller.dart';
import '../../../../widgets/export_file.dart';

class QuotationView extends GetView<QuotationController> {
  @override
  Widget build(BuildContext context) {
    return BiaScaffold(
      appBar: BiaAppBar.simple(LocaleKeys.quotation.tr, isShowFilter: true),
      body: QuotationComponent().viewHolderComponent(context, controller)
    );
  }
}