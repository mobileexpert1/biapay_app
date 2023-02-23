import 'package:biapay_app/app/modules/settlement/sub_menu_settlement_report/controller/settlement_report_controller.dart';
import '../../../../widgets/export_file.dart';

class SettlementReportBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SettlementReportController>(
          () => SettlementReportController(),
    );
  }
}