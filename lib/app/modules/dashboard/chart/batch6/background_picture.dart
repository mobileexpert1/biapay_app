// import 'package:biapay_app/presentation/common/biapay_ui_package.dart';
// import 'package:flutter/material.dart';

// class BackgroundPicture extends StatelessWidget {
//   const BackgroundPicture({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return BiaScaffold(
//       appBar: BiaAppBar.simple('Add a new tortain'),
//       body: Container(
//         child: Column(
//           children: [
//             Padding(
//               padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10),
//               child: BiaText(
//                 "Select Background",
//                 color: Colors.white,
//                 fontSize: 20,
//               ),
//             ),
//             Expanded(
//               child: GridView.builder(
//                   gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
//                       maxCrossAxisExtent: 200,
//                       childAspectRatio: 4 / 3,
//                       crossAxisSpacing: 18,
//                       mainAxisSpacing: 18),
//                   itemCount: 5,
//                   itemBuilder: (BuildContext ctx, index) {
//                     return Column(
//                       children: [
//                         Container(
//                           clipBehavior: Clip.hardEdge,
//                           alignment: Alignment.center,
//                           child: Image.network(
//                               "https://wallpaperaccess.com/full/1376490.jpg"),
//                           decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(15)),
//                         ),
//                         Row(
//                           children: [
//                             Container(
//                               margin: EdgeInsets.all(10.0),
//                               decoration: BoxDecoration(
//                                   color: Colors.orange, shape: BoxShape.circle),
//                             ),
//                             BiaText(
//                               "Select background",
//                               color: Colors.white,
//                             ),
//                           ],
//                         )
//                       ],
//                     );
//                   }),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
