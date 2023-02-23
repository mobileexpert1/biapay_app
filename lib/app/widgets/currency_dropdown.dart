

// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';
// import 'package:logger/logger.dart';

// class CurrencyDropDown extends StatelessWidget {
//   final CurrencyData? currency;
//   final CurrencyList currencyList;
//   const CurrencyDropDown(
//       {Key? key, required this.currency, required this.currencyList})
//       : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//         decoration: BoxDecoration(
//             color: Colors.green.shade100,
//             borderRadius: BorderRadius.circular(5)),
//         padding: EdgeInsets.symmetric(horizontal: 10.w),
//         child: DropdownButton<CurrencyData>(
//           hint: BiaText(
//             currency!.name,
//           ),
//           // style: Theme.of(context).primaryTextTheme.caption,
//           underline: const SizedBox.shrink(),
//           icon:
//               const Icon(Icons.arrow_drop_down, color: AppColors.colorBlueDark),
//           items: currencyList.currency.map((CurrencyData value) {
//             return DropdownMenuItem(
//               value: value,
//               child: Row(
//                 children: <Widget>[
//                   Text(
//                     value.name,
//                     style: Style.languageStyle,
//                   ),
//                   Icon(
//                     Icons.arrow_drop_down,
//                     size: 25.h,
//                     color: AppColors.colorBlack,
//                   )
//                 ],
//               ),
//             );
//           }).toList(),
//           onChanged: (value) {
//             Get.find<TransactionController>().changeCurrency(value);
//             Logger().d("language selected is: $value");
//           },
//         ));
//   }
// }
