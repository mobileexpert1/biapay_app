// import 'package:biapay_app/presentation/auth/widget/business_registration_form.dart';
// import 'package:biapay_app/presentation/auth/widget/private_registration_form.dart';
// import 'package:biapay_app/presentation/common/biapay_ui_package.dart';
// import 'package:biapay_app/service/auth/auth_controller.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_hooks/flutter_hooks.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';

// class PasswordForm extends HookWidget {
//   final String emailAddress;
//   final String phone;
//   final String? countryCode;
//   const PasswordForm(
//       {required this.countryCode,
//       required this.phone,
//       Key? key,
//       required this.emailAddress})
//       : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final TextEditingController passWordController =
//         useTextEditingController(text: 'Password123@');

//     final TextEditingController _confirmPassword = useTextEditingController();
//     final _formKey = useMemoized(() => GlobalKey<FormState>());

//     return Scaffold(
//         appBar: const BiaAppBar(),
//         body: Form(
//             key: _formKey,
//             child: Center(
//               child: Container(
//                 margin: EdgeInsets.all(15.w),
//                 padding: EdgeInsets.all(10.w),
//                 decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(10),
//                     color: Colors.white),
//                 child: Column(
//                   mainAxisSize: MainAxisSize.min,
//                   children: [
//                     const BiaText(
//                       "Enter a password",
//                       textType: TextType.headLine5,
//                     ),
//                     BiaTextField(
//                         padding: EdgeInsets.symmetric(
//                             vertical: 20.h, horizontal: 20.w),
//                         inputType: const InputFieldType.password(),
//                         controller: passWordController,
//                         hint: "err_password".tr,
//                         textColor: Colors.black,
//                         hintColor: Colors.deepPurple,
//                         label: 'password'.tr),
//                     BiaTextField(
//                         inputType: const InputFieldType.password(),
//                         controller: _confirmPassword,
//                         hint: "err_cnfirm".tr,
//                         label: 'confirm'.tr),
//                     BiaButton(
//                         text: 'next'.tr,
//                         color: Theme.of(context).colorScheme.secondary,
//                         onPressed: () {
//                           if (_formKey.currentState!.validate()) {
//                             if (passWordController.text ==
//                                 _confirmPassword.text) {
//                               final AuthController controller =
//                                   Get.find<AuthController>();

//                               if (controller.authentication.authUserType ==
//                                   'USER') {
//                                 Navigator.push(
//                                     context,
//                                     MaterialPageRoute(
//                                         builder: (context) =>
//                                             PrivateRegistrationForm(
//                                                 confirmPassword:
//                                                     _confirmPassword.text,
//                                                 countryCode: countryCode,
//                                                 phone: phone,
//                                                 password:
//                                                     passWordController.text)));
//                               } else {
//                                 Navigator.push(
//                                     context,
//                                     MaterialPageRoute(
//                                         builder: (context) =>
//                                             BusinessRegistrationForm(
//                                                 confirmPassword:
//                                                     _confirmPassword.text,
//                                                 email: emailAddress,
//                                                 password:
//                                                     passWordController.text)));
//                               }
//                             } else {
//                               BiaSnackBar(context)
//                                   .message(message: 'password did not match');
//                             }
//                           }
//                         })
//                   ],
//                 ),
//               ),
//             )));
//   }
// }
