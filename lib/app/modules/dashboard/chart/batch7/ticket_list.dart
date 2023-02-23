// import 'package:biapay_app/presentation/common/biapay_ui_package.dart';
// import 'package:flutter/material.dart';

// class TicketList extends StatelessWidget {
//   const TicketList({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return BiaScaffold(
//       appBar: BiaAppBar.simple('Ticket'),
//       body: SingleChildScrollView(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: <Widget>[
//             Padding(
//               padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 0),
//               child: BiaText(
//                 'My Ticket',
//                 fontSize: 20,
//                 color: Colors.white,
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
//                                 Column(
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: [
//                                     BiaText(
//                                       'New ticket',
//                                       fontSize: 18,
//                                       fontWeight: FontWeight.bold,
//                                       color: Colors.blue[900],
//                                     ),
//                                     SizedBox(
//                                       width: 20.w,
//                                     ),
//                                     BiaText(
//                                       'TIC-FOPCTM',
//                                       fontSize: 13,
//                                       color: Colors.blue[900],
//                                     ),
//                                     SizedBox(
//                                       width: 20.w,
//                                     ),
//                                     BiaText(
//                                       '16-0502021 / 06:00 PM',
//                                       fontSize: 13,
//                                       color: Colors.blue[900],
//                                     ),
//                                   ],
//                                 ),
//                               ],
//                             ),
//                             Icon(
//                               Icons.chevron_right_outlined,
//                               color: Colors.black,
//                               size: 30.sp,
//                             )
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
