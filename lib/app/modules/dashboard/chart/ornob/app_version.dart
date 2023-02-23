// import 'package:biapay_app/presentation/app/home/chart/ornob/app_version2.dart';
// import 'package:biapay_app/presentation/common/biapay_ui_package.dart';
// import 'package:flutter/cupertino.dart';

// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';

// class AppVersion extends StatefulWidget {
//   const AppVersion({Key? key}) : super(key: key);

//   @override
//   _AppVersionState createState() => _AppVersionState();
// }

// class _AppVersionState extends State<AppVersion> {
//   @override
//   Widget build(BuildContext context) {
//     return BiaScaffold(
//       appBar: BiaAppBar.simple('App version'),
//       body: Container(
//         padding: EdgeInsets.only(top: 30.h),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             BiaButton.withRightArrow(
//               onPressed: () {
//                 Get.to(() => const AppVersion2());
//               },
//               text: 'Automatic update',
//             ),
//             SizedBox(
//               height: 15.h,
//             ),
//             BiaText('Phone will automatically install updates',
//                 fontSize: 20.h, color: Colors.white, isItalic: true),
//             SizedBox(
//               height: 300.h,
//             ),
//             Center(
//                 child: BiaText(
//               'App version 01.2.3',
//               fontSize: 35.h,
//               color: Colors.white,
//             )),
//             Center(
//                 child: BiaText(
//               'Newer version available.Please update!',
//               fontSize: 20.h,
//               color: Colors.red,
//             )),
//           ],
//         ),
//       ),
//     );
//   }
// }
