import 'package:get/get.dart';

import '../controllers/profile_settlement_controller.dart';


class ProfileSettlementBindings extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<ProfileSettlementController>(
          () => ProfileSettlementController(),
    );
  }
}