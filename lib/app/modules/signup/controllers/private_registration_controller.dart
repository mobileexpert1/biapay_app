import 'package:email_validator/email_validator.dart';
import 'package:flutter/scheduler.dart';

import '../../../models/security_question.dart';
import '../../../models/server_security_model.dart';
import '../../../models/sucees_model.dart';
import '../../../routes/app_pages.dart';
import '../../../widgets/export_file.dart';

class PrivateRegistrationController extends GetxController {
  //TODO: Implement SignupController

  final formKey = GlobalKey<FormState>();
  final emailTextController = TextEditingController();
  final firstNameTextController = TextEditingController();
  final lastNameTextController = TextEditingController();
  final phoneNumberTextController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final genderController = TextEditingController();
  var securityQuestion1TextController = TextEditingController().obs;
  var securityQuestion2TextController = TextEditingController().obs;
  final securityQuestionAnswer1TextController = TextEditingController();
  final securityQuestionAnswer2TextController = TextEditingController();
  final otpTextController = TextEditingController();
  final twoFactorAuthEnabled = false.obs;
  final termsAndConditions = false.obs;
  var firstQuesId,secQuestionId;

  String selectFirstQuestion=LocaleKeys.security_question_one.tr;
  String selectSecQuestion= LocaleKeys.security_question_two.tr;




  var securityQuestions = [];

  RxList<SecurityModel> mSecurityFirstList = <SecurityModel>[].obs;
  RxList<SecurityModel> mSecuritySecList = <SecurityModel>[].obs;
  RxList<SecurityModel> mMainSecurityList = <SecurityModel>[].obs;

  final completPhnNumber = "".obs;
  RxList<SecurityJsonModel> jsonServerList=<SecurityJsonModel>[].obs;

  @override
  void onInit() {
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      hitApiToGetSecurityQuestions();
    });
    super.onInit();
  }

  @override
  void onReady() {

    super.onReady();
  }

  getArguments(){
    if(Get.arguments!=null){
      phoneNumberTextController.text=Get.arguments??"";
       update();
    }
  }

  hitApiToGetSecurityQuestions() async {
    await  getArguments();
    mSecuritySecList.clear();
    mSecurityFirstList.clear();
    mMainSecurityList.clear();
    Get.showLoader();
    await userProvider.getPublicQuestions().then((value) {
      Get.closeLoader();
      if (value != null) {
        mSecurityFirstList.addAll(value);
        mSecuritySecList.addAll(value);
        mMainSecurityList.addAll(value);

        mSecurityFirstList.refresh();
        mMainSecurityList.refresh();
        mSecuritySecList.refresh();
        update();

      }
    }).onError((error, stackTrace) {
      Get.closeLoader();
      Get.showtoast(error.toString());
    });
  }

  updateSecDropDownList({selectedId}){
    int index = mMainSecurityList.indexWhere((st) => st.id.toString()==selectedId.toString());
    print(index);
    if(index!=-1){
     mSecuritySecList.removeAt(index);
     mSecuritySecList?.refresh();
    }


  }




  validateAllFields() {
    if (isEmptyFiedds(firstNameTextController?.text)==true) {
      Get.showtoast(LocaleKeys.first_name_empty.tr);
      return;
    } else if (isEmptyFiedds(lastNameTextController?.text)==true) {
      Get.showtoast(LocaleKeys.last_name_empty.tr);
      return;
    } else if (isEmptyFiedds(emailTextController?.text)==true) {
      Get.showtoast(LocaleKeys.email_empty.tr);
      return;
    }else if(!EmailValidator.validate(emailTextController?.text?.toString()??"")){
      Get.showtoast(LocaleKeys.email_empty_invalid.tr);
      return;
    } else {
      if (isEmptyFiedds(passwordController?.text)==true) {
      Get.showtoast(LocaleKeys.password_empty.tr);
      return;
    } else if (isEmptyFiedds(confirmPasswordController?.text)==true) {
      Get.showtoast(LocaleKeys.confirm_password.tr);
      return;
    }else if(passwordController?.text.toString()!=confirmPasswordController?.text?.toString()){
      Get.showtoast(LocaleKeys.password_not_matched.tr);
      return;
    } else if (isEmptyFiedds(securityQuestion1TextController?.value.text)==true) {
      Get.showtoast(LocaleKeys.please_select_que_one.tr);
      return;
    } else if (isEmptyFiedds(  securityQuestionAnswer1TextController?.text)==true) {
      Get.showtoast(LocaleKeys.answer_one_empty.tr);
      return;
    } else if (isEmptyFiedds(securityQuestion2TextController.value?.text)==true) {
      Get.showtoast(LocaleKeys.please_select_que_sec.tr);
      return;
    } else if (isEmptyFiedds(
        securityQuestionAnswer1TextController?.text)==true) {
      Get.showtoast(LocaleKeys.please_select_que_sec.tr);
      return;
    } else if (termsAndConditions == false) {
      Get.showtoast(LocaleKeys.please_agree_terms_conditions.tr);
      return;
    }else{
      jsonServerList.add(SecurityJsonModel(questionId:firstQuesId,answer: securityQuestionAnswer1TextController.text ));
      jsonServerList.add(SecurityJsonModel(questionId:secQuestionId,answer: securityQuestionAnswer2TextController.text ));

      hitApiToregisterUser();
    }
    }
  }

  hitApiToregisterUser() async {
    hidekeyboard();
    var requestModel=privateUserRegisterRequestModel(
      email: emailTextController.text,
      phoneNo: phoneNumberTextController.text,
      firstName: firstNameTextController.text,
      lastName: lastNameTextController.text,
      password: passwordController.text,
      confirmPassword: confirmPasswordController.text,
      twoFactorStatus: twoFactorAuthEnabled.value,
      securityAnswers: jsonServerList.value
    );
    requestModel;

    SuccessModel successModel;

    Get.showLoader();
     await userProvider.privateUserCompleteRegister(getIsUser()=="USER"?PRIVATE_USER_REGISTER:MERCHENT_USER_REGISTER,data: requestModel).then((value) {
      Get.closeLoader();
      if (value != null) {
        successModel=value;
        update();
        Get.offNamed(Routes.SIGNIN);
        Get.showtoast(successModel.message??"");
      }
    }).onError((error, stackTrace) {
      Get.closeLoader();
      Get.showtoast(error.toString());
    });

  }

  @override
  void onClose() {}

  void validateOtp() {}
}
