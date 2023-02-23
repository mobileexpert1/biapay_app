import 'package:get/get.dart';

import '../controllers/pos_shop_pie_chart_controller.dart';
import '../controllers/pos_shop_pie_chart_method_controller.dart';


class PosShopPieChartMethodBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PosShopPieMethodController>(
          () => PosShopPieMethodController(),
    );
  }
}
