// import 'package:biapay_app/presentation/common/biapay_ui_package.dart';
// import 'package:flutter/material.dart';
// import 'package:searchfield/searchfield.dart';

// class SubTotine extends StatelessWidget {
//   const SubTotine({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return BiaScaffold(
//       appBar: BiaAppBar.simple('Sub-totine'),
//       body: SingleChildScrollView(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: <Widget>[
//             Padding(
//               padding: EdgeInsets.symmetric(vertical: 20.h),
//               child: BiaText(
//                 'Sub-tontine',
//                 fontSize: 20,
//                 color: Colors.white,
//               ),
//             ),
//             Container(
//                 margin: EdgeInsets.only(bottom: 19.h, top: 15.h),
//                 padding: EdgeInsets.all(20.h),
//                 width: double.infinity,
//                 decoration: const BoxDecoration(
//                   // color: Colors.white,
//                   borderRadius: BorderRadius.only(
//                     topRight: Radius.circular(15),
//                     topLeft: Radius.circular(15),
//                     bottomRight: Radius.circular(15),
//                     bottomLeft: Radius.circular(15),
//                   ),
//                 ),
//                 child: SearchField(
//                     suggestionStyle: TextStyle(color: Colors.white),
//                     suggestions: [
//                       'United States',
//                       'America',
//                       'Washington',
//                       'India',
//                       'Paris',
//                       'Jakarta',
//                       'Australia',
//                       'Lorem Ipsum'
//                     ],
//                     searchInputDecoration: InputDecoration(
//                       focusedBorder: OutlineInputBorder(
//                         borderSide: BorderSide(
//                           color: Colors.white.withOpacity(0.8),
//                         ),
//                       ),
//                       border: OutlineInputBorder(
//                         borderSide: BorderSide(color: Colors.red),
//                       ),
//                     ))),
//             Container(
//               height: 1000.h,
//               child: Expanded(
//                 child: ListView.builder(
//                     itemCount: 6,
//                     itemBuilder: (BuildContext context, int index) {
//                       return Container(
//                         margin: EdgeInsets.only(bottom: 19.h, top: 15.h),
//                         padding: EdgeInsets.all(20.h),
//                         width: double.infinity,
//                         decoration: const BoxDecoration(
//                           color: Colors.white,
//                           borderRadius: BorderRadius.only(
//                             topRight: Radius.circular(15),
//                             topLeft: Radius.circular(15),
//                             bottomRight: Radius.circular(15),
//                             bottomLeft: Radius.circular(15),
//                           ),
//                         ),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Column(
//                               // crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Row(
//                                   children: [
//                                     Padding(
//                                       padding: const EdgeInsets.all(8.0),
//                                       child: CircleAvatar(
//                                         radius: 40.h,
//                                         backgroundImage: NetworkImage(
//                                             "https://cdn3.vectorstock.com/i/1000x1000/88/12/face-young-man-in-frame-circular-avatar-character-vector-28828812.jpg"),
//                                       ),
//                                     ),
//                                     Column(
//                                       crossAxisAlignment:
//                                           CrossAxisAlignment.start,
//                                       children: [
//                                         BiaText(
//                                           'John Doe',
//                                           fontSize: 18,
//                                         ),
//                                         SizedBox(
//                                           width: 20.w,
//                                         ),
//                                         BiaText(
//                                           'IFSC45654763336',
//                                           fontSize: 13,
//                                           color: Colors.grey,
//                                         ),
//                                       ],
//                                     ),
//                                   ],
//                                 ),
//                               ],
//                             ),
//                             Icon(
//                               Icons.menu,
//                               color: Colors.black,
//                               size: 30.sp,
//                             )
//                           ],
//                         ),
//                       );
//                     }),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
