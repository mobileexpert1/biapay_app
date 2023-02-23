import 'package:biapay_app/app/modules/settlement/sub_menu_settlement_report/z_settlement_detail/components/settlement_detail_component.dart';
import 'package:biapay_app/app/modules/settlement/sub_menu_settlement_report/z_settlement_detail/controller/settlement_report_detail_controller.dart';
import '../../../../../widgets/export_file.dart';

class SettlementReportDetailView extends GetView<SettlementReportDetailController> {

  @override
  Widget build(BuildContext context) {
    return BiaScaffold(
        appBar: BiaAppBar.simple(LocaleKeys.settlement.tr, isShowFilter: true),
        body: SettlementDetailComponent().detailView()
    );
  }


}
