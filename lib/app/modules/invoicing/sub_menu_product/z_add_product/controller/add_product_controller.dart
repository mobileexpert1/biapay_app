import 'dart:io';

import 'package:flutter/scheduler.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../../models/currency_model.dart';
import '../../../../../widgets/export_file.dart';

class AddProductController extends GetxController {
  // ------ CURRENCY
  RxList<CurrencyModel> currencyList = <CurrencyModel>[].obs;
  RxList currencyElementList = [].obs;
  int currencyId = 0;
  Map<String, dynamic> fields = {};

  final image = Rx<File?>(null);

  final name = TextEditingController();
  final currency = TextEditingController();
  final tax = TextEditingController();
  final description = TextEditingController();
  final salesPrice = TextEditingController();
  final purchasePrice = TextEditingController();
  final category = TextEditingController();
  bool isListed = false;

  @override
  void onInit() {
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      onLoad();
    });
    super.onInit();
  }

  onLoad() {
    getCurrencies();
  }

  setFieldsMap() {
/*
{"name":"product12","description":"des","tax":12,"isTaxPercentage":true,
"salePrice":123,"purchasePrice":111,"category":"asw","currencyId":19,"merchantId":195,"isListedInStore":true}
 */
    fields["name"] = name.text;
    fields["description"] = description.text;
    fields["tax"] = tax.text;
    fields["isTaxPercentage"] = true;
    fields["salePrice"] = salesPrice.text;
    fields["purchasePrice"] = purchasePrice.text;
    fields["category"] = category.text;
    fields["currencyId"] = currencyId;
    fields["merchantId"] = 195; // merchantId from GetUserProfile
    fields["isListedInStore"] = isListed;
    update();
    print("-*-*-*-*-*-*- params : " + fields.toString());

    createProductApi();
  }

  createProductApi() async {
    hidekeyboard();
    Get.showLoader();
    await userProvider.createProduct(data: fields).then((value) {
      Get.closeLoader();
      if (value != null) {
        print("product created ------>> ");
        print(value.toString());
        Get.back(result: "returned");
      }
    }).onError((error, stackTrace) {
      print("product error ------>> ");
      Get.closeLoader();
      Get.showtoast(error.toString());
    });
  }

  void pickImage() {
    ImagePicker().pickImage(source: ImageSource.gallery).then((value) {
      if (value != null) {
        image(File(value.path));
      }
    });
  }

  void captureImage() {
    ImagePicker().pickImage(source: ImageSource.camera).then((value) {
      if (value != null) {
        image(File(value.path));
      }
    });
  }
}

// ------------------------------------------------------------------------- CURRENCY
extension getCurrency on AddProductController {
  getCurrencies() async {
    Get.showLoader();
    await userProvider.currencyListApiCall().then((value) {
      if (value != null) {
        currencyList.addAll(value);
        currencyList.refresh();
        update();
        filterListWithStatus();
      }
    }).onError((error, stackTrace) {
      Get.closeLoader();
      Get.showtoast(error.toString());
    });
  }

  filterListWithStatus() {
    if (currencyList.value.length != 0) {
      currencyList.value = currencyList.where((e) => e.isActive == true).toList();
      currencyList.refresh();
      currencyList.forEach((element) {
        currencyElementList.add(element.name);
      });
      currencyList.refresh();
      update();
    }
  }

  getCurrencyId(String currency) {
    for (var i = 0; i < currencyList.length; i++) {
      if (currencyList[i].name == currency) {
        currencyId = currencyList[i].id!;
      }
    }
    print("currency ID-----------> " + currencyId.toString());
    update();
  }
}
