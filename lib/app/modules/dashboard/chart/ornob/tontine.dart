// import 'package:biapay_app/presentation/app/home/chart/ornob/tontine1.dart';
// import 'package:biapay_app/presentation/common/biapay_ui_package.dart';
// import 'package:flutter/cupertino.dart';

// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';

// class Tontine extends StatefulWidget {
//   const Tontine({Key? key}) : super(key: key);

//   @override
//   _TontineState createState() => _TontineState();
// }

// class _TontineState extends State<Tontine> {
//   @override
//   Widget build(BuildContext context) {
//     return BiaScaffold(
//       appBar: BiaAppBar.simple('Tontine'),
//       body: Container(
//         padding: EdgeInsets.only(top: 20.h),
//         child: Column(
//           children: <Widget>[
//             SizedBox(
//               width: double.infinity,
//               height: 80.h,
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   BiaText(
//                     'My tontine',
//                     fontSize: 24.h,
//                     color: Colors.white,
//                     fontWeight: FontWeight.bold,
//                   ),
//                   TextButton(
//                       onPressed: () {},
//                       child: Row(
//                         children: <Widget>[
//                           Icon(
//                             Icons.add_circle_outline,
//                             color: Colors.white,
//                             size: 35.h,
//                           ),
//                           BiaText(
//                             'Add a new toontine',
//                             fontSize: 20.h,
//                             color: Colors.white,
//                           )
//                         ],
//                       )),
//                 ],
//               ),
//             ),
//             BiaButton.withRightArrow(
//                 text: 'Tontine 1',
//                 onPressed: () {
//                   Get.to(() => const Tontine1());
//                 }),
//             Padding(
//               padding: EdgeInsets.symmetric(vertical: 10.h),
//               child: BiaButton.withRightArrow(
//                   text: 'Tontine 2',
//                   onPressed: () {
//                     Get.to(() => const Tontine1());
//                   }),
//             ),
//             BiaButton.withRightArrow(
//                 text: 'Tontine 3',
//                 onPressed: () {
//                   Get.to(() => const Tontine1());
//                 }),
//           ],
//         ),
//       ),
//     );
//   }
// }
