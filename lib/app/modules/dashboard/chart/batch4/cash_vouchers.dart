// import 'package:biapay_app/presentation/common/biapay_ui_package.dart';
// import 'package:flutter/cupertino.dart';

// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// class CashVoucher extends StatefulWidget {
//   const CashVoucher({Key? key}) : super(key: key);

//   @override
//   _CashVoucherState createState() => _CashVoucherState();
// }

// class _CashVoucherState extends State<CashVoucher> {
//   @override
//   Widget build(BuildContext context) {
//     return BiaScaffold(
//       appBar: BiaAppBar.simple('View - cash vouchers'),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             Container(
//                 padding: EdgeInsets.symmetric(horizontal: 0, vertical: 10.h),
//                 alignment: Alignment.centerLeft,
//                 child: BiaText(
//                   "All cash vouchers",
//                   color: Colors.white,
//                   fontSize: 20,
//                 )),
//             Container(
//               height: 800.h,
//               child: ListView.builder(
//                 itemCount: 4,
//                 itemBuilder: (BuildContext context, int index) {
//                   return Container(
//                     margin: EdgeInsets.only(bottom: 5.h, top: 20.h),
//                     padding: EdgeInsets.all(20.h),
//                     width: double.infinity,
//                     decoration: const BoxDecoration(
//                       color: Colors.white,
//                       borderRadius: BorderRadius.only(
//                         topRight: Radius.circular(15),
//                         topLeft: Radius.circular(15),
//                         bottomRight: Radius.circular(15),
//                         bottomLeft: Radius.circular(15),
//                       ),
//                     ),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: <Widget>[
//                         Padding(
//                           padding: EdgeInsets.symmetric(
//                               vertical: 5.h, horizontal: 0),
//                           child: const BiaText(
//                             'VFSF3546453',
//                             fontSize: 18,
//                             fontWeight: FontWeight.bold,
//                             color: Color.fromRGBO(42, 68, 125, 1),
//                           ),
//                         ),
//                         Padding(
//                           padding: EdgeInsets.symmetric(
//                               vertical: 5.h, horizontal: 0),
//                           child: const BiaText(
//                             'Lorem ipsum dolor sit amet. consectetur adipisicing elit',
//                             fontSize: 10,
//                             color: Color.fromRGBO(44, 71, 124, 1),
//                           ),
//                         ),
//                         const Divider(
//                           height: 20,
//                           thickness: 2,
//                           indent: 20,
//                           endIndent: 20,
//                         ),
//                         Row(
//                             mainAxisAlignment: MainAxisAlignment.start,
//                             children: <Widget>[
//                               Column(
//                                 children: [
//                                   Container(
//                                     width: 250.w,
//                                     child: Column(
//                                       crossAxisAlignment:
//                                           CrossAxisAlignment.start,
//                                       children: [
//                                         Padding(
//                                           padding: EdgeInsets.symmetric(
//                                               vertical: 5.h, horizontal: 0),
//                                           child: const BiaText(
//                                             '02-04-2020',
//                                             fontSize: 18,
//                                             fontWeight: FontWeight.bold,
//                                             color:
//                                                 Color.fromRGBO(42, 68, 125, 1),
//                                           ),
//                                         ),
//                                         Padding(
//                                           padding: EdgeInsets.symmetric(
//                                               vertical: 5.h, horizontal: 0),
//                                           child: const BiaText(
//                                             'Created date',
//                                             fontSize: 10,
//                                             color:
//                                                 Color.fromRGBO(44, 71, 124, 1),
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                               Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Container(
//                                     alignment: Alignment.centerRight,
//                                     child: const BiaText(
//                                       'Approved',
//                                       fontSize: 18,
//                                       fontWeight: FontWeight.bold,
//                                       color: Color.fromRGBO(55, 181, 99, 1),
//                                     ),
//                                   ),
//                                   const BiaText(
//                                     'Status',
//                                     fontSize: 10,
//                                     color: Color.fromRGBO(44, 71, 124, 1),
//                                   ),
//                                 ],
//                               ),
//                             ]),
//                       ],
//                     ),
//                   );
//                 },
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
