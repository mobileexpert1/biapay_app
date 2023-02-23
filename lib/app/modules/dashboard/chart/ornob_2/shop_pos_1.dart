// //import 'package:biapay_app/presentation/common/widgets/common/bia_dropdown.dart';
// import 'package:biapay_app/presentation/app/home/chart/ornob_2/shop_manager.dart';
// import 'package:biapay_app/presentation/merchant/pos_screen.dart';
// import 'package:biapay_app/presentation/common/biapay_ui_package.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:biapay_app/resources/assets.dart';
// import 'package:get/get.dart';

// class ShopPos1 extends StatelessWidget {
//   const ShopPos1({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return BiaScaffold(
//       appBar: BiaAppBar.simple('Shops/POS'),
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
//                         'Shops manager',
//                         textType: TextType.headLine5,
//                       )
//                     ],
//                   ),
//                   SizedBox(
//                     width: 180.w,
//                   ),
//                   InkWell(
//                     onTap: () {
//                       Get.to(() => const ShopManager());
//                     },
//                     child: Icon(
//                       Icons.arrow_forward_ios,
//                       color: Colors.black,
//                     ),
//                   ),
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
//                         'POS manager',
//                         textType: TextType.headLine5,
//                       )
//                     ],
//                   ),
//                   SizedBox(
//                     width: 200.w,
//                   ),
//                   InkWell(
//                     onTap: () {
//                       Get.to(() => const PosScreen());
//                     },
//                     child: const Icon(
//                       Icons.arrow_forward_ios,
//                       color: Colors.black,
//                     ),
//                   )
//                 ],
//               ),
//               onPressed: () {}),
//         ],
//       ),
//     );
//   }
// }
