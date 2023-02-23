import 'package:get/get.dart';

class TransfertController extends GetxController {
  //TODO: Implement TransfertController

  final count = 0.obs;
  @override
  void onInit() {
    print("Getx controller transfer");
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}
