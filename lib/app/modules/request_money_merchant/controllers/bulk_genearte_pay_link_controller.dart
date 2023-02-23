import 'package:biapay_app/app/widgets/export_file.dart';
import 'package:dartz/dartz.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/scheduler.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../../models/bulk_dynamic_model.dart';
import '../../../models/currency_model.dart';
import '../../../models/merchant_bulk_model.dart';
import '../../../models/merchant_generate_pay.dart';
import '../../../models/merchant_raw_model.dart';
import '../../../models/merchent_shop_model.dart';

class BulkGeneratePayLinkController extends GetxController {
  String selectedShopLabel = LocaleKeys.select_shop.tr;
  RxList<MerchentShopDataModel>? merchentShopList =
      <MerchentShopDataModel>[].obs;
  MerchentShopModel? merchentShopModel;
  String? shopId = null;
  String? posShopId = null;
  RxList<MerchantPosModel>? merchentPosList = <MerchantPosModel>[].obs;
  RxList<MerchentShopDataModel>? merchentShopMethodList =
      <MerchentShopDataModel>[].obs;
  RxList currencyList = [].obs;
  RxList<CurrencyModel> activeCurrencyList = <CurrencyModel>[].obs;

  String selectedCurrencyLabel = "XAF";

  int index = 0;
  ScrollController scrollController = new ScrollController();

  RxList<CurrencyModel> currencyModelList = <CurrencyModel>[].obs;
  RxList<BulkDynamicModel> mWidgetList = <BulkDynamicModel>[].obs;

  String selectedPosLabel = LocaleKeys.select_POS.tr;

  @override
  void onInit() {
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      initAndAddDynamicList();
      hitApiToGetAllShopList();
      hitApiToGetCurrencyList();
    });
    super.onInit();
  }

  initAndAddDynamicList() {
    mWidgetList.add(BulkDynamicModel(
      amountController: TextEditingController(),
      selectedCurrnecy: "XAF",
      customerNameController: TextEditingController(),
      emailController: TextEditingController(),
      msgController: TextEditingController(),
    ));
    mWidgetList.refresh();
    update();
  }

  hitApiToGetAllShopList() async {
    Get.showLoader();
    await userProvider.allShopListApiCall().then((value) {
      Get.closeLoader();
      if (value != null) {
        merchentShopModel = value;
        merchentShopList?.addAll(merchentShopModel?.shops ?? []);
        merchentShopMethodList?.addAll(merchentShopModel?.shops ?? []);
        merchentShopList?.refresh();
        merchentShopMethodList?.refresh();
        update();
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
        currencyModelList.addAll(value);
        currencyModelList.refresh();
        update();
        filterListWithStatus();
      }
    }).onError((error, stackTrace) {
      Get.closeLoader();
      Get.showtoast(error.toString());
    });
  }

  filterListWithStatus() {
    if (currencyModelList != null && currencyModelList.value.length != 0) {
      activeCurrencyList.value =
          currencyModelList.where((e) => e.isActive == true).toList();
      activeCurrencyList.refresh();
      activeCurrencyList.forEach((element) {
        currencyList.add(element.name);
      });
      currencyList.refresh();
      update();
    }
  }

  addValidationBeforeAdded(BulkDynamicModel? bulkDynamicModel) {
    if (bulkDynamicModel?.customerNameController?.text.isEmpty == true) {
      Get.showtoast(LocaleKeys.customer_name_empty.tr);
      return false;
    } else if (bulkDynamicModel?.emailController?.text.isNotEmpty == true) {
      if (!EmailValidator.validate(
          bulkDynamicModel?.emailController?.text.toString() ?? "")) {
        Get.showtoast(LocaleKeys.email_empty_invalid.tr);
        return false;
      } else if (bulkDynamicModel?.amountController?.text.isEmpty == true) {
        Get.showtoast(LocaleKeys.amount_empty.tr);
        return;
      } else if (bulkDynamicModel?.msgController?.text.isEmpty == true) {
        Get.showtoast(LocaleKeys.msg_empty.tr);
        return false;
      }
    } else if (bulkDynamicModel?.amountController?.text.isEmpty == true) {
      Get.showtoast(LocaleKeys.amount_empty.tr);
      return false;
    } else if (bulkDynamicModel?.msgController?.text.isEmpty == true) {
      Get.showtoast(LocaleKeys.msg_empty.tr);
      return false;
    }
  }

  validateTextFields() {
    if (shopId == null) {
      Get.showtoast(LocaleKeys.select_shop.tr);
      return;
    } else if (posShopId == null) {
      Get.showtoast(LocaleKeys.select_POS.tr);
      return;
    } else if (mWidgetList.length == 1) {
      if (addValidationBeforeAdded(mWidgetList.first) == false) {
        return;
      } else {
        hidekeyboard();
        hitApiToGenerateBulkList();
      }
    }else{
      hidekeyboard();
      hitApiToGenerateBulkList();
    }
  }

  hitApiToGenerateBulkList() async {
    BulkMerchentModel bulkMerchentModel;
    Get.showLoader();
    RxList<MerchantRawModel> merchantRawList = <MerchantRawModel>[].obs;
    mWidgetList.forEach((element) {
      MerchantRawPosModel merchantPOS = MerchantRawPosModel();
      merchantPOS.id = int.parse(posShopId ?? "0");
      merchantRawList.add(MerchantRawModel(
          merchantId: box.read(Config.keys.merchantId),
          currency: element.selectedCurrnecy,
          customerName: element.customerNameController?.text,
          email: element.emailController?.text,
          amount: element.amountController?.text,
          message: element.msgController?.text,
          merchantPOS: merchantPOS));
     });
    merchantRawList;
    await userProvider.generateMerchantBulkPayLink(data: merchantRawList
    ).then((value) {
      Get.closeLoader();
      if (value != null) {
    //  bulkMerchentModel=value;
        Get.back(result: "added");
      print("check all fields");
      }
    }).onError((error, stackTrace) {
      Get.closeLoader();
      Get.showtoast(error.toString());
    });
  }


}
