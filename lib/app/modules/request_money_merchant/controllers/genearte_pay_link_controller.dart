import 'package:biapay_app/app/widgets/export_file.dart';
import 'package:dartz/dartz.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/scheduler.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../../models/currency_model.dart';
import '../../../models/merchant_generate_pay.dart';
import '../../../models/merchant_raw_model.dart';
import '../../../models/merchent_shop_model.dart';

class GeneratePayLinkController extends GetxController {
  RxList<MerchentShopDataModel>? merchentShopList =
      <MerchentShopDataModel>[].obs;
  MerchentShopModel? merchentShopModel;
  RxList<MerchentShopDataModel>? merchentShopMethodList =
      <MerchentShopDataModel>[].obs;
  String selectedShopLabel = LocaleKeys.select_shop.tr;
  String selectedPosShopLabel = LocaleKeys.select_a_pos.tr;

  RxList<MerchantPosModel>? merchentPosList = <MerchantPosModel>[].obs;
  String selectedPosLabel = LocaleKeys.select_POS.tr;

  var mobileController = TextEditingController();
  var emailController = TextEditingController();
  var amountController = TextEditingController();
  var msgController = TextEditingController();
  var customerNameController = TextEditingController();
  final completPhnNumber = "".obs;
  String? shopId = null;
  String? posShopId = null;

  RxList currencyList = [].obs;
  RxList<CurrencyModel> activeCurrencyList = <CurrencyModel>[].obs;

  String selectedCurrencyLabel = "XAF";
  String? statusSelectionLabel = LocaleKeys.select_status.tr;
  RxList statusList =
      [LocaleKeys.active_status.tr, LocaleKeys.cancelled_status.tr].obs;
  String? countryDialCode = "";
  String? countryCode = "";

  RxList<CurrencyModel> currencyModelList = <CurrencyModel>[].obs;

  final formKey = GlobalKey<FormState>();
  GeneratePayLinkDataModel? generatePayLinkDataModel;
  GeneratePayLinkDataModel? dataModel;

  @override
  void onInit() {
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      getArguments();
      hitApiToGetAllShopList();
      hitApiToGetCurrencyList();
    });
    super.onInit();
  }

  getArguments() {
    if (Get.arguments != null) {
      generatePayLinkDataModel = Get.arguments;
      if (generatePayLinkDataModel != null) {
        Map<String, dynamic> numberSplit = getCountryNameBycode(
            phnNumber: generatePayLinkDataModel?.mobileNumber ?? "");
        if (numberSplit.isNotEmpty == true) {
          completPhnNumber.value = numberSplit['newPhoneNumber'];
          mobileController.text = numberSplit['newPhoneNumber']!;
          update();
        }
        selectedShopLabel = generatePayLinkDataModel?.merchantName ?? "";
        shopId = generatePayLinkDataModel?.merchantPOS?.shopId?.toString();
        posShopId = generatePayLinkDataModel?.merchantPOS?.id?.toString();
        selectedPosLabel = generatePayLinkDataModel?.merchantPOS?.name ?? "";
        customerNameController.text =
            generatePayLinkDataModel?.customerName ?? "";
        emailController.text = generatePayLinkDataModel?.email ?? "";
        amountController.text =
            generatePayLinkDataModel?.amount?.toString() ?? "";
        msgController.text =
            generatePayLinkDataModel?.message?.toString() ?? "";
        if (generatePayLinkDataModel?.currency?.isEmpty == true ||
            generatePayLinkDataModel?.currency == null) {
          selectedCurrencyLabel = "XAF";
        } else {
          selectedCurrencyLabel = generatePayLinkDataModel?.currency ?? "";
        }

        if (generatePayLinkDataModel?.status?.isEmpty == true ||
            generatePayLinkDataModel?.status == null) {
          statusSelectionLabel = LocaleKeys.select_status.tr;
        } else {
          statusSelectionLabel = generatePayLinkDataModel?.status;
        }
      }
    }

    update();
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

  validateTextFields() {
    if (shopId == null) {
      Get.showtoast(LocaleKeys.select_shop.tr);
      return;
    } else if (posShopId == null) {
      Get.showtoast(LocaleKeys.select_POS.tr);
      return;
    } else if (customerNameController.text.isEmpty == true) {
      Get.showtoast(LocaleKeys.customer_name_empty.tr);
      return;
    } else if (mobileController.text.isEmpty == true) {
      Get.showtoast(LocaleKeys.phn_number_empty.tr);
      return;
    } else if (formKey.currentState?.validate() == false) {
      Get.showtoast(LocaleKeys.err_valid_pho.tr);
      return;
    } else if (emailController.text.isNotEmpty == true) {
      if (!EmailValidator.validate(emailController.text.toString() ?? "")) {
        Get.showtoast(LocaleKeys.email_empty_invalid.tr);
        return;
      } else if (amountController.text.isEmpty == true) {
        Get.showtoast(LocaleKeys.amount_empty.tr);
        return;
      } else if (msgController.text.isEmpty == true) {
        Get.showtoast(LocaleKeys.msg_empty.tr);
        return;
      } else if (generatePayLinkDataModel != null &&
          statusSelectionLabel == LocaleKeys.select_status.tr) {
        Get.showtoast(LocaleKeys.select_status.tr);
        return;
      } else {
        hidekeyboard();
        hitApiToGenerateLink();
      }
    } else if (amountController.text.isEmpty == true) {
      Get.showtoast(LocaleKeys.amount_empty.tr);
      return;
    } else if (msgController.text.isEmpty == true) {
      Get.showtoast(LocaleKeys.msg_empty.tr);
      return;
    } else if (generatePayLinkDataModel != null &&
        statusSelectionLabel == LocaleKeys.select_status.tr) {
      Get.showtoast(LocaleKeys.select_status.tr);
      return;
    } else {
      hidekeyboard();
      hitApiToGenerateLink();
    }
  }

  hitApiToGenerateLink() async {
    Get.showLoader();
    MerchantRawModel merchantRawModel = MerchantRawModel();
    if (generatePayLinkDataModel != null) {
      merchantRawModel.id = generatePayLinkDataModel?.id;
      merchantRawModel.uuid = generatePayLinkDataModel?.uuid;
      merchantRawModel.createdDate = generatePayLinkDataModel?.createdDate;
      merchantRawModel.status = statusSelectionLabel;
    }
    merchantRawModel.merchantId = box.read(Config.keys.merchantId);
    MerchantRawPosModel merchantPOS = MerchantRawPosModel();
    merchantPOS.id = int.parse(posShopId ?? "0");
    merchantRawModel.merchantPOS = merchantPOS;
    merchantRawModel.customerName = customerNameController.text.trim();
    merchantRawModel.mobileNumber = completPhnNumber.value;
    merchantRawModel.email = emailController.text;
    merchantRawModel.amount = double.parse(amountController.text.trim());
    merchantRawModel.currency = selectedCurrencyLabel;
    merchantRawModel.message = msgController.text.trim();
    await userProvider
        .generateMerchantPayLink(
            data: merchantRawModel,
            isAdded: generatePayLinkDataModel == null ? true : false)
        .then((value) {
      Get.closeLoader();
      if (value != null) {
        dataModel = value;
        if (generatePayLinkDataModel != null) {
          Get.showtoast(LocaleKeys.paylink_updated_sucessfuly.tr);
        } else {
          Get.showtoast(LocaleKeys.paylink_created_sucessfuly.tr);
        }
        Get.back(result: dataModel);
      }
    }).onError((error, stackTrace) {
      Get.closeLoader();
      Get.showtoast(error.toString());
    });
  }
}
