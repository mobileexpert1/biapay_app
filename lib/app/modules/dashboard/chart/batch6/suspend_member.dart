// import 'package:biapay_app/presentation/common/biapay_ui_package.dart';
// import 'package:flutter/material.dart';

// class SuspendMember extends StatelessWidget {
//   const SuspendMember({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     List<String> tontains = ["tontain1", "tontain2"];

//     List<String> members = ["member1", "member2"];

//     TextEditingController tontain = TextEditingController();

//     TextEditingController member = TextEditingController();

//     TextEditingController note = TextEditingController();
//     return BiaScaffold(
//         appBar: BiaAppBar.simple('Suspend member'),
//         body: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
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
//                 child: BiaText(
//                   "Suspend a member",
//                   color: Colors.white,
//                   fontSize: 20,
//                 ),
//               ),
//               Padding(
//                 padding:
//                     const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
//                 child: BiaDropdown(
//                     options: members,
//                     controller: member,
//                     hint: "Select Member",
//                     displayName: (dynamic v) => v.toString(),
//                     onSelected: (dynamic v) {}),
//               ),
//               Padding(
//                 padding:
//                     const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
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
