
import 'package:biapay_app/app/widgets/biapay_ui_package.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

import '../../../../generated/locales.g.dart';
import '../../../routes/app_pages.dart';
import '../../../widgets/common/bia_appbar.dart';
import '../../../widgets/common/bia_scaffold.dart';
import '../../../widgets/common/bia_text.dart';
import '../controllers/recover_password_controller.dart';




class RecoverPasswordView extends StatelessWidget {
  var controller=Get.put(RecoverPasswordController());
  @override
  Widget build(BuildContext context) {
    return BiaScaffold(
        appBar: BiaAppBar(
          centerTitle: false,
          showAction: false,
          showIcon: true,
          onBackPressed: (){
            Get.offAllNamed(Routes.LANDING);
          },
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 40.h,
              ),
              Align(
                alignment: Alignment.center,
                child: headingTextWidget(
                    title: LocaleKeys.select_recovery_option.tr),
              ),
              SizedBox(
                height: 40.h,
              ),

              GetBuilder<RecoverPasswordController>(builder: (controller){
                return securityMainWidget(title: controller.mSecuityList[0].title,
                    isSelected: controller.mSecuityList[0].isSelected);
              }),

              GetBuilder<RecoverPasswordController>(builder: (controller){
                return  sendOtpMainWidget(title: controller.mSecuityList[1].title,isSelected:  controller.mSecuityList[1].isSelected );
              } ),






              optionListItemWidget(
                  title: controller.mSecuityList[2].title,
                  isSelected: controller.mSecuityList[2].isSelected),
              SizedBox(
                height: 40.h,
              ),
              nexButtonWidget(),
              SizedBox(
                height: 20.h,
              ),
            ],
          ),
        ));
  }



  sendOtpMainWidget({isSelected, title}){
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: Colors.green,width: 1.w)
      ),
      child: Column(
        children: [
          InkWell(child: optionListItemWidget(
              title: title,
              isSelected: isSelected),
          onTap: (){
            controller.updateListOnIndex(1);
            controller.update();
          },
          ),
          isSelected?otpMainWidget():SizedBox(),
        ],
      ),
    );

  }

  otpMainWidget(){
    return Container(
      padding: EdgeInsets.only(left: 15.w,right: 15.w,top: 10.h),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
         children: [
          headingQuestionWidget(title: LocaleKeys.enter_registered.tr),
          SizedBox(height: 20.h,),
           phnTextWidget(),
           SizedBox(height: 10.h,),
           sendCodeButtonWidget(),


           controller.showOtpBox.value==true?headingQuestionWidget(title: LocaleKeys.enter_reset_code.tr):SizedBox(),
           controller.showOtpBox.value==true?otpAnswerWidget():SizedBox(),
           SizedBox(height: 10.h,),
        ],
      ),
    );
  }

  phnTextWidget() {
    return IntlPhoneField(
      autofocus: false,
      controller: controller.phoneController,
      decoration: InputDecoration(
         fillColor: Colors.white,
        floatingLabelBehavior: FloatingLabelBehavior.never,
        filled: true,
        counterText: "",
        labelText: 'Phone Number',
        border: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.green,width: 1.w),
        ),
      ),
      initialCountryCode: 'IN',
      style: TextStyle(fontSize: 24.sp),
      onChanged: (phone) {
        if (phone.completeNumber.isNotEmpty) {
          controller.completPhnNumber.value=phone.completeNumber.replaceAll("+","");
          // controller.phoneController.text = phone.completeNumber;
           controller.update();
        }

     //   print("check complete phn number ${controller.phoneController.text}");
        print(phone.completeNumber);
      },
    );
  }

  sendCodeButtonWidget(){
   return Align(
     alignment: Alignment.center,
     child: BiaButton(
       width: 250.w,
        margin: EdgeInsets.symmetric(horizontal: 0.w, vertical: 20.0),
        text: LocaleKeys.set_rest_code.tr,
        textColor: Colors.white,
        color: Theme.of(Get.context!).colorScheme.secondary,
        onPressed: () {
          controller.hitApiToSendRecoverOtp();
        },
      ),
   );
  }
  otpAnswerWidget() {
    return BiaTextField(
      borderColor:  Colors.green,
      label: "",
      maxLength: 7,
      inputType: InputFieldType.number(),

      controller: controller.otpController,
      hint: LocaleKeys.enter_otp.tr,
      padding: EdgeInsets.symmetric(horizontal: 0.w, vertical: 1.0),
    );
  }




  headingTextWidget({title}) {
    return BiaText(
      title ?? "",
      color: Colors.white,
      fontSize: 26.sp,
      fontWeight: FontWeight.bold,
    );
  }

  optionListItemWidget({isSelected, title}) {
    return Container(
      color: Colors.white,
      padding:
          EdgeInsets.only(top: 25.h, bottom: 25.h, left: 15.w, right: 10.w),
      child: Row(
        children: [
          radioWidget(isSelected: isSelected),
          SizedBox(
            width: 20.w,
          ),
          Expanded(child: optionTextWidget(title: title)),
        ],
      ),
    );
  }

  radioWidget({isSelected}) {
    return Container(
      padding: EdgeInsets.all(6.r),
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: Colors.black, width: 1.w)),
      child: isSelected?Container(
        padding: EdgeInsets.all(6.r),
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.green),
      ):SizedBox(),
    );
  }

  optionTextWidget({title}) {
    return BiaText(
      title ?? "",
      color: Colors.black.withOpacity(0.8),
      fontSize: 20.sp,
      fontWeight: FontWeight.w500,
    );
  }

  securityMainWidget({isSelected, title}){
    
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: Colors.green,width: 1.w)
      ),
      child: Column(
        children: [
          InkWell(
            child: optionListItemWidget(
                title: title,
                isSelected:isSelected),
            onTap: (){
              controller.updateListOnIndex(0);
              controller.update();
            },
          ),
          isSelected?  securitySectionWidget():Container(),
        ],
      ),
    );

  }


  securitySectionWidget() {
    return Container(
      padding: EdgeInsets.only(left: 15.w,right: 15.w,top: 10.h),
    color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          controller.recoveryQuestionList?.length != 0
              ? headingQuestionWidget(
                  title: controller.recoveryQuestionList![0].question)
              : Text(""),

          securityQuestionAnserWidget(),
          SizedBox(height: 15.h,),
        ],
      ),
    );
  }

  headingQuestionWidget({title}) {
    return  BiaText(
      title ?? "",
      color: Colors.black.withOpacity(0.8),
      fontSize: 20.sp,
      fontWeight: FontWeight.w500,
    );
  }

  securityQuestionAnserWidget() {
    return BiaTextField(
      borderColor:  Colors.green,
      label: "",
      controller: controller.answerController,
      hint: LocaleKeys.security_question_answer_one.tr,
      padding: EdgeInsets.symmetric(horizontal: 0.w, vertical: 1.0),
    );
  }


  nexButtonWidget() {
    return BiaButton(
      margin: EdgeInsets.symmetric(horizontal: 0.w, vertical: 20.0),
      text: LocaleKeys.next.tr,
      textColor: Colors.white,
      color: Theme.of(Get.context!).colorScheme.secondary,
      onPressed: () {
        controller.apiHitAccrodingToType();
      },
    );
  }
}
