import 'dart:math';

import 'package:biapay_app/app/widgets/export_file.dart';
import 'package:flutter/scheduler.dart';

import '../../../models/currency_model.dart';
import '../../../models/dashboard_amount_shop_collection.dart';
import '../../../models/dashboard_pie_chart.dart';
import '../../../models/merchent_shop_model.dart';
import '../../../models/select_model.dart';

class PosShopPieController extends GetxController {
  MerchentShopModel? merchentShopModel;
  RxList<MerchentShopDataModel>? merchentShopList = <MerchentShopDataModel>[].obs;
  RxList<MerchentShopDataModel>? merchentShopMethodList = <MerchentShopDataModel>[].obs;


  RxList<MerchantPosModel>? merchentPosList = <MerchantPosModel>[].obs;
  RxList<TimeModel> timeModelList = <TimeModel>[].obs;
  RxList<TimeModel> posTimeModelList = <TimeModel>[].obs;

  RxList<DashBoardItems>? dashBoardItemList = <DashBoardItems>[].obs;
  RxList<DashBoardItems>? dashBoardPosItemList = <DashBoardItems>[].obs;
  RxList<CurrencyModel> currencyModelList = <CurrencyModel>[].obs;
  RxList currencyPosList = [].obs;
  RxList currencyList = [].obs;
  RxList<CurrencyModel> activeCurrencyList = <CurrencyModel>[].obs;

  String selectedCurrencyLabel = "XAF";
  String selectedCurrencyPosLabel = "XAF";
  String amountPerShop = LocaleKeys.select_shop_to_view_pos_cat.tr;
  String amountPerPos = LocaleKeys.select_pos_to_view.tr;

  String selectedShopLabel = LocaleKeys.select_shop.tr;
  String selectPosShopLabel = LocaleKeys.select_shop.tr;
  String selectedPosLabel = LocaleKeys.select_POS.tr;

  var shopId = null;
  var secShopId = null;
  var posShopId = null;

  RxMap<String, double> paymentCategoryMap = <String, double>{}.obs;
  RxMap<String, double> paymentMethodMap = <String, double>{}.obs;
  RxList<Color> colorList = <Color>[].obs;
  RxList<Color> catefgoryColorList = <Color>[].obs;

  RxList<DashBoardPieDataModel>? dashboardMethodList =
      <DashBoardPieDataModel>[].obs;
  RxList<DashBoardPieDataModel>? dashboardMethodPosList =
      <DashBoardPieDataModel>[].obs;

  DashBoardPieModel? dashBoardCategoryModel;

  @override
  void onInit() {
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      initTimeModel();
      initPosTimeModel();
      hitApiToGetAllShopList();
      hitApiToGetCurrencyList();
    });
    super.onInit();
  }

  initTimeModel() {
    timeModelList.add(
        TimeModel(title: LocaleKeys.today_option.tr, isSeleced: false, id: 1));
    timeModelList.add(TimeModel(
        title: LocaleKeys.this_week_option.tr, isSeleced: false, id: 2));
    timeModelList.add(
        TimeModel(title: LocaleKeys.seven_option.tr, isSeleced: false, id: 3));
    timeModelList.add(TimeModel(
        title: LocaleKeys.this_month_option.tr, isSeleced: false, id: 4));
    timeModelList.add(TimeModel(
        title: LocaleKeys.last_month_option.tr, isSeleced: false, id: 5));
    timeModelList.refresh();
    update();
  }

  initPosTimeModel() {
    posTimeModelList.add(
        TimeModel(title: LocaleKeys.today_option.tr, isSeleced: false, id: 1));
    posTimeModelList.add(TimeModel(
        title: LocaleKeys.this_week_option.tr, isSeleced: false, id: 2));
    posTimeModelList.add(
        TimeModel(title: LocaleKeys.seven_option.tr, isSeleced: false, id: 3));
    posTimeModelList.add(TimeModel(
        title: LocaleKeys.this_month_option.tr, isSeleced: false, id: 4));
    posTimeModelList.add(TimeModel(
        title: LocaleKeys.last_month_option.tr, isSeleced: false, id: 5));
    posTimeModelList.refresh();
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

  filterListWithStatus() {
    if (currencyModelList != null && currencyModelList?.value!.length != 0) {
      activeCurrencyList.value =
          currencyModelList.where((e) => e.isActive == true).toList();
      activeCurrencyList.refresh();
      activeCurrencyList?.forEach((element) {
        currencyList?.add(element?.name);
      });
      currencyPosList.clear();
      currencyPosList.addAll(currencyList);
      currencyPosList.refresh();
      currencyList.refresh();
      update();
    }
  }


  filterDataBasedOnPosCurrency() {
    dashBoardPosItemList?.forEach((element) {
      if (element.currency?.toString().toLowerCase() ==
          selectedCurrencyPosLabel.toString().toLowerCase()) {
        amountPerPos = element.total?.toString() ?? "";
        update();
        print("check amount per shop ${amountPerPos}");
        return;
      } else {
        amountPerPos = LocaleKeys.no_data_found.tr;
      }
    });
    print("check amount per shop outside${amountPerPos}");
  }

  /*---------this api used for only showing amount based on payment category*/
  hitApiToGetShopPerPaymentCategory({timeUrl}) async {
    dashboardMethodPosList?.clear();
    Get.showLoader();
    await userProvider.getDashboardPieChartOnShop(url: timeUrl).then((value) {
      Get.closeLoader();
      if (value != null) {
        dashBoardCategoryModel = value;
        colorList.clear();
        paymentCategoryMap = <String, double>{}.obs;
        dashboardMethodPosList?.addAll(dashBoardCategoryModel?.dashBoardItems ?? []);
        if (dashboardMethodPosList?.length != 0) {
          filterBaseOnCategory(dashBoardCategoryModel);
        } else {
          amountPerShop = LocaleKeys.no_data_found.tr;
        }
        dashboardMethodPosList?.refresh();
        update();
      }
    }).onError((error, stackTrace) {
      Get.closeLoader();
      Get.showtoast(error.toString());
    });
  }

  filterBaseOnCategory(DashBoardPieModel? dashBoardPieModel) {
    catefgoryColorList.clear();
    paymentCategoryMap.value = {};
    dashBoardPieModel?.dashBoardItems?.forEach((element) {
      if (element.currency?.toLowerCase() == selectedCurrencyPosLabel.toString().toLowerCase()) {
        if (element.dashBoardItemValues?.length != 0) {
          element.dashBoardItemValues?.forEach((innerElement) {
            paymentCategoryMap.addAll(
                {innerElement.keyName ?? "": innerElement.totalValue ?? 0.0});
            catefgoryColorList.add(
                Colors.primaries[Random().nextInt(Colors.primaries.length)]);
            amountPerShop = "changed";
          });
        } else {
          amountPerShop = "changed";
        }
      } else {
        amountPerShop = "changed";
      }
    });

    if (paymentCategoryMap.isEmpty == true &&  amountPerShop != LocaleKeys.select_shop_to_view_pos_cat.tr) {
      amountPerShop = LocaleKeys.no_data_found.tr;
    }

    paymentCategoryMap.refresh();
    catefgoryColorList.refresh();
    update();
  }
}
