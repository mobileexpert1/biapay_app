import 'package:auto_size_text/auto_size_text.dart';
import 'package:biapay_app/app/configs/const.dart';
import 'package:biapay_app/app/routes/app_pages.dart';
import 'package:biapay_app/app/widgets/biapay_ui_package.dart';
import 'package:biapay_app/app/widgets/export_file.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../configs/configs.dart';
import '../components/generate_paylink_view.dart';
import '../controllers/request_money_merchant_controller.dart';

class RequestMoneyMerchantView extends StatelessWidget {
  var controller = Get.put(RequestMoneyMerchantController());

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<RequestMoneyMerchantController>();
    return BiaScaffold(
      appBar: BiaAppBar.simple(LocaleKeys.pay_links.tr,
          isShowFilter: true, filterWidget: popMenuItemWidget()
      ),
      body: Column(
        children: [
          SizedBox(
            height: 20.h,
          ),
          GetBuilder<RequestMoneyMerchantController>(builder: (controller) {
            return generateLinkButtonWidget(controller);
          }),

          serachTextWidget(),
          SizedBox(
            height: 18.h,
          ),

          GetBuilder<RequestMoneyMerchantController>(builder: (controller) {
            return  Expanded(child:linkListBuiderWidget(controller) );
          })
        ],
      ),
    );
  }


  serachTextWidget() {
    return BiaTextField(
      hint: LocaleKeys.search_records.tr,
      label: "",
      padding: EdgeInsets.zero,
      onChanged: (data) {
        controller.isFilterSelected=false;
        if (data.toString().isNotEmpty == true) {
          controller.applySerachOnList();
        } else {
          controller.payLinkdataList?.clear();
          controller.payLinkdataList?.addAll(controller.payLinkMaindataList ?? []);
          controller.update();
        }
      },
      suffixIcon: Icon(Icons.search),
      controller: controller.searchController,
    );
  }


  generateLinkButtonWidget(RequestMoneyMerchantController controller) {
    return Row(children: [
      Expanded(
          child: buttonWidget(
              title: LocaleKeys.generate_bulk_paylink.tr,
              isSelected: controller.bulkSelected.value,
              onTab: () {
                controller.goToBulkPayLink();

              })),
      SizedBox(
        width: 8.w,
      ),
      Expanded(
          child: buttonWidget(
              title: LocaleKeys.generate_paylink.tr,
              isSelected: controller.payLinkSelected.value,
              onTab: () {
                controller.goToGeneratePayLink();
              }))
    ]);
  }

  buttonWidget({title, isSelected, onTab}) {
    return InkWell(
      onTap: onTab,
      child: Container(
        padding: EdgeInsets.all(20.r),
        decoration: BoxDecoration(
            border: Border.all(
                color: isSelected == true
                    ? AppColors.colorBlueDark
                    : AppColors.colorBlueDark,
                width: 1.0.w),
            borderRadius: BorderRadius.circular(10.r),
            color:  AppColors.colorBlueDark ),
        child: Center(
          child: AutoSizeText(
            title,
            maxLines: 1,
            style: TextStyle(
              color: Colors.white,

              fontSize: 20.sp,
            ),
          ),
        ),
      ),
    );
  }


  linkListBuiderWidget(RequestMoneyMerchantController controller){
    return ListView.builder(
      controller: controller.scrollController,
        itemCount: controller.payLinkdataList?.value.length,
        itemBuilder: ((context, index) {
      return GeneratePayLinkView(generatePayLinkDataModel: controller.payLinkdataList?.value[index],onSelected: ((model) async {

         var data=await Get.toNamed(Routes.GENERATE_PAY_LINK_VIEW, arguments:model);
        if(data!=null){
          controller.payLinkdataList?.value[index]=data;
          controller.payLinkdataList!.refresh();
          controller.update();
        }

      }),);
    }));
  }

  getCode(phnNumber){
    Map<String, dynamic> numberSplit=getCountryNameBycode(phnNumber: phnNumber);
    if(numberSplit.isNotEmpty==true){
      return numberSplit['code']!;
    }
  }

  popMenuItemWidget() {
    return PopupMenuButton<int>(
      icon: Padding(
        padding:  EdgeInsets.only(right: 20.w),
        child: Icon(
          Icons.filter_alt,
          color: Colors.grey,
          size: 45.h,
        ),
      ),
      itemBuilder: (context) => [
        PopupMenuItem<int>(
          value: 1,
          // row has two child icon and text.
          child: Text(LocaleKeys.active_status.tr ?? ""),
        ),
        PopupMenuItem<int>(
          value: 2,
          // row has two child icon and text.
          child: Text(LocaleKeys.completed_status.tr ?? ""),
        ),
        PopupMenuItem<int>(
          value: 3,
          // row has two child icon and text.
          child: Text(LocaleKeys.cancelled_status.tr ?? ""),
        )
      ],
      offset: Offset(-10, 10),
      color: Colors.white.withOpacity(1),
      onSelected: (selectedIndex) {
        controller.isFilterSelected=true;
        controller.selectedTitle.value=selectedIndex==1?LocaleKeys.active_status.tr:selectedIndex==2?LocaleKeys.completed_status.tr:LocaleKeys.cancelled_status.tr;
        controller.update();

         controller.applyFilterOnList(controller.selectedTitle.value);
      },
      elevation: 5,
    );
  }

}
