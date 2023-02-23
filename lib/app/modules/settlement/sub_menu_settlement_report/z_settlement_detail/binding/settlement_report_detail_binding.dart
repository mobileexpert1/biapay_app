import 'package:biapay_app/app/modules/settlement/sub_menu_settlement_report/z_settlement_detail/controller/settlement_report_detail_controller.dart';
import '../../../../../widgets/export_file.dart';


class SettlementReportDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SettlementReportDetailController>(
          () => SettlementReportDetailController(),
    );
  }
}