// import 'package:biapay_app/presentation/app/home/chart/top_up/widget/top_up_history_tile.dart';
// import 'package:biapay_app/presentation/common/biapay_ui_package.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// class TopUpHistoryScreen extends StatelessWidget {
//   const TopUpHistoryScreen({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: const BiaAppBar(),
//       body: Container(
//         decoration: BoxDecoration(
//             color: Colors.white, borderRadius: BorderRadius.circular(15.sp)),
//         margin: EdgeInsets.all(10.w),
//         child: Column(
//           children: [
//             Container(
//               width: double.infinity,
//               decoration: BoxDecoration(
//                 color: Colors.blue.shade100,
//               ),
//               padding: EdgeInsets.all(15.w),
//               alignment: Alignment.center,
//               child: const BiaText(
//                 'TopUp History',
//                 textType: TextType.headLine5,
//               ),
//             ),
//             Expanded(
//               child: Container(
//                 padding: EdgeInsets.symmetric(horizontal: 20.w),
//                 child: ListView.builder(
//                     shrinkWrap: true,
//                     itemCount: 20,
//                     itemBuilder: (context, index) => const TopUpHistoryTile()),
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
