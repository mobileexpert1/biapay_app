// import 'package:biapay_app/presentation/common/biapay_ui_package.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// class PricingList extends StatefulWidget {
//   const PricingList({Key? key}) : super(key: key);

//   @override
//   _PricingListState createState() => _PricingListState();
// }

// class _PricingListState extends State<PricingList> {
//   @override
//   Widget build(BuildContext context) {
//     const String loremIpsum = 'Lorem ipsum dolor sit amet,con';

//     return BiaScaffold(
//         appBar: BiaAppBar.simple('Subscription plan'),
//         body: ListView(
//           children: [
//             Container(
//               padding: EdgeInsets.all(20.h),
//               margin: const EdgeInsets.symmetric(vertical: 20),
//               height: 600.h,
//               decoration: const BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.all(Radius.circular(20)),
//               ),
//               child: Column(
//                 children: [
//                   Container(
//                     padding: EdgeInsets.all(20.h),
//                     margin: EdgeInsets.only(bottom: 20.h),
//                     height: 200.h,
//                     width: double.infinity,
//                     decoration: const BoxDecoration(
//                       color: Colors.indigo,
//                       borderRadius: BorderRadius.all(Radius.circular(10)),
//                     ),
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                       children: [
//                         BiaText(
//                           'Mobile money plan',
//                           color: Colors.white,
//                           fontSize: 35.h,
//                           fontWeight: FontWeight.bold,
//                         ),
//                         Row(
//                           crossAxisAlignment: CrossAxisAlignment.end,
//                           children: [
//                             SizedBox(
//                               width: 50.h,
//                             ),
//                             BiaText(
//                               "1000 \$",
//                               color: Colors.white,
//                               fontSize: 45.h,
//                               fontWeight: FontWeight.bold,
//                             ),
//                             SizedBox(
//                               width: 40.h,
//                             ),
//                             BiaText(
//                               "30 days",
//                               color: Colors.white,
//                               fontSize: 30.h,
//                             ),
//                           ],
//                         )
//                       ],
//                     ),
//                   ),
//                   Row(
//                     children: [
//                       const Icon(Icons.highlight_off_outlined),
//                       BiaText(
//                         ' $loremIpsum',
//                         fontSize: 26.h,
//                       )
//                     ],
//                   ),
//                   SizedBox(
//                     height: 5.h,
//                   ),
//                   Row(
//                     children: [
//                       const Icon(Icons.highlight_off_outlined),
//                       BiaText(
//                         ' $loremIpsum',
//                         fontSize: 26.h,
//                       )
//                     ],
//                   ),
//                   SizedBox(
//                     height: 5.h,
//                   ),
//                   Row(
//                     children: [
//                       const Icon(Icons.highlight_off_outlined),
//                       BiaText(
//                         ' $loremIpsum',
//                         fontSize: 26.h,
//                       )
//                     ],
//                   ),
//                   SizedBox(
//                     height: 5.h,
//                   ),
//                   Row(
//                     children: [
//                       const Icon(Icons.highlight_off_outlined),
//                       BiaText(
//                         ' $loremIpsum',
//                         fontSize: 26.h,
//                       )
//                     ],
//                   ),
//                   BiaButton(
//                     text: 'BUY',
//                     onPressed: () {},
//                     color: Colors.indigo,
//                     textColor: Colors.white,
//                     width: 200.h,
//                   ),
//                   BiaButton(
//                     text: 'View more details',
//                     onPressed: () {},
//                     color: Colors.indigo,
//                     textColor: Colors.white,
//                     width: 300.h,
//                   )
//                 ],
//               ),
//             ),
//             Container(
//               padding: EdgeInsets.all(20.h),
//               margin: const EdgeInsets.symmetric(vertical: 20),
//               height: 600.h,
//               decoration: const BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.all(Radius.circular(20)),
//               ),
//               child: Column(
//                 children: [
//                   Container(
//                     padding: EdgeInsets.all(20.h),
//                     margin: EdgeInsets.only(bottom: 20.h),
//                     height: 200.h,
//                     width: double.infinity,
//                     decoration: const BoxDecoration(
//                       color: Colors.indigo,
//                       borderRadius: BorderRadius.all(Radius.circular(10)),
//                     ),
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                       children: [
//                         BiaText(
//                           'Gold zero',
//                           color: Colors.white,
//                           fontSize: 35.h,
//                           fontWeight: FontWeight.bold,
//                         ),
//                         Row(
//                           crossAxisAlignment: CrossAxisAlignment.end,
//                           children: [
//                             SizedBox(
//                               width: 50.h,
//                             ),
//                             BiaText(
//                               "1045 \$",
//                               color: Colors.white,
//                               fontSize: 45.h,
//                               fontWeight: FontWeight.bold,
//                             ),
//                             SizedBox(
//                               width: 40.h,
//                             ),
//                             BiaText(
//                               "30 days",
//                               color: Colors.white,
//                               fontSize: 30.h,
//                             ),
//                           ],
//                         )
//                       ],
//                     ),
//                   ),
//                   Row(
//                     children: [
//                       const Icon(Icons.highlight_off_outlined),
//                       BiaText(
//                         ' $loremIpsum',
//                         fontSize: 26.h,
//                       )
//                     ],
//                   ),
//                   SizedBox(
//                     height: 5.h,
//                   ),
//                   Row(
//                     children: [
//                       const Icon(Icons.highlight_off_outlined),
//                       BiaText(
//                         ' $loremIpsum',
//                         fontSize: 26.h,
//                       )
//                     ],
//                   ),
//                   SizedBox(
//                     height: 5.h,
//                   ),
//                   Row(
//                     children: [
//                       const Icon(Icons.highlight_off_outlined),
//                       BiaText(
//                         ' $loremIpsum',
//                         fontSize: 26.h,
//                       )
//                     ],
//                   ),
//                   SizedBox(
//                     height: 5.h,
//                   ),
//                   Row(
//                     children: [
//                       const Icon(Icons.highlight_off_outlined),
//                       BiaText(
//                         ' $loremIpsum',
//                         fontSize: 26.h,
//                       )
//                     ],
//                   ),
//                   BiaButton(
//                     text: 'BUY',
//                     onPressed: () {},
//                     color: Colors.indigo,
//                     textColor: Colors.white,
//                     width: 200.h,
//                   ),
//                   BiaButton(
//                     text: 'View more details',
//                     onPressed: () {},
//                     color: Colors.indigo,
//                     textColor: Colors.white,
//                     width: 300.h,
//                   )
//                 ],
//               ),
//             ),
//             Container(
//               padding: EdgeInsets.all(20.h),
//               margin: const EdgeInsets.symmetric(vertical: 20),
//               height: 600.h,
//               decoration: const BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.all(Radius.circular(20)),
//               ),
//               child: Column(
//                 children: [
//                   Container(
//                     padding: EdgeInsets.all(20.h),
//                     margin: EdgeInsets.only(bottom: 20.h),
//                     height: 200.h,
//                     width: double.infinity,
//                     decoration: const BoxDecoration(
//                       color: Colors.indigo,
//                       borderRadius: BorderRadius.all(Radius.circular(10)),
//                     ),
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                       children: [
//                         BiaText(
//                           'Main plan',
//                           color: Colors.white,
//                           fontSize: 35.h,
//                           fontWeight: FontWeight.bold,
//                         ),
//                         Row(
//                           crossAxisAlignment: CrossAxisAlignment.end,
//                           children: [
//                             SizedBox(
//                               width: 50.h,
//                             ),
//                             BiaText(
//                               "3999 \$",
//                               color: Colors.white,
//                               fontSize: 45.h,
//                               fontWeight: FontWeight.bold,
//                             ),
//                             SizedBox(
//                               width: 40.h,
//                             ),
//                             BiaText(
//                               "30 days",
//                               color: Colors.white,
//                               fontSize: 30.h,
//                             ),
//                           ],
//                         )
//                       ],
//                     ),
//                   ),
//                   Row(
//                     children: [
//                       const Icon(Icons.highlight_off_outlined),
//                       BiaText(
//                         ' $loremIpsum',
//                         fontSize: 26.h,
//                       )
//                     ],
//                   ),
//                   SizedBox(
//                     height: 5.h,
//                   ),
//                   Row(
//                     children: [
//                       const Icon(Icons.highlight_off_outlined),
//                       BiaText(
//                         ' $loremIpsum',
//                         fontSize: 26.h,
//                       )
//                     ],
//                   ),
//                   SizedBox(
//                     height: 5.h,
//                   ),
//                   Row(
//                     children: [
//                       const Icon(Icons.highlight_off_outlined),
//                       BiaText(
//                         ' $loremIpsum',
//                         fontSize: 26.h,
//                       )
//                     ],
//                   ),
//                   SizedBox(
//                     height: 5.h,
//                   ),
//                   Row(
//                     children: [
//                       const Icon(Icons.highlight_off_outlined),
//                       BiaText(
//                         ' $loremIpsum',
//                         fontSize: 26.h,
//                       )
//                     ],
//                   ),
//                   BiaButton(
//                     text: 'BUY',
//                     onPressed: () {},
//                     color: Colors.indigo,
//                     textColor: Colors.white,
//                     width: 200.h,
//                   ),
//                   BiaButton(
//                     text: 'View more details',
//                     onPressed: () {},
//                     color: Colors.indigo,
//                     textColor: Colors.white,
//                     width: 300.h,
//                   )
//                 ],
//               ),
//             ),
//           ],
//         ));
//   }
// }
