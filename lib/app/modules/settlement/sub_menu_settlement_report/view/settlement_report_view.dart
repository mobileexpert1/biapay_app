import 'package:biapay_app/app/modules/settlement/sub_menu_settlement_report/components/settlement_report_components.dart';
import 'package:biapay_app/app/modules/settlement/sub_menu_settlement_report/controller/settlement_report_controller.dart';
import '../../../../widgets/export_file.dart';

class SettlementReportView extends GetView<SettlementReportController> {

  @override
  Widget build(BuildContext context) {
    return BiaScaffold(
        appBar: BiaAppBar.simple(LocaleKeys.settlement.tr, isShowFilter: true),
        body: SettlementReportComponents().reportDetailView(controller)
    );
  }

}
