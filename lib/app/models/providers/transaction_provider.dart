import 'package:biapay_app/app/models/chart_data_model.dart';
import 'package:biapay_app/app/models/providers/base_provider.dart';

class TransactionProvider extends BaseProvider {
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  Future<ChartData> chartDataDashboard({
    String? fromDate,
    String? toDate,
  }) =>
      dio
          .get("merchant/dashboard/chartData",
              queryParameters: {
                "fromDate": fromDate,
                "toDate": toDate,
              }..removeWhere((key, value) => value == null))
          .then((response) =>
              ChartData.fromJson(response.data['merchantChartDTO']));
}
