import 'package:get/get.dart';

import '../controllers/background_images_controller.dart';

class BackgroundImagesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BackgroundImagesController>(
      () => BackgroundImagesController(),
    );
  }
}
