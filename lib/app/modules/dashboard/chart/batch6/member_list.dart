// import 'package:biapay_app/presentation/common/biapay_ui_package.dart';
// import 'package:flutter/material.dart';

// class MemberList extends StatelessWidget {
//   const MemberList({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return BiaScaffold(
//       appBar: BiaAppBar.simple('List of members'),
//       body: SingleChildScrollView(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: <Widget>[
//             Padding(
//               padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 0),
//               child: BiaText(
//                 'All members',
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
//                                 Row(
//                                   children: [
//                                     BiaText(
//                                       'Gurwinder singh',
//                                       fontSize: 18,
//                                     ),
//                                     SizedBox(
//                                       width: 20.w,
//                                     ),
//                                     BiaText(
//                                       '(office member)',
//                                       fontSize: 13,
//                                     ),
//                                   ],
//                                 ),
//                                 Row(
//                                   children: [
//                                     BiaText(
//                                       'Active',
//                                       fontSize: 13,
//                                     ),
//                                     SizedBox(
//                                       width: 20.w,
//                                     ),
//                                     BiaText(
//                                       '20-04-2021',
//                                       fontSize: 13,
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
