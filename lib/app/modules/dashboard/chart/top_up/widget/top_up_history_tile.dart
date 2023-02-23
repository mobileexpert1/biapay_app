// import 'package:biapay_app/presentation/common/biapay_ui_package.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// class TopUpHistoryTile extends StatelessWidget {
//   const TopUpHistoryTile({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: [
//         Container(
//           padding: const EdgeInsets.all(5),
//           decoration: BoxDecoration(
//               shape: BoxShape.circle, border: Border.all(color: Colors.blue)),
//           child:
//               Icon(CupertinoIcons.down_arrow, size: 20.sp, color: Colors.blue),
//         ),
//         SizedBox(
//           width: 20.w,
//         ),
//         Expanded(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: const [
//                   BiaText(
//                     'Recieved',
//                     textType: TextType.headLine6,
//                   ),
//                   BiaText(
//                     '+ INR 20.0',
//                     textType: TextType.headLine6,
//                   )
//                 ],
//               ),
//               const BiaText(
//                 'FEB 28, 2021 8.30 PM',
//                 color: Colors.grey,
//               ),
//               const Divider()
//             ],
//           ),
//         )
//       ],
//     );
//   }
// }
