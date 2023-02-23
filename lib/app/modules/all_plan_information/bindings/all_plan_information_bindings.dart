import 'package:get/get.dart';

import '../controllers/all_plan_information_controller.dart';




class AllPlanInformationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AllPlanViewController>(
          () => AllPlanViewController(),
    );
  }
}
