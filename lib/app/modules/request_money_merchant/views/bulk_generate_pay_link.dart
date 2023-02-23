import 'package:auto_size_text/auto_size_text.dart';
import 'package:biapay_app/app/configs/const.dart';
import 'package:biapay_app/app/routes/app_pages.dart';
import 'package:biapay_app/app/widgets/biapay_ui_package.dart';
import 'package:biapay_app/app/widgets/export_file.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import 'package:get/get.dart';

import '../../../configs/configs.dart';
import '../../../models/bulk_dynamic_model.dart';
import '../../../widgets/common/custom_generate_dialog.dart';
import '../../../widgets/common/custom_select_view.dart';
import '../controllers/bulk_genearte_pay_link_controller.dart';
import '../controllers/genearte_pay_link_controller.dart';
import '../controllers/request_money_merchant_controller.dart';

class BulkGeneratePayLinkView extends StatelessWidget {
  var controller = Get.put(BulkGeneratePayLinkController());

  @override
  Widget build(BuildContext context) {
    return BiaScaffold(
      appBar: BiaAppBar.simple(LocaleKeys.generate_bulk_paylink.tr),
      body: GetBuilder<BulkGeneratePayLinkController>(builder: (controller) {
        return SingleChildScrollView(
          controller: controller.scrollController,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 30.h,
              ),
              headingTextWidget(title: LocaleKeys.select_shop.tr),
              SizedBox(
                height: 10.h,
              ),
              shopSelectionDropWidget(controller),
              SizedBox(
                height: 13.h,
              ),
              headingTextWidget(title: LocaleKeys.select_a_pos.tr),
              SizedBox(
                height: 10.h,
              ),
              shopPosSelectionDropWidget(controller),
              SizedBox(
                height: 13.h,
              ),
              headingTextWidget(title: LocaleKeys.upload_file.tr),
              SizedBox(
                height: 10.h,
              ),
              uploadFileWidget(),
              SizedBox(
                height: 10.h,
              ),
              dynamicListBuilder(controller),
              SizedBox(
                height: 10.h,
              ),
              generatePayButtonWidget(),

              SizedBox(
                height: 30.h,
              ),
            ],
          ),
        );
      }),
    );
  }

  generatePayButtonWidget(){
    return  BiaButton.greenButtonInRow(
      text: LocaleKeys.generate_bulk_paylink.tr,
      onPressed: () {
        controller.validateTextFields();
      },
      width: double.infinity,
    );
  }


  uploadFileWidget() {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10.r)),
      child: Row(
        children: [
          SizedBox(
            width: 10.w,
          ),
          BiaText(LocaleKeys.choose_file.tr,
              color: Colors.black, fontSize: 20.sp),
          Spacer(),
          Container(
            padding: EdgeInsets.all(20.r),
            decoration: BoxDecoration(
                color: AppColors.colorBlueDark,
                borderRadius: BorderRadius.circular(10.r)),
            child: BiaText(LocaleKeys.choose_file.tr,
                color: Colors.white, fontSize: 18.sp),
          )
        ],
      ),
    );
  }

  headingTextWidget({title}) {
    return BiaText(
      title ?? "",
      color: Colors.white,
      align: TextAlign.center,
      fontSize: 20.sp,
      fontWeight: FontWeight.w300,
      textType: TextType.headLine6,
      padding: EdgeInsets.zero,
    );
  }

  shopSelectionDropWidget(BulkGeneratePayLinkController controller) {
    return CustomSelectView(
      padding: EdgeInsets.all(18.r),
      onTab: () {
        showShopSelectionDialog(controller, true);
      },
      label: controller.selectedShopLabel.tr,
    );
  }

  showShopSelectionDialog(
      BulkGeneratePayLinkController controller, bool isShop) {
    return showGenerateDialog(
        context: Get.overlayContext!,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListView.builder(
                shrinkWrap: true,
                itemCount: controller.merchentShopList?.value.length,
                itemBuilder: (context, index) {
                  return controller.merchentShopList?.value[index].name
                              ?.isNotEmpty ==
                          true
                      ? InkWell(
                          onTap: () {
                            controller.selectedShopLabel = controller
                                    .merchentShopList?.value[index].name ??
                                "";
                            controller.shopId = controller
                                    .merchentShopList?.value[index].shopId
                                    ?.toString() ??
                                "";
                            controller.merchentPosList?.clear();
                            controller.merchentPosList?.addAll(controller
                                    .merchentShopList
                                    ?.value[index]
                                    .merchantPOSList ??
                                []);
                            controller.merchentPosList?.refresh();
                            controller.selectedPosLabel =
                                LocaleKeys.select_a_pos.tr;
                            controller.update();
                            Get.back();
                          },
                          child: Padding(
                            padding: EdgeInsets.only(
                                top: 10.h, left: 20.h, bottom: 10.h),
                            child: BiaText(
                                controller
                                        .merchentShopList?.value[index].name ??
                                    "",
                                color: Colors.black,
                                fontSize: 20.sp,
                                fontWeight: FontWeight.w500),
                          ),
                        )
                      : Container();
                })
            //your content
          ],
        ));
  }

  shopPosSelectionDropWidget(BulkGeneratePayLinkController controller) {
    return CustomSelectView(
      padding: EdgeInsets.all(18.r),
      onTab: () {
        if (controller.merchentPosList?.length != 0)
          showPosSelectionDialog(controller);
        else
          Get.showtoast(LocaleKeys.no_data_found.tr);
      },
      label: controller.selectedPosLabel.tr,
    );
  }

  showPosSelectionDialog(BulkGeneratePayLinkController controller) {
    return showGenerateDialog(
        context: Get.overlayContext!,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListView.builder(
                shrinkWrap: true,
                itemCount: controller.merchentPosList?.value.length,
                itemBuilder: (context, index) {
                  return controller
                              .merchentPosList?.value[index].name?.isNotEmpty ==
                          true
                      ? InkWell(
                          onTap: () {
                            controller.selectedPosLabel =
                                controller.merchentPosList?.value[index].name ??
                                    "";
                            controller.posShopId = controller
                                    .merchentPosList?.value[index].id
                                    ?.toString() ??
                                "";
                            controller.update();
                            Get.back();
                          },
                          child: Padding(
                            padding: EdgeInsets.only(
                                top: 10.h, left: 20.h, bottom: 10.h),
                            child: BiaText(
                                controller.merchentPosList?.value[index].name ??
                                    "",
                                color: Colors.black,
                                fontSize: 20.sp,
                                fontWeight: FontWeight.w500),
                          ),
                        )
                      : Container();
                })
            //your content
          ],
        ));
  }

  dynamicListBuilder(BulkGeneratePayLinkController controller) {
    return ListView.builder(
        shrinkWrap: true,

        physics: NeverScrollableScrollPhysics(),
        itemCount: controller.mWidgetList.length,
        itemBuilder: (context, index) {
          return dymaicItemWidget(controller.mWidgetList[index],controller,index);
        });
  }

  dymaicItemWidget(BulkDynamicModel bulkDynamicModel,BulkGeneratePayLinkController controller,int index) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 15.h,
        ),
        customerNameTextFiled(bulkDynamicModel),
        SizedBox(
          height: 10.h,
        ),
        customeEmailTextFiled(bulkDynamicModel),
        SizedBox(
          height: 10.h,
        ),
        customeAmountTextFiled(bulkDynamicModel),
        SizedBox(
          height: 10.h,
        ),
        customeMessageTextFiled(bulkDynamicModel),
        SizedBox(
          height: 20.h,
        ),

        headingTextWidget(title: LocaleKeys.select_currency.tr),
        SizedBox(
          height: 10.h,
        ),
        currencySelectionDropDownWidget(bulkDynamicModel,controller),
        SizedBox(
          height: 20.h,
        ),

        addRemovebuttonWidget(bulkDynamicModel,controller,index),
        SizedBox(
          height: 10.h,
        ),
      ],
    );
  }



  currencySelectionDropDownWidget(BulkDynamicModel bulkDynamicModel,BulkGeneratePayLinkController controller){
    return   CustomSelectView(
        padding: EdgeInsets.all(18.r),
        onTab: () {
          if (controller.currencyList.value.length != 0) {
            showCurrencySelectionDialog(controller,bulkDynamicModel);
          } else {
            Get.showtoast(LocaleKeys.no_data_found.tr);
          }
        },
        label:bulkDynamicModel.selectedCurrnecy

    );
  }

  addRemovebuttonWidget(BulkDynamicModel bulkDynamicModel,BulkGeneratePayLinkController controller,int selectedIndex) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        InkWell(
          onTap: () async {
            controller.index= controller.index+1;
            await Future.delayed(const Duration(milliseconds: 300));
            SchedulerBinding.instance.addPostFrameCallback((_) {
              controller.scrollController.animateTo(
                  controller.scrollController.position.maxScrollExtent,
                  duration: Duration(milliseconds: 500),
                  curve: Curves.fastOutSlowIn);
            });
            var checkValidation=controller.addValidationBeforeAdded(bulkDynamicModel);
            if(checkValidation==false){
              return;
            }
            controller.initAndAddDynamicList();

            controller.update();

          },
          child: Container(
            decoration: BoxDecoration(
                color: AppColors.colorGreen,
                borderRadius: BorderRadius.circular(10.r)),
            padding: EdgeInsets.all(20.r),
            child: Icon(Icons.add),
          ),
        ),

        selectedIndex!=0?InkWell(
          onTap: () async {
            controller.mWidgetList.removeAt(selectedIndex);
            controller.mWidgetList.refresh();
            controller.update();
          },
          child: Container(
            margin: EdgeInsets.only(left: 10.w),
            decoration: BoxDecoration(
                color: AppColors.colorRed.withOpacity(0.7),
                borderRadius: BorderRadius.circular(10.r)),
            padding: EdgeInsets.all(20.r),
            child: Icon(Icons.remove),
          ),
        ):Container(),
      ],
    );
  }

  customerNameTextFiled(BulkDynamicModel bulkDynamicModel) {
    return BiaTextField(
      controller: bulkDynamicModel.customerNameController,
      padding: EdgeInsets.zero,
      hint: LocaleKeys.enter_customer_name.tr,
      label: LocaleKeys.customer_name.tr,
    );
  }

  customeEmailTextFiled(BulkDynamicModel bulkDynamicModel) {
    return BiaTextField(
      controller: bulkDynamicModel.emailController,
      padding: EdgeInsets.zero,
      hint: LocaleKeys.enter_email.tr,
      label: LocaleKeys.email.tr,
    );
  }

  customeAmountTextFiled(BulkDynamicModel bulkDynamicModel) {
    return BiaTextField(
      inputType: InputFieldType.number(),
      controller: bulkDynamicModel.amountController,
      padding: EdgeInsets.zero,
      hint: LocaleKeys.enter_amount.tr,
      label: LocaleKeys.amount.tr,
    );
  }

  customeMessageTextFiled(BulkDynamicModel bulkDynamicModel) {
    return BiaTextField(
      padding: EdgeInsets.zero,
      controller: bulkDynamicModel.msgController,
      hint: LocaleKeys.enter_message.tr,
      label: LocaleKeys.message.tr,
      maxLines: 5,
    );
  }

  showCurrencySelectionDialog(BulkGeneratePayLinkController controller,BulkDynamicModel bulkDynamicModel) {
    return showGenerateDialog(
        context: Get.overlayContext!,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListView.builder(
                shrinkWrap: true,
                itemCount: controller.currencyList.value.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      bulkDynamicModel.selectedCurrnecy = controller.currencyList.value[index] ?? "";
                      controller.update();
                      Get.back();
                    },
                    child: Padding(
                      padding:
                      EdgeInsets.only(top: 10.h, left: 20.h, bottom: 10.h),
                      child: BiaText(
                          controller.currencyList.value[index] ?? "",
                          color: Colors.black,
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w500),
                    ),
                  );
                })
            //your content
          ],
        ));
  }
}
