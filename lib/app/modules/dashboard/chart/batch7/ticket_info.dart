// import 'package:biapay_app/presentation/common/biapay_ui_package.dart';
// import 'package:flutter/material.dart';

// class TicketInfo extends StatelessWidget {
//   const TicketInfo({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     TextEditingController messages = TextEditingController();
//     return BiaScaffold(
//       appBar: BiaAppBar.simple('New Ticket'),
//       body: SingleChildScrollView(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: <Widget>[
//             Padding(
//               padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 0),
//               child: BiaText(
//                 'Ticket Information',
//                 fontSize: 20,
//                 color: Colors.white,
//               ),
//             ),
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
//               child: Row(
//                 children: [
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       BiaText("TIC-FOPCTM",
//                           fontSize: 14, fontWeight: FontWeight.w400),
//                       BiaText("Account type",
//                           fontSize: 14, fontWeight: FontWeight.w300),
//                       SizedBox(
//                         height: 40.h,
//                       ),
//                       BiaText("16-05-2021 / 6:00 AM",
//                           fontSize: 14, fontWeight: FontWeight.w400),
//                       BiaText("Date",
//                           fontSize: 14, fontWeight: FontWeight.w300),
//                       SizedBox(
//                         height: 40.h,
//                       ),
//                       BiaText("Open",
//                           fontSize: 14,
//                           fontWeight: FontWeight.w400,
//                           color: Colors.green),
//                       BiaText("Status",
//                           fontSize: 14, fontWeight: FontWeight.w400),
//                     ],
//                   ),
//                   SizedBox(
//                     width: 160.w,
//                   ),
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       BiaText("New ticket",
//                           fontSize: 14, fontWeight: FontWeight.w400),
//                       BiaText("Subject",
//                           fontSize: 14, fontWeight: FontWeight.w300),
//                       SizedBox(
//                         height: 40.h,
//                       ),
//                       BiaText("Normal",
//                           fontSize: 14, fontWeight: FontWeight.w400),
//                       BiaText("Priority",
//                           fontSize: 14, fontWeight: FontWeight.w300),
//                       SizedBox(
//                         height: 40.h,
//                       ),
//                       BiaText(""),
//                       BiaText(""),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
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
//                   BiaText("Message", fontSize: 22, fontWeight: FontWeight.bold),
//                   BiaText(
//                       "Lorem ipsum dolor sit amet. consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad ",
//                       fontSize: 14,
//                       fontWeight: FontWeight.w300),
//                   SizedBox(
//                     height: 40.h,
//                   ),
//                   BiaTextField(controller: messages, hint: "message")
//                 ],
//               ),
//             ),
//             Container(
//               height: 1000.h,
//               child: Expanded(
//                 child: ListView.builder(
//                     itemCount: 6,
//                     itemBuilder: (BuildContext context, int index) {
//                       return Container(
//                         margin: EdgeInsets.only(bottom: 19.h, top: 15.h),
//                         padding: EdgeInsets.all(20.h),
//                         width: double.infinity,
//                         decoration: const BoxDecoration(
//                           color: Colors.white,
//                           borderRadius: BorderRadius.only(
//                             topRight: Radius.circular(15),
//                             topLeft: Radius.circular(15),
//                             bottomRight: Radius.circular(15),
//                             bottomLeft: Radius.circular(15),
//                           ),
//                         ),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Row(
//                                   children: [
//                                     Padding(
//                                       padding: const EdgeInsets.all(8.0),
//                                       child: CircleAvatar(
//                                         radius: 40.h,
//                                         backgroundImage: NetworkImage(
//                                             "https://cdn3.vectorstock.com/i/1000x1000/88/12/face-young-man-in-frame-circular-avatar-character-vector-28828812.jpg"),
//                                       ),
//                                     ),
//                                     Column(
//                                       crossAxisAlignment:
//                                           CrossAxisAlignment.start,
//                                       children: [
//                                         BiaText(
//                                           'John Doe',
//                                           fontSize: 18,
//                                         ),
//                                         SizedBox(
//                                           width: 20.w,
//                                         ),
//                                         BiaText(
//                                           '24-06-2021',
//                                           fontSize: 13,
//                                           color: Colors.grey,
//                                         ),
//                                         SizedBox(
//                                           width: 20.w,
//                                         ),
//                                         Container(
//                                           width: 300.w,
//                                           child: BiaText(
//                                             'Lorem ipsum dolor sit amet. consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nosturd ',
//                                             fontSize: 13,
//                                             maxLine: 16,
//                                             color: Colors.black,
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                   ],
//                                 ),
//                               ],
//                             ),
//                           ],
//                         ),
//                       );
//                     }),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
