// import 'package:biapay_app/domain/i_info_provider.dart';
// import 'package:biapay_app/infustructure/app/info_provider.dart';
// import 'package:biapay_app/presentation/app/widget/currency_dropdown.dart';
// import 'package:biapay_app/presentation/app/widget/custom_date_range_picker.dart';
// import 'package:biapay_app/presentation/app/widget/transaction_tile.dart';
// import 'package:biapay_app/presentation/common/biapay_ui_package.dart';
// import 'package:biapay_app/service/home/transaction/transaction_controller.dart';
// import 'package:biapay_app/app/widgets/biapay_ui_package.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// import '../../../widgets/common/bia_appbar.dart';
// import '../../../widgets/custom_date_range_picker.dart';
// import '../../transaction/controllers/transaction_controller.dart';
//
// class TransactionScreen extends StatelessWidget {
//   const TransactionScreen({Key? key}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     // final _formKey = useMemoized(() => GlobalKey<FormState>());
//     return Scaffold(
//         appBar:  BiaAppBar(),
//         body: GetBuilder<TransactionController>(
//           init: TransactionController(
//             context: context,
//             infoProvider: Get.put<IInfoProvider>(InfoProvider()),
//           ),
//           builder: (state) {
//             return Container(
//               margin: EdgeInsets.all(15.w),
//               padding: EdgeInsets.all(15.w),
//               decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.circular(15.sp)),
//               child: Column(
//                 children: [
//                   Container(
//                     padding: EdgeInsets.all(10.w),
//                     margin: EdgeInsets.only(bottom: 20.h),
//                     decoration: BoxDecoration(
//                         border: Border.all(color: Colors.orange),
//                         borderRadius: BorderRadius.circular(15.sp)),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.end,
//                       children: [
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             const BiaText(
//                               'Date Range: ',
//                               textType: TextType.headLine6,
//                             ),
//                             GestureDetector(
//                               onTap: () {
//                                 showDialog(
//                                     context: context,
//                                     builder: (context) => CustomDateRangePicker(
//                                         onDateChanged: (dateTimeRange) =>
//                                             state.setDateRange(
//                                                 dateTimeRange: dateTimeRange)));
//                               },
//                               child: Container(
//                                   padding: EdgeInsets.all(10.sp),
//                                   decoration: BoxDecoration(
//                                     color: Colors.blue.shade100,
//                                     borderRadius: BorderRadius.circular(5),
//                                   ),
//                                   child: BiaText(
//                                     state.dateText,
//                                   )),
//                             ),
//                           ],
//                         ),
//                         SizedBox(
//                           height: 10.h,
//                         ),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             const BiaText(
//                               'Currency: ',
//                               textType: TextType.headLine6,
//                             ),
//                             CurrencyDropDown(
//                               currency: state.currency,
//                               currencyList: state.currencyList,
//                             ),
//                           ],
//                         ),
//                         SizedBox(
//                           width: 180.w,
//                           // h
//                           child: BiaButton(
//                             text: 'Load Data',
//                             padding: const EdgeInsets.symmetric(vertical: 10),
//                             margin: const EdgeInsets.symmetric(vertical: 5),
//                             onPressed: () {
//                               state.loadData();
//                             },
//                             color: Colors.deepPurple.shade100,
//                             textType: TextType.body1,
//                           ),
//                         )
//                       ],
//                     ),
//                   ),
//
//                   if (state.showReport)
//                     Container(
//                       width: double.infinity,
//                       decoration: BoxDecoration(
//                         color: Colors.deepOrange.shade100,
//                       ),
//                       padding: EdgeInsets.all(15.w),
//                       margin: EdgeInsets.only(bottom: 15.h),
//                       alignment: Alignment.center,
//                       child: const BiaText(
//                         'Transaction Report',
//                         textType: TextType.headLine5,
//                       ),
//                     ),
//                   if (state.showReport)
//                     Expanded(
//                       child: ListView.builder(
//                           shrinkWrap: true,
//                           itemCount: state.transaction.data.length,
//                           itemBuilder: (context, index) => TransactionTile(
//                                 transactionData: state.transaction.data[index],
//                               )),
//                     )
//                   // const TransactionTile()
//                 ],
//               ),
//             );
//           },
//         ));
//   }
// }
