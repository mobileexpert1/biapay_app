// import 'package:biapay_app/presentation/common/biapay_ui_package.dart';
// import 'package:flutter/material.dart';

// class CreateSub extends StatelessWidget {
//   const CreateSub({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final List<String> tontains = ["tontain1", "tontain2"];

//     final TextEditingController tontain = TextEditingController();

//     final TextEditingController firstName = TextEditingController();

//     final TextEditingController lastName = TextEditingController();
//     final TextEditingController phoneNumber = TextEditingController();
//     return BiaScaffold(
//         appBar: BiaAppBar.simple('Add a new sub-tontine'),
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
//               Row(
//                 children: [
//                   Padding(
//                     padding:
//                         EdgeInsets.symmetric(horizontal: 20.w, vertical: 10),
//                     child: const BiaText(
//                       "New tontine member",
//                       color: Colors.white,
//                       fontSize: 20,
//                     ),
//                   ),
//                   Padding(
//                     padding:
//                         EdgeInsets.symmetric(horizontal: 20.w, vertical: 10),
//                     child: const BiaText(
//                       "Add member ",
//                       color: Colors.white,
//                       fontSize: 14,
//                     ),
//                   ),
//                 ],
//               ),
//               Padding(
//                 padding: const EdgeInsets.symmetric(vertical: 10),
//                 child: BiaTextField(
//                   controller: firstName,
//                   hint: "First Name",
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.symmetric(vertical: 10),
//                 child: BiaTextField(
//                   controller: lastName,
//                   hint: "Last Name",
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.symmetric(vertical: 10),
//                 child: BiaTextField(
//                   controller: phoneNumber,
//                   hint: "Wallet ID / Phone number",
//                 ),
//               ),
//             ],
//           ),
//         ));
//   }
// }
