import 'package:get/get.dart';

 import '../controllers/webview_controller.dart';

class WevViewBindings extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<WebViewStaticController>(
          () => WebViewStaticController(),
    );
  }
}