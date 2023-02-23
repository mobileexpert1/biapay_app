// import 'package:biapay_app/presentation/common/biapay_ui_package.dart';
// import 'package:flutter/material.dart';

// class ExchangeRate extends StatelessWidget {
//   const ExchangeRate({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     TextEditingController rate = TextEditingController();
//     return BiaScaffold(
//         appBar: BiaAppBar.simple('View exchange Rate'),
//         body: Column(
//           children: [
//             Container(
//               margin: EdgeInsets.only(bottom: 19.h, top: 15.h),
//               padding: EdgeInsets.all(20.h),
//               width: double.infinity,
//               decoration: const BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.only(
//                   topRight: Radius.circular(15),
//                   topLeft: Radius.circular(15),
//                   bottomRight: Radius.circular(15),
//                   bottomLeft: Radius.circular(15),
//                 ),
//               ),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Column(
//                         // crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Row(
//                             children: [
//                               Padding(
//                                 padding: const EdgeInsets.all(8.0),
//                                 child: CircleAvatar(
//                                   radius: 40.h,
//                                   backgroundImage: NetworkImage(
//                                       "https://img.icons8.com/fluency/2x/usa-circular.png"),
//                                 ),
//                               ),
//                               Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   BiaText(
//                                     'USA',
//                                     fontSize: 18,
//                                   ),
//                                   SizedBox(
//                                     width: 20.w,
//                                   ),
//                                   BiaText(
//                                     'Indian rupee',
//                                     fontSize: 13,
//                                     color: Colors.grey,
//                                   ),
//                                 ],
//                               ),
//                             ],
//                           ),
//                         ],
//                       ),
//                       Icon(
//                         Icons.arrow_drop_down,
//                         color: Colors.black,
//                         size: 30.sp,
//                       )
//                     ],
//                   ),
//                   const Divider(),
//                   BiaText("Amount"),
//                   Padding(
//                     padding:
//                         const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
//                     child: BiaTextField(
//                       borderColor: Colors.blue[900],
//                       controller: rate,
//                       hint: "740.0",
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             Icon(Icons.integration_instructions_outlined),
//             Container(
//               margin: EdgeInsets.only(bottom: 19.h, top: 15.h),
//               padding: EdgeInsets.all(20.h),
//               width: double.infinity,
//               decoration: const BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.only(
//                   topRight: Radius.circular(15),
//                   topLeft: Radius.circular(15),
//                   bottomRight: Radius.circular(15),
//                   bottomLeft: Radius.circular(15),
//                 ),
//               ),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Column(
//                         // crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Row(
//                             children: [
//                               Padding(
//                                 padding: const EdgeInsets.all(8.0),
//                                 child: CircleAvatar(
//                                   radius: 40.h,
//                                   backgroundImage: NetworkImage(
//                                       "https://img.icons8.com/fluency/2x/india-circular.png"),
//                                 ),
//                               ),
//                               Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   BiaText(
//                                     'INR',
//                                     fontSize: 18,
//                                   ),
//                                   SizedBox(
//                                     width: 20.w,
//                                   ),
//                                   BiaText(
//                                     'Indian rupee',
//                                     fontSize: 13,
//                                     color: Colors.grey,
//                                   ),
//                                 ],
//                               ),
//                             ],
//                           ),
//                         ],
//                       ),
//                       Icon(
//                         Icons.arrow_drop_down,
//                         color: Colors.black,
//                         size: 30.sp,
//                       )
//                     ],
//                   ),
//                   const Divider(),
//                   BiaText("Amount"),
//                   Padding(
//                     padding:
//                         const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
//                     child: BiaTextField(
//                       borderColor: Colors.blue[900],
//                       controller: rate,
//                       hint: "740.0",
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ));
//   }
// }
