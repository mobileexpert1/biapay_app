import 'package:biapay_app/app/widgets/export_file.dart';
import 'package:email_validator/email_validator.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class ForgotPasswordController extends GetxController{
  var emailController=TextEditingController();
  var customeTypeController=TextEditingController();
  var selecedDropDownValue=LocaleKeys.business_account;
  RxBool isvisible=false.obs;
  List customList=[LocaleKeys.business_account,LocaleKeys.private_account];

  @override
  void onInit() {
    getuserType();
    // TODO: implement onInit
    super.onInit();
  }


  getuserType(){
    var userType= box.read(Config.keys.userType);
    customeTypeController.text=userType??"";
    update();
    print(userType);
  }







  validateTextFields(){
   /* Get.toNamed(Routes.RECOVER_PASSWORD);
    return;*/
    if (isEmptyFiedds(emailController?.text)==true) {
      Get.showtoast(LocaleKeys.email_empty.tr);
      return;
    }else if(!EmailValidator.validate(emailController?.text?.toString()??"")){
      Get.showtoast(LocaleKeys.email_empty_invalid.tr);
      return;
    }else{
      hitApiToRecoverPassword();
    }
  }


  hitApiToRecoverPassword() async {
    hidekeyboard();
    Get.showLoader();
     await userProvider.forgotPasswordRecovery(email: emailController.text,userType:customeTypeController.text ).then((value) {
      Get.closeLoader();
      if (value != null && value['registered'] == true) {
        Get.toNamed(Routes.RECOVER_PASSWORD,arguments: emailController.text );
      }
    }).onError((error, stackTrace) {
      Get.closeLoader();
      Get.showtoast(error.toString());
    });

  }
}