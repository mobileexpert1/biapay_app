// import 'package:biapay_app/presentation/common/biapay_ui_package.dart';
// import 'package:flutter/material.dart';

// class NotificationOptions extends StatelessWidget {
//   const NotificationOptions({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return BiaScaffold(
//         appBar: BiaAppBar.simple('Notification options'),
//         body: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Padding(
//                 padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10),
//                 child: BiaText(
//                   "Notifications",
//                   color: Colors.white,
//                   fontSize: 20,
//                 ),
//               ),
//               Container(
//                 margin: EdgeInsets.only(bottom: 10.h, top: 10.h),
//                 // padding: EdgeInsets.all(20.h),
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
//                         BiaSwitch(
//                             initValue: true, onChanged: (v) {}, title: ""),
//                         BiaText(
//                           'Push notification',
//                           fontSize: 18,
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//               Container(
//                 margin: EdgeInsets.only(bottom: 10.h, top: 10.h),
//                 // padding: EdgeInsets.all(20.h),
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
//                         BiaSwitch(
//                             initValue: false, onChanged: (v) {}, title: ""),
//                         BiaText(
//                           'SMS',
//                           fontSize: 18,
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//               Container(
//                 margin: EdgeInsets.only(bottom: 10.h, top: 10.h),
//                 // padding: EdgeInsets.all(20.h),
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
//                         BiaSwitch(
//                             initValue: true, onChanged: (v) {}, title: ""),
//                         BiaText(
//                           'Email',
//                           fontSize: 18,
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ));
//   }
// }
