// import 'package:biapay_app/presentation/common/biapay_ui_package.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:biapay_app/presentation/common/widgets/common/bia_button.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:biapay_app/presentation/common/widgets/common/bia_expansion_tile.dart';
// //import 'package:biapay_app/presentation/common/widgets/common/bia_text.dart';

// class Policies extends StatefulWidget {
//   const Policies({Key? key}) : super(key: key);

//   @override
//   _PoliciesState createState() => _PoliciesState();
// }

// class _PoliciesState extends State<Policies> {
//   final String loremIpsum =
//       '''Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce luctus nisl pretium nisi iaculis convallis. Suspendisse finibus risus ultricies ornare placerat. Donec nec nibh id felis aliquam pharetra id vitae eros. Vivamus ac ex et massa laoreet fringilla. Morbi sollicitudin lectus non rhoncus commodo. Donec leo risus, facilisis eu vestibulum vitae, condimentum sed quam. In lacus tortor, consectetur a risus ut, ma''';

//   @override
//   Widget build(BuildContext context) {
//     return BiaScaffold(
//         appBar: BiaAppBar.simple('Lagal Info'),
//         body: Container(
//           padding: EdgeInsets.only(top: 20.h),
//           child: Column(
//             children: [
//               BiaExpansionTile(
//                   title: 'Terms & Conditions', details: loremIpsum),
//               BiaButton.withRightArrow(text: 'Legal notice', onPressed: () {}),
//               BiaButton.withRightArrow(
//                   text: 'Privacy policy', onPressed: () {}),
//             ],
//           ),
//         ));
//   }
// }
