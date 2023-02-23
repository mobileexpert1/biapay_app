import '../../../routes/app_pages.dart';
import '../../../widgets/export_file.dart';

class SignupController extends GetxController {
  //TODO: Implement SignupController

  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final genderController = TextEditingController();
  final securityQuestion1TextController = TextEditingController();
  final securityQuestion2TextController = TextEditingController();
    final otpTextController = TextEditingController();

  var securityQuestions = [];

  final completPhnNumber = "".obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  moveToOtpScreen() {
    Get.toNamed(Routes.PIN_CODE,arguments:completPhnNumber.value);
  }

  hitApiToRegisterUser() async {
     Get.showLoader();
    hidekeyboard();
    await userProvider.registerPrivateUser(phoneNumber: completPhnNumber.value).then((value) {
      Get.closeLoader();
      if (value != null && value['registered'] == false) {
        hitApiToGenerateOtp();
      } else {
        Get.showtoast(LocaleKeys.number_already_registered.tr);
      }
    }).onError((error, stackTrace) {
      Get.closeLoader();
      Get.showtoast(error.toString());
    });
  }

  hitApiToGenerateOtp() async {
    Get.showLoader();
    var rawData = otpGenerateRequestModel(phoneNumber: completPhnNumber.value);
    await userProvider.generateOtpForUser(data: rawData).then((value) {
      Get.closeLoader();
      if (value != null) {
        moveToOtpScreen();
        Get.showtoast(LocaleKeys.otp_sent_sucessfully.tr);
      } else {
        Get.showtoast(LocaleKeys.number_already_registered.tr);
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
