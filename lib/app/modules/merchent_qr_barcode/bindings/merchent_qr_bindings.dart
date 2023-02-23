import 'package:get/get.dart';

import '../controllers/merchent_qr_controller.dart';



class MerchentQrBindings extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<MerchentQrController>(
          () => MerchentQrController(),
    );
  }
}