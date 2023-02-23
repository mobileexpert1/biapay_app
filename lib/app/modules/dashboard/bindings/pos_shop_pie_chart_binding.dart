import 'package:get/get.dart';

import '../controllers/pos_shop_pie_chart_controller.dart';


class PosShopPieChartBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PosShopPieController>(
          () => PosShopPieController(),
    );
  }
}
