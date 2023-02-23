// import 'package:country_code_picker/country_code_picker.dart';
// import 'package:get/get.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_hooks/flutter_hooks.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/instance_manager.dart';

// import '../../../domain/auth/auth_data.dart';

// class BusinessRegistrationForm extends HookWidget {
//   final String email;
//   final String password;
//   final String confirmPassword;

//   final AuthController authController = Get.find<AuthController>();
//   BusinessRegistrationForm(
//       {required this.confirmPassword,
//       required this.email,
//       required this.password,
//       Key? key})
//       : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final TextEditingController _phone =
//         useTextEditingController(); //text: '913837910');
//     final TextEditingController _email =
//         useTextEditingController(text: email); //text: 'mayuran57@gmail.com');
//     final TextEditingController _companyName =
//         useTextEditingController(); //text: 'Merchant57');
//     final TextEditingController _companyUrl =
//         useTextEditingController(); //text: 'http://localhost57.com/');
//     final TextEditingController _password =
//         useTextEditingController(text: password); //text: 'Password123@');
//     final TextEditingController _confirmPassword = useTextEditingController(
//         text: confirmPassword); //text: 'Password123@');
//     String? countryCode = '';

//     final _formKey = useMemoized(() => GlobalKey<FormState>());

//     return Scaffold(
//       appBar: const BiaAppBar(),
//       body: Form(
//         key: _formKey,
//         child: ListView(
//           shrinkWrap: true,
//           children: [
//             SizedBox(
//               height: 100.h,
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 CountryCodePicker(
//                   barrierColor: Colors.black12,
//                   padding: EdgeInsets.only(left: 20.w),
//                   showFlag: false,
//                   onChanged: (code) {
//                     countryCode = code.dialCode;
//                   },
//                   onInit: (code) {
//                     countryCode = code!.dialCode;
//                   },

//                   // Initial selection and favorite can be one of code ('IT') OR dial_code('+39')
//                   initialSelection: 'IT',
//                   textStyle: TextStyle(
//                       color: Theme.of(context).colorScheme.secondary,
//                       fontSize: ScreenUtil().setSp(25)),
//                   // optional. Shows only country name and flag
//                 ),
//                 Expanded(
//                   child: BiaTextField(
//                       inputType: const InputFieldType.phone(),
//                       controller: _phone,
//                       hint: 'phn_hint'.tr,
//                       label: "phn".tr),
//                 ),
//               ],
//             ),
//             BiaTextField(
//                 controller: _companyName,
//                 hint: "err_comp".tr,
//                 label: 'comp'.tr),
//             BiaTextField(
//                 inputType: const InputFieldType.email(),
//                 controller: _email,
//                 enabled: false,
//                 hint: 'email_your'.tr,
//                 label: "email_reg".tr),
//             BiaTextField(
//                 inputType: const InputFieldType.url(),
//                 controller: _companyUrl,
//                 hint: "err_url".tr,
//                 label: 'comp_url'.tr),
//             BiaTextField(
//                 inputType: const InputFieldType.password(),
//                 controller: _password,
//                 hint: "err_password".tr,
//                 enabled: false,
//                 label: 'password'.tr),
//             BiaTextField(
//                 inputType: const InputFieldType.password(),
//                 controller: _confirmPassword,
//                 enabled: false,
//                 hint: "err_cnfirm".tr,
//                 label: 'confirm'.tr),
//             SizedBox(
//               height: 10.h,
//             ),
//             BiaText(
//               'tnc'.tr,
//               color: Colors.white,
//               padding: EdgeInsets.symmetric(
//                 horizontal: 20.w,
//               ),
//             ),
//             BiaButton(
//                 text: 'register'.tr,
//                 color: Theme.of(context).colorScheme.secondary,
//                 onPressed: () {
//                   if (_formKey.currentState!.validate()) {
//                     authController.registerBusiness(
//                         context,
//                         BusinessRegisterBody(
//                           _confirmPassword.text,
//                           _password.text,
//                           _email.text,
//                           false,
//                           _companyUrl.text,
//                           countryCode! + _phone.text,
//                           _companyName.text,
//                         ));
//                   }
//                 })
//           ],
//         ),
//       ),
//     );
//   }
// }
