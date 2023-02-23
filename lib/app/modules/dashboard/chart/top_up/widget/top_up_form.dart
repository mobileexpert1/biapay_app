// import 'package:biapay_app/presentation/common/biapay_ui_package.dart';

// import 'package:country_code_picker/country_code_picker.dart';
// import 'package:get/get.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_hooks/flutter_hooks.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:logger/logger.dart';

// class TopUpForm extends HookWidget {
//   const TopUpForm({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final TextEditingController _phone = useTextEditingController();
//     final TextEditingController _email = useTextEditingController();

//     String? countryCode = '';

//     final _formKey = useMemoized(() => GlobalKey<FormState>());

//     return Form(
//       key: _formKey,
//       child: ListView(
//         shrinkWrap: true,
//         children: [
//           Container(
//             padding: EdgeInsets.symmetric(vertical: 30.h),
//             width: double.infinity,
//             alignment: Alignment.center,
//             child: const BiaText('Enter details to send money'),
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Container(
//                 margin: EdgeInsets.only(left: 20.w),
//                 decoration:
//                     BoxDecoration(border: Border.all(color: Colors.blue)),
//                 child: CountryCodePicker(
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
//                       color: Theme.of(context).colorScheme.primaryVariant,
//                       fontSize: ScreenUtil().setSp(25)),
//                   // optional. Shows only country name and flag
//                 ),
//               ),
//               Expanded(
//                 child: BiaTextField(
//                     inputType: const InputFieldType.phone(),
//                     controller: _phone,
//                     hintColor: Theme.of(context).colorScheme.primaryVariant,
//                     textColor: Theme.of(context).colorScheme.primary,
//                     hint: 'phn_hint'.tr,
//                     label: "phn".tr),
//               ),
//             ],
//           ),
//           BiaTextField(
//               inputType: const InputFieldType.number(),
//               controller: _email,
//               hintColor: Theme.of(context).colorScheme.primaryVariant,
//               textColor: Theme.of(context).colorScheme.primary,
//               hint: 'Amount'.tr,
//               label: "Amount to be paid".tr),
//           SizedBox(
//             height: 20.h,
//           ),
//           BiaButton(
//               text: 'Send',
//               color: Theme.of(context).scaffoldBackgroundColor,
//               textColor: Colors.white,
//               onPressed: () {
//                 if (_formKey.currentState!.validate()) {
//                   Logger().i(countryCode);
//                   Get.toNamed('/top-up-details');
//                 }
//               })
//         ],
//       ),
//     );
//   }
// }
