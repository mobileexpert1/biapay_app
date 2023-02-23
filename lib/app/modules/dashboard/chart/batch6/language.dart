// import 'package:biapay_app/presentation/common/biapay_ui_package.dart';
// import 'package:flutter/material.dart';

// class language extends StatelessWidget {
//   const language({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     bool _isSelected = false;
//     return BiaScaffold(
//         appBar: BiaAppBar.simple('Language'),
//         body: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
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
//                 child: Column(
//                   children: [
//                     Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Row(
//                             children: [
//                               Padding(
//                                 padding: const EdgeInsets.symmetric(
//                                     vertical: 0, horizontal: 7),
//                                 child: Container(
//                                   height: 20,
//                                   width: 20,
//                                   decoration: BoxDecoration(
//                                       color: Colors.red,
//                                       shape: BoxShape.circle),
//                                 ),
//                               ),
//                               BiaText(
//                                 'English',
//                                 fontSize: 18,
//                               ),
//                             ],
//                           ),
//                         ],
//                       ),
//                     ),
//                     Divider(
//                       indent: 25,
//                       color: Colors.grey,
//                       thickness: 1,
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: Row(
//                         children: [
//                           Padding(
//                             padding: const EdgeInsets.symmetric(
//                                 vertical: 0, horizontal: 7),
//                             child: Container(
//                               height: 20,
//                               width: 20,
//                               decoration: BoxDecoration(
//                                   color: Colors.red, shape: BoxShape.circle),
//                             ),
//                           ),
//                           BiaText(
//                             'French',
//                             fontSize: 18,
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ));
//   }
// }
