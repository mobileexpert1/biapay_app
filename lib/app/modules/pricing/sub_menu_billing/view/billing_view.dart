import 'package:biapay_app/app/modules/pricing/sub_menu_billing/component/billing_components.dart';
import 'package:biapay_app/app/modules/pricing/sub_menu_billing/controller/billing_controller.dart';
import '../../../../widgets/export_file.dart';

class BillingView extends GetView<BillingController> {
  @override
  Widget build(BuildContext context) {
    return BiaScaffold(
        appBar: BiaAppBar.simple(LocaleKeys.billing.tr, isShowFilter: true),
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: BillingComponents().billingViewList(context)
        ));
  }
}
