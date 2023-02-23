import 'package:get/get.dart';

import '../controllers/pos_shop_pie_chart_controller.dart';
import '../controllers/pos_shop_pie_chart_method_controller.dart';
import '../controllers/shop_information_controller.dart';


class ShopInformationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ShopViewController>(
          () => ShopViewController(),
    );
  }
}
