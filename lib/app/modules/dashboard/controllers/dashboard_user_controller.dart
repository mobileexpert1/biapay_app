import 'dart:developer';
import 'dart:math';

import 'package:flutter/scheduler.dart';

import '../../../models/currency_model.dart';
import '../../../models/dashboard_amount_shop_collection.dart';
import '../../../models/dashboard_pie_chart.dart';
import '../../../models/merchant_summary_model.dart';
import '../../../models/merchent_shop_model.dart';
import '../../../models/providers/dio_exceptions.dart';
import '../../../models/providers/transaction_provider.dart';
import '../../../models/providers/user_summary_model.dart';
import '../../../models/select_model.dart';
import '../../../models/summary_dummy_model.dart';
import '../../../widgets/export_file.dart';

class DashboardUserController extends GetxController {
  final period = TextEditingController();
  final currency = TextEditingController();
  final _transactionProvider = TransactionProvider();
  var currencyController = TextEditingController();

  RxList<UserDashBoardSummaryModel> usersummaryList = <UserDashBoardSummaryModel>[].obs;

// UserSummaryDataModel? usersummaryList;
  RxList currencyList = [].obs;
  // RxList usersummaryList = [].obs;
  RxList transactionList = [].obs;
  // RxList usersummaryList= [].obs;
  RxList<TimeModel> timeModelList = <TimeModel>[].obs;
  RxList<TimeModel> posTimeModelList = <TimeModel>[].obs;
  String selectedShopLabel = LocaleKeys.select_shop.tr;
  String selectPosShopLabel = LocaleKeys.select_shop.tr;
  String selectedPosLabel = LocaleKeys.select_POS.tr;
  String selectedCurrencyLabel = "XAF";
  String selectedCurrencyPosLabel = "XAF";
  String amountPerShop = LocaleKeys.select_shop_to_view_per.tr;
  String amountPerPos = LocaleKeys.select_shop_to_view_per_cate.tr;
  RxList<DashBoardItemValues>? dashBoardItemList = <DashBoardItemValues>[].obs;

  MerchentShopModel? merchentShopModel;
  UserDashBoardSummaryModel? userModel;
  RxList currencyPosList = [].obs;
  RxList<CurrencyModel> currencyModelList = <CurrencyModel>[].obs;
  RxList<DashBoardPieDataModel>? dashboardMethodList =
      <DashBoardPieDataModel>[].obs;
  RxList<DashBoardPieDataModel>? dashboardMethodPosList =
      <DashBoardPieDataModel>[].obs;

  RxList<CurrencyModel> activeCurrencyList = <CurrencyModel>[].obs;
  var shopId = null;
  var secShopId = null;
  var posShopId = null;
  RxMap<String, double> paymentCategoryMap = <String, double>{}.obs;
  RxMap<String, double> paymentMethodMap = <String, double>{}.obs;

  RxList<Color> colorList = <Color>[].obs;
  RxList<Color> catefgoryColorList = <Color>[].obs;
  DashBoardPieModel? dashBoardCategoryModel;
  DashBoardPieModel? dashBoardMethodModel;
  RxList<MerchentShopDataModel>? merchentShopList =
      <MerchentShopDataModel>[].obs;
  RxList<MerchantPosModel>? merchentPosList = <MerchantPosModel>[].obs;
  

  @override
  void onInit() {
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      hitApiToGetUserDashboardSummary();
    });

    super.onInit();
    // _transactionProvider.onInit();
    // getChartData();
  }



  hitApiToGetAllShopList() async {
    Get.showLoader();
    await userProvider.allShopListApiCall().then((value) {
      Get.closeLoader();
      if (value != null) {
        merchentShopModel = value;
        merchentShopList?.addAll(merchentShopModel?.shops ?? []);
        merchentShopList?.refresh();
        update();
      }
    }).onError((error, stackTrace) {
      Get.closeLoader();
      Get.showtoast(error.toString());
    });
  }

  hitApiToGetTransationList() async {
    Get.showLoader();
    await userProvider
        .getTransactionListApiCal(
            currency: "XAF", fromDate: 2022 / 11 / 12, toDate: 2022 / 12 / 12)
        .then((value) {
      Get.closeLoader();
      if (value != null) {}
    }).onError((error, stackTrace) {
      Get.closeLoader();
      Get.showtoast(error.toString());
    });
    update();
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

  //
  // hitApiToGetAllShopList() async {
  //   Get.showLoader();
  //   await userProvider.allShopListApiCall().then((value) {
  //     Get.closeLoader();
  //     if (value != null) {
  //       merchentShopModel = value;
  //       merchentShopList?.addAll(merchentShopModel?.shops ?? []);
  //       merchentShopList?.refresh();
  //       update();
  //     }
  //   }).onError((error, stackTrace) {
  //     Get.closeLoader();
  //     Get.showtoast(error.toString());
  //   });
  // }





  hitApiToGetUserDashboardSummary() async {
    Get.showLoader();
    await userProvider.getUserDashBoardSummaryApi().then((value) {
      Get.closeLoader();
      if (value != null) {
        userModel = value;
        
        // usersummaryList?.addAll(userModel);
        print(userModel);
        usersummaryList?.refresh();

        update();
      }
    }).onError((error, stackTrace) {
      Get.closeLoader();
      Get.showtoast(error.toString());
    });
  }




  // UserDashBoardSummaryModel userdashBoardSummaryModel;
  // Get.showLoader();
  // await userProvider.getUserDashBoardSummaryApi().then((value) {
  // Get.closeLoader();
  // if (value != null) {
  // userdashBoardSummaryModel = value;
  // print(userdashBoardSummaryModel);
  // if (userdashBoardSummaryModel.userSummaryDTO != null) {
  // addDetailInUserList(userdashBoardSummaryModel);
  // }
  // update();
  // }
  // })

  // addDetailInUserList(UserDashBoardSummaryModel userdashBoardSummaryModel) {
  //   usersummaryList?.add(SummaryModel(
  //       totalCount:
  //           userdashBoardSummaryModel.userSummaryDTO?.totalTickets?.toString(),
  //       title: LocaleKeys.total_shop.tr));
  //   usersummaryList.add(SummaryModel(
  //       trans: userdashBoardSummaryModel.userSummaryDTO?.totalTransactions
  //           ?.toString(),
  //       title: LocaleKeys.total_pos.tr));
  //   usersummaryList.add(SummaryModel(
  //       totalCount:
  //       userdashBoardSummaryModel?.userSummaryDTO?.totalTransactionAmount
  //           ?.toString(),
  //       title: LocaleKeys.total_plans.tr));
  //   usersummaryList.refresh();
  //   update();
  // }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  /*---------this api used for only showing amount based on shops*/
  hitApiToGetShopPerPaymentMethod({timeUrl}) async {
    dashboardMethodList?.clear();
    Get.showLoader();
    await userProvider.getDashboardPieChartOnShop(url: timeUrl).then((value) {
      Get.closeLoader();
      if (value != null) {
        dashBoardMethodModel = value;
        colorList.clear();
        paymentMethodMap = <String, double>{}.obs;
        dashboardMethodList?.addAll(dashBoardMethodModel?.dashBoardItems ?? []);
        if (dashboardMethodList?.length != 0) {
          filterBasedOnMethod(dashBoardMethodModel);
        } else {
          amountPerShop = LocaleKeys.no_data_found.tr;
        }
        dashboardMethodList?.refresh();
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
      if (element.currency?.toLowerCase() ==
          selectedCurrencyPosLabel.toString().toLowerCase()) {
        if (element.dashBoardItemValues?.length != 0) {
          element.dashBoardItemValues?.forEach((innerElement) {
            paymentCategoryMap.addAll(
                {innerElement.keyName ?? "": innerElement.totalValue ?? 0.0});
            catefgoryColorList.add(
                Colors.primaries[Random().nextInt(Colors.primaries.length)]);
            amountPerPos = "changed";
          });
        } else {
          amountPerPos = "changed";
        }
      } else {
        amountPerPos = "changed";
      }
    });

    if (paymentCategoryMap.isEmpty == true &&
        amountPerPos != LocaleKeys.select_shop_to_view_per_cate.tr) {
      amountPerPos = LocaleKeys.no_data_found.tr;
    }

    paymentCategoryMap.refresh();
    catefgoryColorList.refresh();
    update();
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
        dashboardMethodPosList
            ?.addAll(dashBoardCategoryModel?.dashBoardItems ?? []);
        if (dashboardMethodPosList?.length != 0) {
          filterBaseOnCategory(dashBoardCategoryModel);
        } else {
          amountPerPos = LocaleKeys.no_data_found.tr;
        }
        dashboardMethodPosList?.refresh();
        update();
      }
    }).onError((error, stackTrace) {
      Get.closeLoader();
      Get.showtoast(error.toString());
    });
  }

  filterBasedOnMethod(DashBoardPieModel? dashBoardPieModel) {
    paymentMethodMap.value = {};
    colorList?.clear();
    dashBoardPieModel?.dashBoardItems?.forEach((element) {
      if (element.currency?.toLowerCase() ==
          selectedCurrencyLabel.toString().toLowerCase()) {
        if (element.dashBoardItemValues?.length != 0) {
          element.dashBoardItemValues?.forEach((innerElement) {
            paymentMethodMap.addAll(
                {innerElement.keyName ?? "": innerElement.totalValue ?? 0.0});
            colorList.add(
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

    if (paymentMethodMap.isEmpty == true &&
        amountPerShop != LocaleKeys.select_shop_to_view_per.tr) {
      amountPerShop = LocaleKeys.no_data_found.tr;
    }

    paymentMethodMap.refresh();
    colorList.refresh();
    update();
  }

  String _substringDate(DateTime date) =>
      date.toIso8601String().substring(0, 10);

  void getChartData() async {
    try {
      final now = DateTime.now();
      final chartData = await _transactionProvider.chartDataDashboard(
        fromDate: _substringDate(DateTime(now.year - 1, now.month, now.day)),
        toDate: _substringDate(DateTime.now()),
      );
      print(chartData.toJson());
    } catch (e) {
      print(e);
    }
  }
}
