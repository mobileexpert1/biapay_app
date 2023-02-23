// import 'package:biapay_app/presentation/common/biapay_ui_package.dart';
// import 'package:flutter/cupertino.dart';
// //import 'package:biapay_app/presentation/common/widgets/common/tutorial_tile.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// class WhatsNew extends StatefulWidget {
//   const WhatsNew({Key? key}) : super(key: key);

//   @override
//   _WhatsNewState createState() => _WhatsNewState();
// }

// class _WhatsNewState extends State<WhatsNew> {
//   @override
//   Widget build(BuildContext context) {
//     return BiaScaffold(
//         appBar: BiaAppBar.simple("what's new?"),
//         body: Container(
//           padding: EdgeInsets.only(top: 20.h),
//           child: ListView(
//             children: [
//               BiaText(
//                 'All news',
//                 fontSize: 30.h,
//                 color: Colors.white,
//               ),
//               Container(
//                 height: 200.h,
//                 margin: EdgeInsets.only(top: 20.h),
//                 padding: EdgeInsets.all(20.h),
//                 decoration: const BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.only(
//                     topLeft: Radius.circular(15),
//                     topRight: Radius.circular(15),
//                     bottomLeft: Radius.circular(15),
//                     bottomRight: Radius.circular(15),
//                   ),
//                 ),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     BiaText(
//                       'John lorem ispum sit amet',
//                       fontSize: 24.h,
//                     ),
//                     SizedBox(
//                       height: 10.h,
//                     ),
//                     BiaText(
//                       "t is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English.",
//                       fontSize: 20.h,
//                       maxLine: 5,
//                     )
//                   ],
//                 ),
//               ),
//               Container(
//                 height: 200.h,
//                 margin: EdgeInsets.only(top: 20.h),
//                 padding: EdgeInsets.all(20.h),
//                 decoration: const BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.only(
//                     topLeft: Radius.circular(15),
//                     topRight: Radius.circular(15),
//                     bottomLeft: Radius.circular(15),
//                     bottomRight: Radius.circular(15),
//                   ),
//                 ),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     BiaText(
//                       'John lorem ispum sit amet',
//                       fontSize: 24.h,
//                     ),
//                     SizedBox(
//                       height: 10.h,
//                     ),
//                     BiaText(
//                       "t is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English.",
//                       fontSize: 20.h,
//                       maxLine: 5,
//                     )
//                   ],
//                 ),
//               ),
//               Container(
//                 height: 200.h,
//                 margin: EdgeInsets.only(top: 20.h),
//                 padding: EdgeInsets.all(20.h),
//                 decoration: const BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.only(
//                     topLeft: Radius.circular(15),
//                     topRight: Radius.circular(15),
//                     bottomLeft: Radius.circular(15),
//                     bottomRight: Radius.circular(15),
//                   ),
//                 ),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     BiaText(
//                       'John lorem ispum sit amet',
//                       fontSize: 24.h,
//                     ),
//                     SizedBox(
//                       height: 10.h,
//                     ),
//                     BiaText(
//                       "t is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English.",
//                       fontSize: 20.h,
//                       maxLine: 5,
//                     )
//                   ],
//                 ),
//               ),
//               Container(
//                 height: 200.h,
//                 margin: EdgeInsets.only(top: 20.h),
//                 padding: EdgeInsets.all(20.h),
//                 decoration: const BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.only(
//                     topLeft: Radius.circular(15),
//                     topRight: Radius.circular(15),
//                     bottomLeft: Radius.circular(15),
//                     bottomRight: Radius.circular(15),
//                   ),
//                 ),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     BiaText(
//                       'John lorem ispum sit amet',
//                       fontSize: 24.h,
//                     ),
//                     SizedBox(
//                       height: 10.h,
//                     ),
//                     BiaText(
//                       "t is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English.",
//                       fontSize: 20.h,
//                       maxLine: 5,
//                     )
//                   ],
//                 ),
//               ),
//               Container(
//                 height: 200.h,
//                 margin: EdgeInsets.only(top: 20.h),
//                 padding: EdgeInsets.all(20.h),
//                 decoration: const BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.only(
//                     topLeft: Radius.circular(15),
//                     topRight: Radius.circular(15),
//                     bottomLeft: Radius.circular(15),
//                     bottomRight: Radius.circular(15),
//                   ),
//                 ),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     BiaText(
//                       'John lorem ispum sit amet',
//                       fontSize: 24.h,
//                     ),
//                     SizedBox(
//                       height: 10.h,
//                     ),
//                     BiaText(
//                       "t is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English.",
//                       fontSize: 20.h,
//                       maxLine: 5,
//                     )
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ));
//   }
// }
