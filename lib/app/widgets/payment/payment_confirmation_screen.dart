// import 'package:biapay_app/presentation/common/biapay_ui_package.dart';
// import 'package:biapay_app/service/qr/qr_controller.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_hooks/flutter_hooks.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';

// class PaymentConfirmationScreen extends HookWidget {
//   const PaymentConfirmationScreen({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final _formKey = useMemoized(() => GlobalKey<FormState>());
//     final TextEditingController _money = useTextEditingController();

//     return GetBuilder<QrController>(builder: (controller) {
//       return Scaffold(
//         appBar: const BiaAppBar(),
//         body: Column(
//           children: [
//             SizedBox(height: 40.h),
//             Container(
//               alignment: Alignment.center,
//               margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.w),
//               padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.w),
//               decoration: BoxDecoration(
//                   color: Colors.white, borderRadius: BorderRadius.circular(10)),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Container(
//                     width: double.infinity,
//                     alignment: Alignment.center,
//                     child: BiaText(
//                       'Account info',
//                       padding: EdgeInsets.symmetric(vertical: 20.h),
//                       textType: TextType.headLine5,
//                       fontWeight: FontWeight.w600,
//                     ),
//                   ),
//                   const BiaText(
//                     'Acc name: Kousik Ambani',
//                     textType: TextType.headLine5,
//                   ),
//                   const BiaText(
//                     'Acc number: 835270325',
//                     textType: TextType.headLine5,
//                   ),
//                   const BiaText(
//                     'Phone: 882375234',
//                     textType: TextType.headLine5,
//                   ),
//                 ],
//               ),
//             ),
//             Container(
//               margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.w),
//               padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.w),
//               decoration: BoxDecoration(
//                   color: Colors.white70,
//                   borderRadius: BorderRadius.circular(5)),
//               child: TextFormField(
//                 key: _formKey,
//                 controller: _money,
//                 validator: validateAmount,
//                 keyboardType: TextInputType.number,
//                 decoration: const InputDecoration(
//                   fillColor: Colors.white,
//                   hintText: 'The amount to be paid',
//                   labelText: 'Enter amount',
//                   filled: true,
//                 ),
//               ),
//             ),
//             BiaButton(
//                 text: 'Confirm Payment',
//                 onPressed: () {
//                   // if (_money.text != null && _formKey.currentState.validate()) {
//                   Get.toNamed('/payment_succeed');
//                   // }
//                 })
//           ],
//         ),
//       );
//     });
//   }

//   String? validateAmount(String? text) {
//     if (text!.isEmpty) {
//       return "empty_field".tr;
//     } else if (double.tryParse(text) == null) {
//       return 'Only number is allowed';
//     }
//     return null;
//   }
// }
