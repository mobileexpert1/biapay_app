// import 'package:biapay_app/presentation/common/biapay_ui_package.dart';
// import 'package:flutter/cupertino.dart';

// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// class TortoinHis extends StatefulWidget {
//   const TortoinHis({Key? key}) : super(key: key);

//   @override
//   _TortoinHisState createState() => _TortoinHisState();
// }

// class _TortoinHisState extends State<TortoinHis> {
//   @override
//   Widget build(BuildContext context) {
//     return BiaScaffold(
//       appBar: BiaAppBar.simple('Tontine History'),
//       body: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Padding(
//             padding: EdgeInsets.symmetric(vertical: 20.h),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceAround,
//               children: [
//                 Container(
//                   height: 50.h,
//                   width: 170.w,
//                   alignment: Alignment.center,
//                   decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(20),
//                       color: const Color.fromRGBO(42, 68, 125, 1)),
//                   child: const BiaText(
//                     "Payment History",
//                     color: Colors.white,
//                     fontSize: 17,
//                   ),
//                 ),
//                 const BiaText(
//                   "Contribution History",
//                   color: Colors.white,
//                   fontSize: 17,
//                 ),
//               ],
//             ),
//           ),
//           const BiaText(
//             "Payment History",
//             color: Colors.white,
//             fontSize: 17,
//           ),
//           Container(
//             margin: EdgeInsets.only(bottom: 19.h, top: 15.h),
//             padding: EdgeInsets.all(20.h),
//             width: double.infinity,
//             decoration: const BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.only(
//                 topRight: Radius.circular(15),
//                 topLeft: Radius.circular(15),
//                 bottomRight: Radius.circular(15),
//                 bottomLeft: Radius.circular(15),
//               ),
//             ),
//             child: SingleChildScrollView(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: <Widget>[
//                   Container(
//                     height: 70.h,
//                     width: 400.w,
//                     alignment: Alignment.centerLeft,
//                     decoration: const BoxDecoration(
//                         color: Color.fromRGBO(231, 246, 203, 1)),
//                     child: const Padding(
//                       padding: const EdgeInsets.all(10),
//                       child: Text(
//                         "April 2021",
//                         style: TextStyle(fontSize: 24),
//                       ),
//                     ),
//                   ),
//                   SizedBox(
//                     height: 278.h,
//                     child: ListView.builder(
//                         itemCount: 5,
//                         itemBuilder: (BuildContext context, int index) {
//                           return Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Padding(
//                                 padding: EdgeInsets.symmetric(
//                                     vertical: 10.h, horizontal: 0),
//                                 child: const BiaText(
//                                   "12 April 2021",
//                                   fontSize: 15,
//                                 ),
//                               ),
//                               Row(
//                                 mainAxisAlignment:
//                                     MainAxisAlignment.spaceBetween,
//                                 children: [
//                                   SizedBox(
//                                     width: 200.w,
//                                     child: BiaText(
//                                       "Ac - 34343234534554/ reason homeEMI / 645645645643434",
//                                       fontSize: 12,
//                                     ),
//                                   ),
//                                   BiaText(
//                                     "55.50 USD",
//                                     fontSize: 12,
//                                   ),
//                                 ],
//                               ),
//                               const Divider(
//                                 height: 20,
//                                 thickness: 2,
//                                 indent: 20,
//                                 endIndent: 20,
//                               ),
//                             ],
//                           );
//                         }),
//                   ),
//                   Container(
//                     height: 70.h,
//                     width: 400.w,
//                     alignment: Alignment.centerLeft,
//                     decoration:
//                         BoxDecoration(color: Color.fromRGBO(231, 246, 203, 1)),
//                     child: Padding(
//                       padding: const EdgeInsets.all(10),
//                       child: Text(
//                         "May 2021",
//                         style: TextStyle(fontSize: 24),
//                       ),
//                     ),
//                   ),
//                   Container(
//                     height: 278.h,
//                     child: ListView.builder(
//                         itemCount: 5,
//                         itemBuilder: (BuildContext context, int index) {
//                           return Container(
//                               child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Padding(
//                                 padding: EdgeInsets.symmetric(
//                                     vertical: 10.h, horizontal: 0),
//                                 child: BiaText(
//                                   "12 April 2021",
//                                   fontSize: 15,
//                                 ),
//                               ),
//                               Row(
//                                 mainAxisAlignment:
//                                     MainAxisAlignment.spaceBetween,
//                                 children: [
//                                   Container(
//                                     width: 200.w,
//                                     child: BiaText(
//                                       "Ac - 34343234534554/ reason homeEMI / 645645645643434",
//                                       fontSize: 12,
//                                     ),
//                                   ),
//                                   BiaText(
//                                     "55.50 USD",
//                                     fontSize: 12,
//                                   ),
//                                 ],
//                               ),
//                               const Divider(
//                                 height: 20,
//                                 thickness: 2,
//                                 indent: 20,
//                                 endIndent: 20,
//                               ),
//                             ],
//                           ));
//                         }),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
