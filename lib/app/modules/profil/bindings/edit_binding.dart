import 'package:get/get.dart';

import '../controllers/edit_profile_controller.dart';
import '../controllers/profil_controller.dart';

class EditProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EditController>(
      () => EditController(),
    );
  }
}
