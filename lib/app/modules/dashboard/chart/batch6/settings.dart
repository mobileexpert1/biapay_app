// import 'package:biapay_app/presentation/common/biapay_ui_package.dart';
// import 'package:flutter/material.dart';

// class Settings extends StatelessWidget {
//   const Settings({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return BiaScaffold(
//         appBar: BiaAppBar.simple('Settings'),
//         body: Padding(
//           padding: const EdgeInsets.symmetric(vertical: 10),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Padding(
//                 padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10),
//                 child: const BiaText(
//                   "Settings",
//                   color: Colors.white,
//                   fontSize: 20,
//                 ),
//               ),
//               Container(
//                 margin: EdgeInsets.only(bottom: 10.h, top: 10.h),
//                 padding: EdgeInsets.all(20.h),
//                 width: double.infinity,
//                 decoration: const BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.only(
//                     topRight: Radius.circular(15),
//                     topLeft: Radius.circular(15),
//                     bottomRight: Radius.circular(15),
//                     bottomLeft: Radius.circular(15),
//                   ),
//                 ),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Row(
//                       children: [
//                         Icon(
//                           Icons.fingerprint_outlined,
//                           color: Colors.black,
//                           size: 30.sp,
//                         ),
//                         const BiaText(
//                           'Backgroung picture',
//                           fontSize: 18,
//                         ),
//                       ],
//                     ),
//                     Icon(
//                       Icons.chevron_right_outlined,
//                       color: Colors.black,
//                       size: 30.sp,
//                     )
//                   ],
//                 ),
//               ),
//               Container(
//                 margin: EdgeInsets.only(bottom: 10.h, top: 10.h),
//                 padding: EdgeInsets.all(20.h),
//                 width: double.infinity,
//                 decoration: const BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.only(
//                     topRight: Radius.circular(15),
//                     topLeft: Radius.circular(15),
//                     bottomRight: Radius.circular(15),
//                     bottomLeft: Radius.circular(15),
//                   ),
//                 ),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Row(
//                       children: [
//                         Icon(
//                           Icons.face_retouching_natural,
//                           color: Colors.black,
//                           size: 30.sp,
//                         ),
//                         const BiaText(
//                           'Language',
//                           fontSize: 18,
//                         ),
//                       ],
//                     ),
//                     Icon(
//                       Icons.chevron_right_outlined,
//                       color: Colors.black,
//                       size: 30.sp,
//                     )
//                   ],
//                 ),
//               ),
//               Container(
//                 margin: EdgeInsets.only(bottom: 10.h, top: 10.h),
//                 padding: EdgeInsets.all(20.h),
//                 width: double.infinity,
//                 decoration: const BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.only(
//                     topRight: Radius.circular(15),
//                     topLeft: Radius.circular(15),
//                     bottomRight: Radius.circular(15),
//                     bottomLeft: Radius.circular(15),
//                   ),
//                 ),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Row(
//                       children: [
//                         Icon(
//                           Icons.face_retouching_natural,
//                           color: Colors.black,
//                           size: 30.sp,
//                         ),
//                         const BiaText(
//                           'My accounts',
//                           fontSize: 18,
//                         ),
//                       ],
//                     ),
//                     Icon(
//                       Icons.chevron_right_outlined,
//                       color: Colors.black,
//                       size: 30.sp,
//                     )
//                   ],
//                 ),
//               ),
//               Container(
//                 margin: EdgeInsets.only(bottom: 10.h, top: 10.h),
//                 padding: EdgeInsets.all(20.h),
//                 width: double.infinity,
//                 decoration: const BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.only(
//                     topRight: Radius.circular(15),
//                     topLeft: Radius.circular(15),
//                     bottomRight: Radius.circular(15),
//                     bottomLeft: Radius.circular(15),
//                   ),
//                 ),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Row(
//                       children: [
//                         Icon(
//                           Icons.face_retouching_natural,
//                           color: Colors.black,
//                           size: 30.sp,
//                         ),
//                         const BiaText(
//                           'Authentication services',
//                           fontSize: 18,
//                         ),
//                       ],
//                     ),
//                     Icon(
//                       Icons.chevron_right_outlined,
//                       color: Colors.black,
//                       size: 30.sp,
//                     )
//                   ],
//                 ),
//               ),
//               Container(
//                 margin: EdgeInsets.only(bottom: 10.h, top: 10.h),
//                 padding: EdgeInsets.all(20.h),
//                 width: double.infinity,
//                 decoration: const BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.only(
//                     topRight: Radius.circular(15),
//                     topLeft: Radius.circular(15),
//                     bottomRight: Radius.circular(15),
//                     bottomLeft: Radius.circular(15),
//                   ),
//                 ),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Row(
//                       children: [
//                         Icon(
//                           Icons.face_retouching_natural,
//                           color: Colors.black,
//                           size: 30.sp,
//                         ),
//                         const BiaText(
//                           'Notification options',
//                           fontSize: 18,
//                         ),
//                       ],
//                     ),
//                     Icon(
//                       Icons.chevron_right_outlined,
//                       color: Colors.black,
//                       size: 30.sp,
//                     )
//                   ],
//                 ),
//               ),
//               Container(
//                 margin: EdgeInsets.only(bottom: 10.h, top: 10.h),
//                 padding: EdgeInsets.all(20.h),
//                 width: double.infinity,
//                 decoration: const BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.only(
//                     topRight: Radius.circular(15),
//                     topLeft: Radius.circular(15),
//                     bottomRight: Radius.circular(15),
//                     bottomLeft: Radius.circular(15),
//                   ),
//                 ),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Row(
//                       children: [
//                         Icon(
//                           Icons.face_retouching_natural,
//                           color: Colors.black,
//                           size: 30.sp,
//                         ),
//                         const BiaText(
//                           'Biometric options',
//                           fontSize: 18,
//                         ),
//                       ],
//                     ),
//                     Icon(
//                       Icons.chevron_right_outlined,
//                       color: Colors.black,
//                       size: 30.sp,
//                     )
//                   ],
//                 ),
//               ),
//               Container(
//                 margin: EdgeInsets.only(bottom: 10.h, top: 10.h),
//                 padding: EdgeInsets.all(20.h),
//                 width: double.infinity,
//                 decoration: const BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.only(
//                     topRight: Radius.circular(15),
//                     topLeft: Radius.circular(15),
//                     bottomRight: Radius.circular(15),
//                     bottomLeft: Radius.circular(15),
//                   ),
//                 ),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Row(
//                       children: [
//                         Icon(
//                           Icons.face_retouching_natural,
//                           color: Colors.black,
//                           size: 30.sp,
//                         ),
//                         const BiaText(
//                           'Change password',
//                           fontSize: 18,
//                         ),
//                       ],
//                     ),
//                     Icon(
//                       Icons.chevron_right_outlined,
//                       color: Colors.black,
//                       size: 30.sp,
//                     )
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ));
//   }
// }
