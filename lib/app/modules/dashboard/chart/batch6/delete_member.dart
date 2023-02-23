// import 'package:biapay_app/presentation/common/biapay_ui_package.dart';
// import 'package:flutter/material.dart';

// class DeleteMember extends StatelessWidget {
//   const DeleteMember({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final List<String> tontains = ["tontain1", "tontain2"];

//     final List<String> members = ["member1", "member2"];

//     final TextEditingController tontain = TextEditingController();

//     final TextEditingController member = TextEditingController();

//     final TextEditingController note = TextEditingController();
//     return BiaScaffold(
//         appBar: BiaAppBar.simple('Delete a member'),
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
//                 padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10),
//                 child: const BiaText(
//                   "Select a member",
//                   color: Colors.white,
//                   fontSize: 20,
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.symmetric(vertical: 10),
//                 child: BiaDropdown(
//                     options: members,
//                     controller: member,
//                     hint: "Select Member",
//                     displayName: (dynamic v) => v.toString(),
//                     onSelected: (dynamic v) {}),
//               ),
//               Padding(
//                 padding: const EdgeInsets.symmetric(vertical: 10),
//                 child: BiaTextField(
//                   controller: note,
//                   hint: "Enter Note Comment",
//                 ),
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
