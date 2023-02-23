// import 'package:biapay_app/presentation/app/home/chart/ornob_2/add_new_customer.dart';
// import 'package:biapay_app/presentation/app/home/chart/ornob_2/invoicing1.dart';
// import 'package:biapay_app/presentation/merchant/product_screen.dart';
// import 'package:biapay_app/presentation/common/biapay_ui_package.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:biapay_app/resources/assets.dart';
// import 'package:get/get.dart';

// class InvoiceManagement extends StatelessWidget {
//   const InvoiceManagement({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return BiaScaffold(
//       appBar: BiaAppBar.simple('Post-invoice management'),
//       body: Column(
//         children: [
//           BiaButton(
//               text: '',
//               margin: const EdgeInsets.symmetric(vertical: 10),
//               borderRadius: 10,
//               customWidget: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Row(
//                     children: [
//                       Image.asset(Assets.analytics, height: 30.h),
//                       const SizedBox(
//                         width: 10,
//                       ),
//                       const BiaText(
//                         'Invoiving',
//                         textType: TextType.headLine5,
//                       )
//                     ],
//                   ),
//                   SizedBox(
//                     width: 220.w,
//                   ),
//                   InkWell(
//                     onTap: () {
//                       Get.to(() => const Invoicing1());
//                     },
//                     child: const Icon(
//                       Icons.arrow_forward_ios,
//                       color: Colors.black,
//                     ),
//                   )
//                 ],
//               ),
//               onPressed: () {}),
//           BiaButton(
//               text: '',
//               margin: const EdgeInsets.symmetric(vertical: 10),
//               borderRadius: 10,
//               customWidget: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Row(
//                     children: [
//                       Image.asset(Assets.analytics, height: 30.h),
//                       const SizedBox(
//                         width: 10,
//                       ),
//                       const BiaText(
//                         'Customers',
//                         textType: TextType.headLine5,
//                       )
//                     ],
//                   ),
//                   SizedBox(
//                     width: 200.w,
//                   ),
//                   InkWell(
//                     onTap: () {
//                       Get.to(() => const AddNewCustomer());
//                     },
//                     child: const Icon(
//                       Icons.arrow_forward_ios,
//                       color: Colors.black,
//                     ),
//                   )
//                 ],
//               ),
//               onPressed: () {}),
//           BiaButton(
//               text: '',
//               margin: const EdgeInsets.symmetric(vertical: 10),
//               borderRadius: 10,
//               customWidget: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Row(
//                     children: [
//                       Image.asset(Assets.analytics, height: 30.h),
//                       const SizedBox(
//                         width: 10,
//                       ),
//                       const BiaText(
//                         'Products',
//                         textType: TextType.headLine5,
//                       )
//                     ],
//                   ),
//                   SizedBox(
//                     width: 220.w,
//                   ),
//                   InkWell(
//                     onTap: () {
//                       Get.to(() => const ProductScreen());
//                     },
//                     child: const Icon(
//                       Icons.arrow_forward_ios,
//                       color: Colors.black,
//                     ),
//                   )
//                 ],
//               ),
//               onPressed: () {}),
//           BiaButton(
//               text: '',
//               margin: const EdgeInsets.symmetric(vertical: 10),
//               borderRadius: 10,
//               customWidget: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Row(
//                     children: [
//                       Image.asset(Assets.analytics, height: 30.h),
//                       const SizedBox(
//                         width: 10,
//                       ),
//                       const BiaText(
//                         'Coupons',
//                         textType: TextType.headLine5,
//                       )
//                     ],
//                   ),
//                   SizedBox(
//                     width: 220.w,
//                   ),
//                   InkWell(
//                     onTap: () {
//                       Get.to(() => Null);
//                     },
//                     child: const Icon(
//                       Icons.arrow_forward_ios,
//                       color: Colors.black,
//                     ),
//                   )
//                 ],
//               ),
//               onPressed: () {}),
//           BiaButton(
//               text: '',
//               margin: const EdgeInsets.symmetric(vertical: 10),
//               borderRadius: 10,
//               customWidget: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Row(
//                     children: [
//                       Image.asset(Assets.analytics, height: 30.h),
//                       const SizedBox(
//                         width: 10,
//                       ),
//                       const BiaText(
//                         'Qutations',
//                         textType: TextType.headLine5,
//                       )
//                     ],
//                   ),
//                   SizedBox(
//                     width: 220.w,
//                   ),
//                   const Icon(
//                     Icons.arrow_forward_ios,
//                     color: Colors.black,
//                   )
//                 ],
//               ),
//               onPressed: () {}),
//         ],
//       ),
//     );
//   }
// }
