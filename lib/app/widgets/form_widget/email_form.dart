// import 'package:biapay_app/presentation/auth/widget/password_form.dart';
// import 'package:biapay_app/presentation/common/biapay_ui_package.dart';

// import 'package:flutter/material.dart';
// import 'package:flutter_hooks/flutter_hooks.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';

// class EmailForm extends HookWidget {
//   const EmailForm({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final TextEditingController emailController =
//         useTextEditingController(text: 'jubair.39x@gmail.com');
//     final _formKey = useMemoized(() => GlobalKey<FormState>());

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
//                   Padding(
//                     padding:
//                         EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
//                     child: const BiaText(
//                       "Let's create a business account !!",
//                       textType: TextType.headLine5,
//                     ),
//                   ),
//                   BiaTextField(
//                       padding: EdgeInsets.symmetric(
//                           vertical: 20.h, horizontal: 20.w),
//                       inputType: const InputFieldType.email(),
//                       controller: emailController,
//                       textColor: Colors.black,
//                       hintColor: Colors.deepPurple,
//                       hint: 'email_your'.tr,
//                       label: "email_reg".tr),
//                   BiaButton(
//                       text: 'next'.tr,
//                       color: Theme.of(context).colorScheme.secondary,
//                       onPressed: () {
//                         if (_formKey.currentState!.validate()) {
//                           Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                   builder: (context) => PasswordForm(
//                                       countryCode: '',
//                                       phone: '',
//                                       emailAddress: emailController.text)));
//                         }
//                       })
//                 ],
//               ),
//             ),
//           ),
//         ));
//   }
// }
