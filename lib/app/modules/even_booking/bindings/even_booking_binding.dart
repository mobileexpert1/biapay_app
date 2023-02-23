import 'package:get/get.dart';

import '../controllers/even_booking_controller.dart';

class EvenBookingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EvenBookingController>(
      () => EvenBookingController(),
    );
  }
}
