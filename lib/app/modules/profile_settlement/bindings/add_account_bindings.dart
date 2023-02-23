import 'package:get/get.dart';

import '../controllers/add_account_controller.dart';



class AddAccountBindings extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<AddAccountController>(
          () => AddAccountController(),
    );
  }
}