import 'package:biapay_app/app/models/merchent_shop_model.dart';
import 'package:biapay_app/app/models/select_model.dart';
import 'package:dartz/dartz_unsafe.dart';
import 'package:flutter/scheduler.dart';

import '../../../models/currency_model.dart';
import '../../../models/dashboard_amount_shop_collection.dart';
import '../../../widgets/export_file.dart';

class AnalysticsController extends GetxController {
  List<String> currencies = ["USD", "EUR", "OUV", "XAF"];
  final currency1 = TextEditingController();
  final currency2 = TextEditingController();
  final currency3 = TextEditingController();
  final currency4 = TextEditingController();
  MerchentShopModel? merchentShopModel;
  RxList<MerchentShopDataModel>? merchentShopList = <MerchentShopDataModel>[].obs;
  RxList<MerchantPosModel>? merchentPosList = <MerchantPosModel>[].obs;

  var merchentShopController = TextEditingController();

  RxList<CurrencyModel> currencyModelList = <CurrencyModel>[].obs;
  RxList currencyList = [].obs;
  RxList currencyPosList = [].obs;
  RxList<TimeModel> timeModelList = <TimeModel>[].obs;
  RxList<TimeModel> posTimeModelList = <TimeModel>[].obs;
  RxList<CurrencyModel> activeCurrencyList = <CurrencyModel>[].obs;
  String selectedShopLabel=LocaleKeys.select_shop.tr;
  String selectPosShopLabel=LocaleKeys.select_shop.tr;
  String selectedPosLabel=LocaleKeys.select_POS.tr;
  String selectedCurrencyLabel="XAF";
  String selectedCurrencyPosLabel="XAF";
  String amountPerShop=LocaleKeys.select_shop_to_view.tr;
  String amountPerPos=LocaleKeys.select_pos_to_view.tr;
  int _selectedIndex=0;////=======



  var shopId=null;
  var secShopId=null;
  var posShopId=null;

  RxList<DashBoardItems>? dashBoardItemList=<DashBoardItems>[].obs;
  RxList<DashBoardItems>? dashBoardPosItemList=<DashBoardItems>[].obs;
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

  initTimeModel(){
    timeModelList.add(TimeModel(title: LocaleKeys.today_option.tr,isSeleced: false,id: 1));
    timeModelList.add(TimeModel(title: LocaleKeys.this_week_option.tr,isSeleced: false,id: 2));
    timeModelList.add(TimeModel(title: LocaleKeys.seven_option.tr,isSeleced: false,id: 3));
    timeModelList.add(TimeModel(title: LocaleKeys.this_month_option.tr,isSeleced: false,id: 4));
    timeModelList.add(TimeModel(title: LocaleKeys.last_month_option.tr,isSeleced: false,id: 5));
    timeModelList.refresh();
    update();
  }

  initPosTimeModel(){
    posTimeModelList.add(TimeModel(title: LocaleKeys.today_option.tr,isSeleced: false,id: 1));
    posTimeModelList.add(TimeModel(title: LocaleKeys.this_week_option.tr,isSeleced: false,id: 2));
    posTimeModelList.add(TimeModel(title: LocaleKeys.seven_option.tr,isSeleced: false,id: 3));
    posTimeModelList.add(TimeModel(title: LocaleKeys.this_month_option.tr,isSeleced: false,id: 4));
    posTimeModelList.add(TimeModel(title: LocaleKeys.last_month_option.tr,isSeleced: false,id: 5));
    posTimeModelList.refresh();
    update();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

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
  /*---------this api used for only showing amount based on shops*/
  hitApiToGetDashBoardForShop({timeUrl}) async {
    AmountShopCollectionModel amountShopCollectionModel;
    dashBoardItemList?.clear();
    Get.showLoader();
    await userProvider.getDashboardAmountBasedOnShop(url: timeUrl).then((value) {
      Get.closeLoader();
      if (value != null) {
        amountShopCollectionModel=value;
        dashBoardItemList?.addAll(amountShopCollectionModel.dashBoardItems??[]);
        if(dashBoardItemList?.length!=0){
          filterDataBasedOnCurrency();
        }else{
          amountPerShop=LocaleKeys.no_data_found.tr;
        }
        dashBoardItemList?.refresh();
        update();
      }
    }).onError((error, stackTrace) {
      Get.closeLoader();
      Get.showtoast(error.toString());
    });
  }

  filterDataBasedOnCurrency(){
    dashBoardItemList?.forEach((element) {
      if(element.currency?.toString().toLowerCase()==selectedCurrencyLabel.toString().toLowerCase()){
        amountPerShop=element.total?.toString()??"";
        update();
        print("check amount per shop ${amountPerShop}");
        return;
      }else{
        amountPerShop=LocaleKeys.no_data_found.tr;
      }
    });
    print("check amount per shop outside${amountPerShop}");
  }


  //api is used to get pos all database
  hitApiToGetDashBoardForPos({timeUrl}) async {
    AmountShopCollectionModel amountShopCollectionModel;
    dashBoardPosItemList?.clear();
    Get.showLoader();
    await userProvider.getDashboardAmountBasedOnShop(url: timeUrl).then((value) {
      Get.closeLoader();
      if (value != null) {
        amountShopCollectionModel=value;
        dashBoardPosItemList?.addAll(amountShopCollectionModel.dashBoardItems??[]);
        if(dashBoardPosItemList?.length!=0){
          filterDataBasedOnPosCurrency();
        }else{
          amountPerPos=LocaleKeys.no_data_found.tr;
        }
        dashBoardPosItemList?.refresh();
        update();
      }
    }).onError((error, stackTrace) {
      Get.closeLoader();
      Get.showtoast(error.toString());
    });
  }

  filterDataBasedOnPosCurrency(){
    dashBoardPosItemList?.forEach((element) {
      if(element.currency?.toString().toLowerCase()==selectedCurrencyPosLabel.toString().toLowerCase()){
        amountPerPos=element.total?.toString()??"";
        update();
        print("check amount per shop ${amountPerPos}");
        return;
      }else{
        amountPerPos=LocaleKeys.no_data_found.tr;
      }
    });
    print("check amount per shop outside${amountPerPos}");
  }



}
