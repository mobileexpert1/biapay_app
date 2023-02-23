import 'package:biapay_app/app/modules/settlement/settlement_menu_list/components/settlement_components.dart';
import 'package:biapay_app/app/modules/settlement/settlement_menu_list/controller/settlement_controller.dart';
import '../../../../widgets/export_file.dart';

class SettlementView extends GetView<SettlementController> {
  @override
  Widget build(BuildContext context) {
    return BiaScaffold(
        appBar: BiaAppBar.simple(LocaleKeys.settlement.tr, isShowFilter: true),
        body: SettlementComponent().invoicingMenu(context)
    );
  }
}