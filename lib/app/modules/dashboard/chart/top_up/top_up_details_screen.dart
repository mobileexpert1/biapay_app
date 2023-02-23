// import 'package:biapay_app/presentation/common/biapay_ui_package.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// class TopUpDetailsScreen extends StatelessWidget {
//   const TopUpDetailsScreen({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: const BiaAppBar(),
//       body: Container(
//         margin: EdgeInsets.all(15.w),
//         padding: EdgeInsets.all(15.w),
//         decoration: BoxDecoration(
//             color: Colors.white, borderRadius: BorderRadius.circular(15.sp)),
//         child: Row(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Container(
//               padding: const EdgeInsets.all(5),
//               decoration: BoxDecoration(
//                   shape: BoxShape.circle,
//                   border: Border.all(color: Colors.blue)),
//               child: Icon(CupertinoIcons.down_arrow,
//                   size: 40.sp, color: Colors.blue),
//             ),
//             SizedBox(
//               width: 20.w,
//             ),
//             Expanded(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: const [
//                       BiaText(
//                         'Recieved From',
//                         textType: TextType.headLine6,
//                       ),
//                       BiaText(
//                         '+ INR 20.0',
//                         textType: TextType.headLine6,
//                       )
//                     ],
//                   ),
//                   BiaText(
//                     '7453580003-34',
//                     padding: EdgeInsets.symmetric(vertical: 5.h),
//                     color: Colors.grey,
//                   ),
//                   const BiaText(
//                     'Success',
//                     color: Colors.blue,
//                     textType: TextType.headLine6,
//                   ),
//                   Padding(
//                     padding: EdgeInsets.symmetric(vertical: 10.h),
//                     child: const Divider(),
//                   ),
//                   SizedBox(
//                     width: 350.w,
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         const BiaText(
//                           'Paid',
//                           textType: TextType.headLine6,
//                         ),
//                         SizedBox(
//                           width: 120.w,
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: const [
//                               BiaText(
//                                 '-',
//                                 textType: TextType.headLine6,
//                               ),
//                               BiaText(
//                                 'INR 10.00',
//                                 textType: TextType.headLine6,
//                               ),
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   SizedBox(
//                     width: 350.w,
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         const BiaText(
//                           'Total Payable',
//                           textType: TextType.headLine6,
//                         ),
//                         SizedBox(
//                           width: 120.w,
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: const [
//                               BiaText(
//                                 '-',
//                                 textType: TextType.headLine6,
//                               ),
//                               BiaText(
//                                 'INR 10.00',
//                                 textType: TextType.headLine6,
//                               ),
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   Padding(
//                     padding: EdgeInsets.symmetric(vertical: 10.h),
//                     child: const Divider(),
//                   ),
//                   const BiaText(
//                     'Description',
//                     textType: TextType.headLine6,
//                   ),
//                   SizedBox(
//                     height: 30.h,
//                   ),
//                   Padding(
//                     padding: EdgeInsets.symmetric(vertical: 10.h),
//                     child: const Divider(),
//                   ),
//                   SizedBox(
//                     width: 350.w,
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         const BiaText(
//                           'Transacted on',
//                           fontWeight: FontWeight.bold,
//                         ),
//                         SizedBox(
//                           width: 200.w,
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: const [
//                               BiaText(
//                                 '-',
//                                 textType: TextType.headLine6,
//                               ),
//                               BiaText(
//                                 'FEB 28, 2021 8.30 PM',
//                               ),
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   SizedBox(
//                     width: 350.w,
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         const BiaText(
//                           'Order ID',
//                           fontWeight: FontWeight.bold,
//                         ),
//                         SizedBox(
//                           width: 200.w,
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: const [
//                               BiaText(
//                                 '-',
//                                 textType: TextType.headLine6,
//                               ),
//                               BiaText(
//                                 '924 947 504',
//                               ),
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
