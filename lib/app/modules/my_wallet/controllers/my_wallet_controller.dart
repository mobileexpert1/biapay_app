import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class MyWalletController extends GetxController {
  //TODO: Implement MyWalletController

  final page = 0.obs;
  final pageAdd = 0.obs;
  final currency = TextEditingController();
  final cardTypeController = TextEditingController();
  final addPageController = PageController();
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  void onChanged(int value) {
    page(value);
  }

  void onChangedAdd(int value) {
    addPageController.jumpToPage(value);
    pageAdd(value);
  }

  void onSelected(value) {}

  void onSelectedCardType(value) {}

  void onChangedSaveCardStatus(bool value) {}
}
