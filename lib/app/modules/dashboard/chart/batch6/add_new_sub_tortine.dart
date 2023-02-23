// import 'package:biapay_app/presentation/common/biapay_ui_package.dart';
// import 'package:flutter/material.dart';

// class AddSubTortine extends StatelessWidget {
//   const AddSubTortine({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     List<String> members = ["member1", "member2"];

//     TextEditingController addMember = TextEditingController();

//     TextEditingController subTortain = TextEditingController();

//     return BiaScaffold(
//         appBar: BiaAppBar.simple("Add a new sub-tortine"),
//         body: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               BiaDropdown(
//                   options: members,
//                   controller: addMember,
//                   hint: "Add member",
//                   displayName: (dynamic v) => v.toString(),
//                   onSelected: (dynamic v) {}),
//               Padding(
//                 padding:
//                     const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
//                 child: BiaTextField(
//                   controller: subTortain,
//                   hint: "Sub-tortine name",
//                 ),
//               ),
//               BiaCheckBox(
//                   initValue: false,
//                   onChanged: (value) {},
//                   title: "Terms and conditions of tontine accepted"),
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
