// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// import 'summery_tile.dart';

// class SummaryGrid extends StatelessWidget {
//   final Map<String, int> summary;
//   const SummaryGrid({Key? key, required this.summary}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final List<String> keys = summary.keys.toList();
//     return Container(
//       margin: EdgeInsets.all(20.w),
//       child: GridView.builder(
//           shrinkWrap: true,
//           physics: const NeverScrollableScrollPhysics(),
//           itemCount: summary.length,
//           gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//               mainAxisSpacing: 10.w,
//               crossAxisSpacing: 10.w,
//               childAspectRatio: 1.5,
//               crossAxisCount: 3),
//           itemBuilder: (context, index) => SummaryTile(
//                 value: summary[keys[index]],
//                 title: keys[index],
//               )),
//     );
//   }
// }
