import 'package:get/get.dart';

import '../controllers/new_ticket_controller.dart';
import '../controllers/ticket_controller.dart';

class NewTicketBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NewTicketController>(
      () => NewTicketController(),
    );
  }
}
