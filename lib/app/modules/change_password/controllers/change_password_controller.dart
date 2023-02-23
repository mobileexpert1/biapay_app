import 'package:biapay_app/app/widgets/export_file.dart';
import 'package:email_validator/email_validator.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class ChangePasswordController extends GetxController {
  final TextEditingController oldPass = TextEditingController();
  final TextEditingController newPass = TextEditingController();
  final TextEditingController confirmPass = TextEditingController();
  var resetPwdToken;
  @override
  void onInit() {
    getresetPwdToken();
    // TODO: implement onInit
    super.onInit();
  }

  getresetPwdToken(){
    if(Get.arguments!=null){
      resetPwdToken=Get.arguments;
      update();
    }
  }

  validateTextFieled() {
    if (Get.arguments==null&&isEmptyFiedds(oldPass?.text) == true) {
      Get.showtoast(LocaleKeys.old_pass_empty.tr);
      return;
    } else if (isEmptyFiedds(newPass?.text) == true) {
      Get.showtoast(LocaleKeys.new_pass_empty.tr);
      return;
    } else if (isEmptyFiedds(confirmPass?.text) == true) {
      Get.showtoast(LocaleKeys.confirm_pass_empty.tr);
      return;
    } else if (newPass?.text.toString() != confirmPass?.text?.toString()) {
      Get.showtoast(LocaleKeys.new_password_not_matched.tr);
      return;
    } else {
      if(Get.arguments!=null){
        hitApitoChangePasswordForRecovery();
      }else{
        hitApitoChangePassword();
      }

    }
  }

  hitApitoChangePasswordForRecovery() async {
    await getresetPwdToken();
    hidekeyboard();

    var requestModel = changePasswordRecoverRequestModel(resetPwdToken: resetPwdToken,
    confirmNewPassword: confirmPass.text,newPassword: newPass.text
    );

    Get.showLoader();
    await userProvider.passwordConfirmationUser(data: requestModel).then((value) {
      Get.closeLoader();
      if (value != null) {

        Get.offAllNamed(Routes.SIGNIN);
        Get.showtoast(LocaleKeys.pass_change_sucessfully.tr);
      }
    }).onError((error, stackTrace) {
      Get.closeLoader();
      Get.showtoast(error.toString());
    });
  }


  hitApitoChangePassword() async {
    await getresetPwdToken();
    hidekeyboard();

    var requestModel = changePasswordRequestModel(
        confirmNewPassword: confirmPass.text,newPassword: newPass.text,oldPassword: oldPass.text
    );

    Get.showLoader();
    await userProvider.changePasswordNormal(data: requestModel).then((value) {
      Get.closeLoader();
      if (value != null) {

        Get.offAllNamed(Routes.SIGNIN);
        Get.showtoast(LocaleKeys.pass_change_sucessfully.tr);
      }
    }).onError((error, stackTrace) {
      Get.closeLoader();
      Get.showtoast(error.toString());
    });
  }
}



