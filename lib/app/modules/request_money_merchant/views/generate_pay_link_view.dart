import 'package:auto_size_text/auto_size_text.dart';
import 'package:biapay_app/app/configs/const.dart';
import 'package:biapay_app/app/routes/app_pages.dart';
import 'package:biapay_app/app/widgets/biapay_ui_package.dart';
import 'package:biapay_app/app/widgets/export_file.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

import '../../../configs/configs.dart';
import '../../../widgets/common/custom_generate_dialog.dart';
import '../../../widgets/common/custom_select_view.dart';
import '../controllers/genearte_pay_link_controller.dart';
import '../controllers/request_money_merchant_controller.dart';

class GeneratePayLinkView extends StatelessWidget {
  var controller = Get.put(GeneratePayLinkController());

  @override
  Widget build(BuildContext context) {
     return BiaScaffold(
      appBar: BiaAppBar.simple(controller.generatePayLinkDataModel!=null?LocaleKeys.generate_paylink.tr:LocaleKeys.edit_link.tr),
      body: SingleChildScrollView(
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
            GetBuilder<GeneratePayLinkController>(builder: (controller){
              return shopSelectionDropWidget(controller);}),
            SizedBox(
              height: 13.h,
            ),
            headingTextWidget(title: LocaleKeys.select_a_pos.tr),
            SizedBox(
              height: 10.h,
            ),
            GetBuilder<GeneratePayLinkController>(builder: (controller){
              return shopPosSelectionDropWidget(controller);}),
            SizedBox(
              height: 15.h,
            ),
            customerNameTextFiled(),
            SizedBox(
              height: 15.h,
            ),
            headingTextWidget(title: LocaleKeys.customer_mobile_no.tr),
            SizedBox(
              height: 10.h,
            ),
           GetBuilder<GeneratePayLinkController>(builder: (controller){
             return  customerMobileTextFiled(controller,controller.countryDialCode);
           }),
            SizedBox(
              height: 10.h,
            ),
            customeEmailTextFiled(),
            SizedBox(
              height: 10.h,
            ),
            customeAmountTextFiled(),
            SizedBox(
              height: 10.h,
            ),
            headingTextWidget(title: LocaleKeys.select_currency.tr),
            SizedBox(
              height: 10.h,
            ),
            GetBuilder<GeneratePayLinkController>(builder: (controller){
              return currencySelectionDropDownWidget(controller);}),
            SizedBox(
              height: 10.h,
            ),
            customeMessageTextFiled(),
            SizedBox(
              height: 10.h,
            ),

            headingTextWidget(title: LocaleKeys.select_status.tr),
            SizedBox(
              height: 10.h,
            ),
            GetBuilder<GeneratePayLinkController>(builder: (controller){
              return statusSelectionDropDownWidget(controller);}),

            SizedBox(
              height: 40.h,
            ),

            generatePayButtonWidget(),
            SizedBox(
              height: 30.h,
            ),
          ],
        ),
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

  shopSelectionDropWidget(GeneratePayLinkController controller) {
    return CustomSelectView(
      padding: EdgeInsets.all(18.r),
      onTab: () {
        if(controller.generatePayLinkDataModel==null){
          showShopSelectionDialog(controller,true);
        }

      },
      label: controller.selectedShopLabel.tr,
    );
  }

  showShopSelectionDialog(GeneratePayLinkController controller, bool isShop) {
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
                      controller.selectedShopLabel = controller.merchentShopList?.value[index].name ?? "";
                      controller.shopId = controller.merchentShopList?.value[index].shopId?.toString() ??"";
                      controller.merchentPosList?.clear();
                      controller.merchentPosList?.addAll(controller.merchentShopList?.value[index].merchantPOSList ?? []);
                      controller.merchentPosList?.refresh();
                        if(controller.generatePayLinkDataModel!=null){
                          controller.selectedPosLabel= LocaleKeys.select_a_pos.tr;
                          controller.selectedPosLabel;
                        }

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

  shopPosSelectionDropWidget(GeneratePayLinkController controller) {
    return CustomSelectView(
      padding: EdgeInsets.all(18.r),
      onTab: () {
        if(controller.generatePayLinkDataModel==null){
          if(controller.merchentPosList?.length!=0)
            showPosSelectionDialog(controller);
          else
            Get.showtoast(LocaleKeys.no_data_found.tr);
        }
        },
      label: controller.selectedPosLabel.tr,
    );
  }

  customerNameTextFiled() {
    return BiaTextField(
      controller: controller.customerNameController,
      padding: EdgeInsets.zero,
      hint: LocaleKeys.enter_customer_name.tr,
      label: LocaleKeys.customer_name.tr,
    );
  }


  customeEmailTextFiled() {
    return BiaTextField(
      controller: controller.emailController,
      padding: EdgeInsets.zero,
      hint: LocaleKeys.enter_email.tr,
      label: LocaleKeys.email.tr,
    );
  }

  customeAmountTextFiled() {
    return BiaTextField(
      inputType:InputFieldType.number(),
      controller: controller.amountController,
      padding: EdgeInsets.zero,

      hint: LocaleKeys.enter_amount.tr,
      label: LocaleKeys.amount.tr,
    );
  }

  customeMessageTextFiled() {
    return BiaTextField(
      padding: EdgeInsets.zero,
      controller: controller.msgController,
      hint: LocaleKeys.enter_message.tr,
       label: LocaleKeys.message.tr,
      maxLines: 5,
    );
  }




  customerMobileTextFiled(GeneratePayLinkController controller,String? countryDialCode) {
     return Form(
     key: controller.formKey,
      child: IntlPhoneField(
        autofocus: false,
        controller: controller.mobileController,
        decoration: InputDecoration(
          fillColor: Colors.white,
          floatingLabelBehavior: FloatingLabelBehavior.never,
          filled: true,
          counterText: "",
          labelText: 'Phone Number',
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
          ),
        ),
        initialCountryCode: 'IN',
        style: TextStyle(fontSize: 20.sp),
        onChanged: (phone) {
          if (phone.completeNumber.isNotEmpty) {
            controller.completPhnNumber.value=phone.completeNumber.replaceAll("+","");
            controller.update();
          }
        },
      ),
    );
  }

  statusSelectionDropDownWidget(GeneratePayLinkController controller){
    return   CustomSelectView(
        padding: EdgeInsets.all(18.r),
        onTab: () {
           if(controller.generatePayLinkDataModel==null){
             showStatuSelectionDialog(controller);
           }else if(controller.generatePayLinkDataModel?.status!=LocaleKeys.cancelled_status.tr){
             showStatuSelectionDialog(controller);
           }

        },
        label:controller.statusSelectionLabel

    );
  }


  showStatuSelectionDialog(GeneratePayLinkController controller) {
    return showGenerateDialog(
        context: Get.overlayContext!,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListView.builder(
                shrinkWrap: true,
                itemCount: controller.statusList.value.length
                ,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      controller.statusSelectionLabel = controller.statusList.value[index] ?? "";
                      controller.update();
                      Get.back();
                    },
                    child: Padding(
                      padding:
                      EdgeInsets.only(top: 10.h, left: 20.h, bottom: 10.h),
                      child: BiaText(
                          controller.statusList.value[index] ?? "",
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



  currencySelectionDropDownWidget(GeneratePayLinkController controller){
    return   CustomSelectView(
        padding: EdgeInsets.all(18.r),
      onTab: () {
        if (controller.currencyList.value.length != 0) {
          showCurrencySelectionDialog(controller);
        } else {
          Get.showtoast(LocaleKeys.no_data_found.tr);
        }
      },
      label:controller.selectedCurrencyLabel

    );
  }
  showCurrencySelectionDialog(GeneratePayLinkController controller) {
    return showGenerateDialog(
        context: Get.overlayContext!,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListView.builder(
                shrinkWrap: true,
                itemCount: controller.currencyList.value.length
                   ,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      controller.selectedCurrencyLabel = controller.currencyList.value[index] ?? "";
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

  showPosSelectionDialog(GeneratePayLinkController controller) {
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
                      controller.selectedPosLabel =controller.merchentPosList?.value[index].name ??
                              "";

                      controller.posShopId =controller.merchentPosList?.value[index].id?.toString() ?? "";
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

  generatePayButtonWidget(){
    return  BiaButton.greenButtonInRow(
      text: LocaleKeys.generate_paylink.tr,
      onPressed: () {
        controller.validateTextFields();
      },
      width: double.infinity,
    );
  }


}
