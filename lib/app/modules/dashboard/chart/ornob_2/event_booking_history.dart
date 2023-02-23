// import 'package:biapay_app/presentation/common/biapay_ui_package.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:biapay_app/presentation/common/widgets/common/bia_text.dart';

// class EventBookingHistory extends StatefulWidget {
//   const EventBookingHistory({Key? key}) : super(key: key);

//   @override
//   _EventBookingHistoryState createState() => _EventBookingHistoryState();
// }

// class _EventBookingHistoryState extends State<EventBookingHistory> {
//   @override
//   Widget build(BuildContext context) {
//     return BiaScaffold(
//       appBar: BiaAppBar.simple('Event booking history'),
//       body: Container(
//         width: double.infinity,
//         padding: EdgeInsets.only(top: 20.h, bottom: 20.h),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             BiaText(
//               'Booking history',
//               fontSize: 35.h,
//               color: Colors.white,
//             ),
//             Container(
//               padding: EdgeInsets.all(30.h),
//               height: 270.h,
//               margin: EdgeInsets.all(70.h),
//               decoration: BoxDecoration(
//                   borderRadius: BorderRadius.only(
//                     topLeft: Radius.circular(20.h),
//                     topRight: Radius.circular(20.h),
//                     bottomLeft: Radius.circular(20.h),
//                     bottomRight: Radius.circular(20.h),
//                   ),
//                   color: Colors.white),
//               child: Column(
//                 children: [
//                   Icon(
//                     Icons.history,
//                     size: 80.h,
//                   ),
//                   SizedBox(
//                     height: 30.h,
//                   ),
//                   BiaText(
//                     'Your recent events will\nbe displayed here',
//                     fontSize: 26.h,
//                     align: TextAlign.center,
//                   ),
//                 ],
//               ),
//             ),
//             BiaButton(
//               text: 'Back',
//               onPressed: () {},
//               color: Colors.lightGreen,
//               textColor: Colors.white,
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
