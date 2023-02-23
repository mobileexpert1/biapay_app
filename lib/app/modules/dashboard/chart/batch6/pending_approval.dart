// import 'package:biapay_app/presentation/common/biapay_ui_package.dart';
// import 'package:flutter/material.dart';

// class PendingApprval extends StatelessWidget {
//   const PendingApprval({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return BiaScaffold(
//       appBar: BiaAppBar.simple('Pending approval'),
//       body: SingleChildScrollView(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: <Widget>[
//             Padding(
//               padding: EdgeInsets.symmetric(vertical: 20.h),
//               child: const BiaText(
//                 'Pending approval list',
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
//                 children: const [
//                   Icon(Icons.tune),
//                   BiaText(
//                     'Filter date range, sender, sub-category',
//                     fontSize: 13,
//                   ),
//                 ],
//               ),
//             ),
//             SizedBox(
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
//                                         backgroundImage: const NetworkImage(
//                                             "https://cdn3.vectorstock.com/i/1000x1000/88/12/face-young-man-in-frame-circular-avatar-character-vector-28828812.jpg"),
//                                       ),
//                                     ),
//                                     Column(
//                                       crossAxisAlignment:
//                                           CrossAxisAlignment.start,
//                                       children: [
//                                         const BiaText(
//                                           'John Doe',
//                                           fontSize: 18,
//                                         ),
//                                         SizedBox(
//                                           width: 20.w,
//                                         ),
//                                         const BiaText(
//                                           '24-06-2021',
//                                           fontSize: 13,
//                                           color: Colors.grey,
//                                         ),
//                                         SizedBox(
//                                           width: 20.w,
//                                         ),
//                                         const BiaText(
//                                           'Jackpot / jackpot approval',
//                                           fontSize: 13,
//                                           color: Colors.grey,
//                                         ),
//                                       ],
//                                     ),
//                                   ],
//                                 ),
//                                 Row(
//                                   children: [
//                                     BiaButton.greenButtonInRow(
//                                         text: "Approve", onPressed: () {}),
//                                     SizedBox(
//                                       width: 10.w,
//                                     ),
//                                     BiaButton.greenButtonInRow(
//                                         text: "Reject", onPressed: () {}),
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
