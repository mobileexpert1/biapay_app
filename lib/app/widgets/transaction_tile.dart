// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:date_time_format/date_time_format.dart';

// class TransactionTile extends StatelessWidget {
//   final TransactionData transactionData;
//   const TransactionTile({Key? key, required this.transactionData})
//       : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final DateTime date = DateTime(
//         transactionData.initiatedAt.date.year,
//         transactionData.initiatedAt.date.month,
//         transactionData.initiatedAt.date.day,
//         transactionData.initiatedAt.time.hour,
//         transactionData.initiatedAt.time.minute,
//         transactionData.initiatedAt.time.second);
//     return Row(
//       children: [
//         Container(
//           padding: const EdgeInsets.all(5),
//           decoration: BoxDecoration(
//               shape: BoxShape.circle, border: Border.all(color: Colors.blue)),
//           child:
//               Icon(CupertinoIcons.down_arrow, size: 40.sp, color: Colors.blue),
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
//                 children: [
//                   BiaText(
//                     'Recieved From',
//                     padding: EdgeInsets.symmetric(vertical: 5.h),
//                     color: Colors.grey,
//                   ),
//                   BiaText(
//                     '+ ${transactionData.orderCurrency} ${transactionData.orderAmount}',
//                     textType: TextType.headLine6,
//                   )
//                 ],
//               ),
//               BiaText(
//                 transactionData.clientUserEmail,
//                 textType: TextType.headLine6,
//               ),
//               BiaText(
//                 date.format(DateTimeFormats.american),
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
