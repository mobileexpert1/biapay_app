// // import 'package:biapay_app/presentation/common/bia_app.dart';
// // import 'package:biapay_app/presentation/common/widgets/common/bia_dropdown.dart';
// import 'package:biapay_app/presentation/app/home/chart/ornob_2/add_new_invoicing.dart';
// import 'package:biapay_app/presentation/common/biapay_ui_package.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_hooks/flutter_hooks.dart';
// import 'package:get/get.dart';

// class Invoicing1 extends HookWidget {
//   const Invoicing1({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return BiaScaffold(
//       appBar: BiaAppBar.simple('Invoicing'),
//       body: Column(
//         children: [
//           Container(
//             margin: EdgeInsets.only(left: 20.h, right: 20.h),
//             width: double.infinity,
//             height: 80.h,
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 BiaText(
//                   'Invoices',
//                   fontSize: 28.h,
//                   color: Colors.white,
//                   fontWeight: FontWeight.w500,
//                 ),
//                 TextButton(
//                     onPressed: () {
//                       Get.to(() => const AddNewInvoicing());
//                     },
//                     child: Row(
//                       children: <Widget>[
//                         Icon(
//                           Icons.add_circle_outline,
//                           color: Colors.white,
//                           size: 35.h,
//                         ),
//                         BiaText(
//                           'Add new',
//                           fontSize: 20.h,
//                           color: Colors.white,
//                         )
//                       ],
//                     )),
//               ],
//             ),
//           ),
//           BiaTextField(
//             padding: EdgeInsets.only(left: 20.h, right: 20.h, bottom: 20.h),
//             controller: useTextEditingController(),
//             hint: "Search in records",
//             suffixIcon: const Icon(Icons.search),
//           ),
//           Container(
//               margin: EdgeInsets.only(left: 20.h, right: 20.h, bottom: 15),
//               decoration: const BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.only(
//                     topRight: Radius.circular(15),
//                     topLeft: Radius.circular(15),
//                     bottomRight: Radius.circular(15),
//                     bottomLeft: Radius.circular(15),
//                   )),
//               padding: const EdgeInsets.all(15),
//               child: Row(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       BiaText(
//                         '2343534645265',
//                         fontSize: 20.h,
//                         fontWeight: FontWeight.bold,
//                       ),
//                       SizedBox(
//                         height: 10.h,
//                       ),
//                       Row(
//                         children: const [
//                           BiaText(
//                             'order no:- ',
//                             fontWeight: FontWeight.bold,
//                           ),
//                           BiaText(
//                             '565657',
//                           )
//                         ],
//                       ),
//                       SizedBox(
//                         height: 5.h,
//                       ),
//                       Row(
//                         children: const [
//                           BiaText(
//                             'Invoice date:- ',
//                             fontWeight: FontWeight.bold,
//                           ),
//                           BiaText(
//                             '26-06-2021',
//                           )
//                         ],
//                       ),
//                       SizedBox(
//                         height: 5.h,
//                       ),
//                       Row(
//                         children: const [
//                           BiaText(
//                             'Total:- ',
//                             fontWeight: FontWeight.bold,
//                           ),
//                           BiaText(
//                             '565654 rs',
//                           )
//                         ],
//                       ),
//                     ],
//                   ),
//                   const Icon(Icons.more_horiz_rounded),
//                 ],
//               )),
//           Container(
//               margin: EdgeInsets.only(left: 20.h, right: 20.h, bottom: 15),
//               decoration: const BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.only(
//                     topRight: Radius.circular(15),
//                     topLeft: Radius.circular(15),
//                     bottomRight: Radius.circular(15),
//                     bottomLeft: Radius.circular(15),
//                   )),
//               padding: const EdgeInsets.all(15),
//               child: Row(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       BiaText(
//                         '2343534645265',
//                         fontSize: 20.h,
//                         fontWeight: FontWeight.bold,
//                       ),
//                       SizedBox(
//                         height: 10.h,
//                       ),
//                       Row(
//                         children: const [
//                           BiaText(
//                             'order no:- ',
//                             fontWeight: FontWeight.bold,
//                           ),
//                           BiaText(
//                             '565657',
//                           )
//                         ],
//                       ),
//                       SizedBox(
//                         height: 5.h,
//                       ),
//                       Row(
//                         children: const [
//                           BiaText(
//                             'Invoice date:- ',
//                             fontWeight: FontWeight.bold,
//                           ),
//                           BiaText(
//                             '26-06-2021',
//                           )
//                         ],
//                       ),
//                       SizedBox(
//                         height: 5.h,
//                       ),
//                       Row(
//                         children: const [
//                           BiaText(
//                             'Total:- ',
//                             fontWeight: FontWeight.bold,
//                           ),
//                           BiaText(
//                             '565654 rs',
//                           )
//                         ],
//                       ),
//                     ],
//                   ),
//                   const Icon(Icons.more_horiz_rounded),
//                 ],
//               )),
//         ],
//       ),
//     );
//   }
// }
