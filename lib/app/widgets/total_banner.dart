// import 'package:biapay_app/app/widgets/common/bia_text.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// class TotalBanner extends StatelessWidget {
//   final TotalData data;
//   const TotalBanner({Key? key, required this.data}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final ColorScheme _themeColor = Theme.of(context).colorScheme;

//     return Container(
//       padding: EdgeInsets.symmetric(vertical: 20.h),
//       margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
//       decoration: BoxDecoration(
//           color: Theme.of(context).colorScheme.secondary,
//           borderRadius: BorderRadius.circular(20)),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceAround,
//         children: [
//           Column(
//             children: [
//               const BiaText(
//                 'Total\nClients',
//                 align: TextAlign.center,
//                 color: Colors.white,
//                 textType: TextType.headLine6,
//               ),
//               SizedBox(
//                 height: 10.h,
//               ),
//               BiaText(
//                 data.clients.toString(),
//                 color: Theme.of(context).colorScheme.primary,
//                 textType: TextType.headLine3,
//               )
//             ],
//           ),
//           SizedBox(
//             height: 80.h,
//             child: VerticalDivider(
//               thickness: 2,
//               color: _themeColor.primary,
//             ),
//           ),
//           Column(
//             children: [
//               const BiaText(
//                 'Total\nTransaction',
//                 align: TextAlign.center,
//                 color: Colors.white,
//                 textType: TextType.headLine6,
//               ),
//               SizedBox(
//                 height: 10.h,
//               ),
//               BiaText(
//                 data.transaction.toString(),
//                 color: Theme.of(context).colorScheme.primary,
//                 textType: TextType.headLine3,
//               )
//             ],
//           ),
//           SizedBox(
//             height: 80.h,
//             child: VerticalDivider(
//               thickness: 2,
//               color: _themeColor.primary,
//             ),
//           ),
//           Column(
//             children: [
//               const BiaText(
//                 'Today',
//                 align: TextAlign.center,
//                 color: Colors.white,
//                 textType: TextType.headLine6,
//               ),
//               SizedBox(
//                 height: 10.h,
//               ),
//               BiaText(
//                 data.today.toString(),
//                 color: Theme.of(context).colorScheme.primary,
//                 textType: TextType.headLine3,
//               )
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }
