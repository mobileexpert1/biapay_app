// import 'package:biapay_app/presentation/auth/widget/password_form.dart';
// import 'package:biapay_app/presentation/common/biapay_ui_package.dart';
// import 'package:biapay_app/presentation/common/phone_controller_hook.dart';

// import 'package:country_code_picker/country_code_picker.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_hooks/flutter_hooks.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';
// import 'package:phone_form_field/phone_form_field.dart';

// class PhoneForm extends HookWidget {
//   const PhoneForm({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final TextEditingController _phone = useTextEditingController();
//     final _formKey = useMemoized(() => GlobalKey<FormState>());
//     String? countryCode = 'IT';
//     return Scaffold(
//         appBar: const BiaAppBar(),
//         body: Form(
//           key: _formKey,
//           child: Center(
//             child: Container(
//               margin: EdgeInsets.all(15.w),
//               padding: EdgeInsets.all(10.w),
//               decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(10), color: Colors.white),
//               child: Column(
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   const BiaText(
//                     "Let's create a private account!",
//                     textType: TextType.headLine5,
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       CountryCodePicker(
//                         barrierColor: Colors.black12,
//                         padding: EdgeInsets.only(left: 20.w),
//                         showFlag: false,
//                         onChanged: (code) {
//                           // Logger().i(code.code);
//                           countryCode = code.dialCode;
//                         },
//                         onInit: (code) {
//                           countryCode = code!.dialCode;
//                         },
//                         initialSelection: countryCode,
//                         textStyle: TextStyle(
//                             color: Theme.of(context).colorScheme.secondary,
//                             fontSize: ScreenUtil().setSp(25)),
//                       ),
//                       Expanded(
//                         child: BiaTextField(
//                             inputType: const InputFieldType.phone(),
//                             controller: _phone,
//                             hint: 'phn_hint'.tr,
//                             label: "phn".tr),
//                       ),
//                     ],
//                   ),
//                   BiaButton(
//                       text: 'next'.tr,
//                       color: Theme.of(context).colorScheme.secondary,
//                       onPressed: () {
//                         if (_formKey.currentState!.validate()) {
//                           Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                   builder: (context) => PasswordForm(
//                                       countryCode: countryCode,
//                                       phone: _phone.text,
//                                       emailAddress: '')));
//                         }
//                       })
//                 ],
//               ),
//             ),
//           ),
//         ));
//   }
// }
