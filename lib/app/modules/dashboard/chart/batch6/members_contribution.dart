// import 'package:biapay_app/presentation/common/biapay_ui_package.dart';
// import 'package:flutter/material.dart';

// class MembersContribution extends StatelessWidget {
//   const MembersContribution({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     List<String> tontains = ["tontain1", "tontain2"];

//     List<String> rates = ["rate1", "rate2"];
//     List<String> periods = ["periods1", "periods2"];

//     TextEditingController tontain = TextEditingController();

//     TextEditingController rate = TextEditingController();

//     TextEditingController period = TextEditingController();
//     return BiaScaffold(
//         appBar: BiaAppBar.simple('Member’s contribtion'),
//         body: Padding(
//           padding: const EdgeInsets.symmetric(vertical: 10),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               BiaDropdown(
//                   options: tontains,
//                   controller: tontain,
//                   hint: "Select a tontain",
//                   displayName: (dynamic v) => v.toString(),
//                   onSelected: (dynamic v) {}),
//               Padding(
//                 padding: const EdgeInsets.symmetric(vertical: 10),
//                 child: BiaDropdown(
//                     options: rates,
//                     controller: rate,
//                     hint: "Rate",
//                     displayName: (dynamic v) => v.toString(),
//                     onSelected: (dynamic v) {}),
//               ),
//               Padding(
//                 padding: const EdgeInsets.symmetric(vertical: 10),
//                 child: BiaDropdown(
//                     options: periods,
//                     controller: period,
//                     hint: "Period",
//                     displayName: (dynamic v) => v.toString(),
//                     onSelected: (dynamic v) {}),
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   BiaButton.greenButtonInRow(text: "Submit", onPressed: () {}),
//                 ],
//               )
//             ],
//           ),
//         ));
//   }
// }
