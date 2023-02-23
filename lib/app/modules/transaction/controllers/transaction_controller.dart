import 'package:flutter/scheduler.dart';
import 'package:get/get.dart';

import '../../../models/currency_model.dart';
import '../../../widgets/export_file.dart';

class TransactionController extends GetxController {
  //TODO: Implement TransactionController

  var fromController=TextEditingController();
  var toController=TextEditingController();
  var currencyController=TextEditingController();
  var selectStatusController=TextEditingController();

  List statusDollerList=[LocaleKeys.all.tr,LocaleKeys.status_initated.tr,LocaleKeys.status_failed.tr,LocaleKeys.status_settled.tr];

  final count = 0.obs;
  RxBool loading=false.obs;
  RxList<CurrencyModel> currencyModelList=<CurrencyModel>[].obs;
  RxList currencyList=[].obs;
  RxList<CurrencyModel> activeCurrencyList=<CurrencyModel>[].obs;

  @override
  void onInit() {
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      hitApiToGetCurrencyList();

    });
    super.onInit();
  }

  validateAllFields(){
    if(isEmptyFiedds(fromController.text)==true){
      Get.showtoast(LocaleKeys.select_from_date.tr);
      return;
    }else if(isEmptyFiedds(toController.text)==true){
      Get.showtoast(LocaleKeys.select_to_date.tr);
      return;
    }else if(isEmptyFiedds(currencyController.text)==true){
      Get.showtoast(LocaleKeys.select_currency_type.tr);
      return;
    }else if(isEmptyFiedds(selectStatusController.text)==true){
      Get.showtoast(LocaleKeys.select_status_type.tr);
      return;
    }else{
      hitApiToGetTransationList();
    }
  }


  hitApiToGetTransationList() async {
    Get.showLoader();
    await userProvider.getTransactionListApiCal(currency: "XAF",
    fromDate: fromController.text,toDate: toController.text
    ).then((value) {
      Get.closeLoader();
      if (value != null) {

      }
    }).onError((error, stackTrace) {
      Get.closeLoader();
      Get.showtoast(error.toString());
    });
  }



  hitApiToGetCurrencyList() async {
    Get.showLoader();
    await userProvider.currencyListApiCall().then((value) {
      Get.closeLoader();
      if (value != null) {
        currencyModelList?.addAll(value);
        currencyModelList.refresh();
        update();
        filterListWithStatus();




      }
    }).onError((error, stackTrace) {
      Get.closeLoader();
      Get.showtoast(error.toString());
    });
  }

  filterListWithStatus(){
    if(currencyModelList!=null&&currencyModelList?.value!.length!=0){
      activeCurrencyList.value = currencyModelList.where((e) => e.isActive== true).toList();
      activeCurrencyList.refresh();
      activeCurrencyList?.forEach((element) {
        currencyList?.add(element?.name);
      });
      currencyList.refresh();
      update();
    }

  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}
