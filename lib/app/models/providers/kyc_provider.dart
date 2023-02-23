import 'package:get/get.dart';

import '../kyc_model.dart';

class KycProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.defaultDecoder = (map) {
      if (map is Map<String, dynamic>) return Kyc.fromJson(map);
      if (map is List) return map.map((item) => Kyc.fromJson(item)).toList();
    };
    httpClient.baseUrl = 'YOUR-API-URL';
  }

  Future<Kyc?> getKyc(int id) async {
    final response = await get('kyc/$id');
    return response.body;
  }

  Future<Response<Kyc>> postKyc(Kyc kyc) async => await post('kyc', kyc);
  Future<Response> deleteKyc(int id) async => await delete('kyc/$id');
}
