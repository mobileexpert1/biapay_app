// import 'package:biapay_app/presentation/common/biapay_ui_package.dart';
// import 'package:flutter/material.dart';

// class JackpotTransfer extends StatelessWidget {
//   const JackpotTransfer({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final List<String> accounts = ["wallet1", "wallet2"];

//     final TextEditingController account = TextEditingController();

//     final TextEditingController amount = TextEditingController();
//     return BiaScaffold(
//         appBar: BiaAppBar.simple('Jackpot transfer to beneficiary'),
//         body: Padding(
//           padding: const EdgeInsets.symmetric(vertical: 10),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Padding(
//                 padding: const EdgeInsets.symmetric(vertical: 10),
//                 child: BiaTextField(
//                   controller: amount,
//                   hint: "Enter amount",
//                 ),
//               ),
//               BiaDropdown(
//                   options: accounts,
//                   controller: account,
//                   hint: "Wallet account",
//                   displayName: (dynamic v) => v.toString(),
//                   onSelected: (dynamic v) {}),
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
