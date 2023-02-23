

import 'package:biapay_app/app/widgets/export_file.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/scheduler.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../../models/merchant_generate_pay.dart';
import '../../../models/merchent_shop_model.dart';

class RequestMoneyMerchantController extends GetxController {




  var searchController=TextEditingController();
  RxBool bulkSelected=false.obs;
  RxBool payLinkSelected=false.obs;
  GeneratePayLinkModel? generatePayLinkModel;
  RxList<GeneratePayLinkDataModel>? payLinkdataList=<GeneratePayLinkDataModel>[].obs;
  RxList<GeneratePayLinkDataModel>? payLinkMaindataList=<GeneratePayLinkDataModel>[].obs;
  int? page = 0, pageSize = 10;
  int selectedIndex=0;
  bool isFilterSelected=false;
  RxString selectedTitle="".obs;
  ScrollController scrollController = ScrollController();
  @override
  void onInit() {
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      hitApiToGetPayLinkList();
       paginatedlist();
    });
    super.onInit();
  }



  goToGeneratePayLink() async {
    var data=  await Get.toNamed(Routes.GENERATE_PAY_LINK_VIEW);
     if(data!=null){
       page=0;
       payLinkdataList?.clear();
       payLinkMaindataList?.clear();
       hitApiToGetPayLinkList();
     }
  }

  goToBulkPayLink() async {
    var data= await Get.toNamed(Routes.BULK_GENERATE_PAY_LINK_VIEW);
    if(data!=null){
      page=0;
      payLinkdataList?.clear();
      payLinkMaindataList?.clear();
      hitApiToGetPayLinkList();
    }

  }

  paginatedlist() {
    scrollController.addListener(() {
      if (scrollController.position.maxScrollExtent ==
          scrollController.position.pixels) {
        int? totalPages = generatePayLinkModel?.totalPages ?? 0;
        hidekeyboard();
        if (generatePayLinkModel != null && page! < totalPages) {
          page = page! + 1;
          update();
          hitApiToGetPayLinkList();
        }
      }
    });
  }

  hitApiToGetPayLinkList() async {
     Get.showLoader();
     payLinkMaindataList!.clear();
    await userProvider.getMerchantpayLinkList(size: pageSize,page: page).then((value) {
      Get.closeLoader();
      if (value != null) {
        generatePayLinkModel=value;
        payLinkdataList?.addAll(generatePayLinkModel?.content??[]);
        payLinkMaindataList?.addAll(payLinkdataList??[]);
        if(searchController.text.isNotEmpty==true){
          applySerachOnList();
        }
        if(isFilterSelected==true){
          applyFilterOnList(selectedTitle.value);
        }
        payLinkdataList?.refresh();
        update();
      }
    }).onError((error, stackTrace) {
      Get.closeLoader();
      Get.showtoast(error.toString());
    });
  }


  applySerachOnList() {
    page=0;
    if (payLinkMaindataList?.value.length != 0) {
      payLinkdataList!.clear();
      payLinkMaindataList?.forEach((element) {
        if(element.customerName?.toLowerCase().startsWith(searchController?.text.toLowerCase()??"")==true){
          payLinkdataList!.add(element!);
          payLinkdataList!.refresh();
          update();
        }
      });
      if(payLinkdataList?.length==0){
        print("cjel ${payLinkdataList?.length}");
        payLinkdataList?.refresh();
        update();
      }
    }
  }
  applyFilterOnList(selectedStatus) {
    if (payLinkMaindataList?.value.length != 0) {
      List<GeneratePayLinkDataModel>? filterList = payLinkMaindataList
          ?.where((e) =>
      e.status!=null&&e.status?.toLowerCase() == selectedStatus?.toString().toLowerCase())
          .toList();
      if (filterList?.length != 0) {
        payLinkdataList?.clear();
        payLinkdataList!.addAll(filterList ?? []);
        payLinkdataList!.refresh();
        update();
      } else {
        payLinkdataList?.clear();
        payLinkdataList!.refresh();
        update();
      }
    }


    print("check list length ${payLinkdataList?.length}");
  }

}