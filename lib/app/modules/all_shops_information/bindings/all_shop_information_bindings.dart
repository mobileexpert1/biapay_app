import 'package:get/get.dart';

import '../controllers/all_shop_information_controller.dart';



class AllShopInformationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AllShopViewController>(
          () => AllShopViewController(),
    );
  }
}
