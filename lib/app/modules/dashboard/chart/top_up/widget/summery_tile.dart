// import 'package:biapay_app/presentation/common/biapay_ui_package.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// class SummaryTile extends StatelessWidget {
//   final String title;
//   final int? value;
//   const SummaryTile({
//     Key? key,
//     required this.title,
//     required this.value,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//           color: Colors.white24, borderRadius: BorderRadius.circular(10.w)),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           BiaText(
//             value.toString(),
//             textType: TextType.headLine4,
//             fontWeight: FontWeight.bold,
//             color: Colors.white,
//           ),
//           BiaText(
//             title.replaceFirst('total', ''),
//             color: Colors.white,
//           ),
//         ],
//       ),
//     );
//   }
// }
