import 'package:biapay_app/app/widgets/export_file.dart';
import 'package:dartz/dartz.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/scheduler.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../../models/recovery_model.dart';
import '../../../models/security_model.dart';
import '../../../models/server_security_model.dart';

class RecoverPasswordController extends GetxController{

  var answerController=TextEditingController();
  var otpController=TextEditingController();
  var phoneController=TextEditingController();
  RxList<SecurityModel> mSecuityList=<SecurityModel>[].obs;
  RxList<QuestionModel>? recoveryQuestionList=<QuestionModel>[].obs;
  RxList<SecurityJsonModel> jsonServerList=<SecurityJsonModel>[].obs;

  final completPhnNumber = "".obs;
  RxBool showOtpBox = false.obs;


  var userEmail;
  @override
  void onInit() {
    getArguments();
    initListType();

    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      hitApiToGetRecoveryQuestion();
    });
    // TODO: implement onInit
    super.onInit();
  }

  getArguments(){
    if(Get.arguments!=null){
      userEmail=Get.arguments;
      update();
    }
  }

  initListType(){
    mSecuityList.add(SecurityModel(title: LocaleKeys.security_question.tr,isSelected: false));
    mSecuityList.add(SecurityModel(isSelected: false,title: LocaleKeys.send_otp_mobile.tr));
    mSecuityList.add(SecurityModel(isSelected: false,title: LocaleKeys.use_an_auth_app.tr));
    update();
  }



  hitApiToGetRecoveryQuestion() async {
    await getArguments();
    RecoveryModel recoveryModel;
    recoveryQuestionList?.clear();
    hidekeyboard();
    Get.showLoader();
     var requestModel=recoveryQuestionRequestModel(email: userEmail);
    await userProvider.recoveryQuestionUser(data: requestModel).then((value) {
      Get.closeLoader();
      if (value != null) {
        recoveryModel=value;
        recoveryQuestionList?.addAll(recoveryModel.questions??[]);
        update();
        recoveryQuestionList?.refresh();

      }
    }).onError((error, stackTrace) {
      Get.closeLoader();
      Get.showtoast(error.toString());
    });

  }

  updateListOnIndex(index){
    for(int i=0;i<mSecuityList.value.length;i++){
        if(index==i){
          mSecuityList[i].isSelected=true;
        }else{
          mSecuityList[i].isSelected=false;
        }
    }

     update();
    mSecuityList.refresh();
  }

  apiHitAccrodingToType(){
     int findIndex = mSecuityList.indexWhere((st) => st.isSelected==true);
     if(findIndex!=-1){
       if(findIndex==0){
         if(isEmptyFiedds(answerController.text)==true){
           Get.showtoast(LocaleKeys.answer_empty.tr);
           return;
         }else{
           hitApiToSendRecoverOtpByQues();
         }
       }else if(findIndex==1){
         if(isEmptyFiedds(phoneController.text)==true){
           Get.showtoast(LocaleKeys.phn_number_empty.tr);
           return;
         }else if(isEmptyFiedds(otpController.text)==true){
           Get.showtoast(LocaleKeys.empty_otp.tr);
           return;
         }else{
           Get.toNamed(Routes.CHANGE_PASSWORD,arguments: otpController?.text);
         }
         }
       }
     }



  hitApiToSendRecoverOtpByQues() async {
    hidekeyboard();
    jsonServerList.add(SecurityJsonModel(answer: answerController?.text,questionId:recoveryQuestionList![0].id ));
    var requestModel=otpQuestionRecoverRequestModel(email: userEmail,answers: jsonServerList.value);

    Get.showLoader();
    await userProvider.sendRecoverOtpByQues(data: requestModel).then((value) {
      Get.closeLoader();
      if (value != null&&value['token']!=null) {
        Get.toNamed(Routes.CHANGE_PASSWORD,arguments: value['token']);
      }
    }).onError((error, stackTrace) {
      Get.closeLoader();
      Get.showtoast(error.toString());
    });

  }

  hitApiToSendRecoverOtp() async {
    if(isEmptyFiedds(phoneController.text)==true){
      Get.showtoast(LocaleKeys.phn_number_empty.tr);
      return;
    }
    hidekeyboard();
    var requestModel=recoverOtpRequestModel(mobile:  completPhnNumber.value);

    Get.showLoader();
    await userProvider.recoverOtpForUser(data: requestModel).then((value) {
      Get.closeLoader();
      if (value=="") {
        showOtpBox.value=true;
        update();

        Get.showtoast(LocaleKeys.otp_sent_sucessfully.tr);
      }
    }).onError((error, stackTrace) {
      Get.closeLoader();
      Get.showtoast(error.toString());
    });

  }









}