import 'package:get/get.dart';

import '../chart_data_model.dart';

class ChartDataProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.defaultDecoder = (map) {
      if (map is Map<String, dynamic>) return ChartData.fromJson(map);
      if (map is List)
        return map.map((item) => ChartData.fromJson(item)).toList();
    };
    httpClient.baseUrl = 'YOUR-API-URL';
  }

  Future<ChartData?> getChartData(int id) async {
    final response = await get('chartdata/$id');
    return response.body;
  }

  Future<Response<ChartData>> postChartData(ChartData chartdata) async =>
      await post('chartdata', chartdata);
  Future<Response> deleteChartData(int id) async =>
      await delete('chartdata/$id');
}
