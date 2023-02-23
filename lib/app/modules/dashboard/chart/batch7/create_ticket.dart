// import 'package:biapay_app/presentation/common/biapay_ui_package.dart';
// import 'package:flutter/material.dart';

// class CreateTicket extends StatelessWidget {
//   const CreateTicket({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     List<String> prioritys = ["priority1", "priority2"];

//     TextEditingController priority = TextEditingController();

//     TextEditingController name = TextEditingController();

//     TextEditingController message = TextEditingController();
//     return BiaScaffold(
//         appBar: BiaAppBar.simple('New Ticket'),
//         body: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Padding(
//                 padding:
//                     const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
//                 child: BiaTextField(
//                   controller: name,
//                   hint: "Enter Name",
//                 ),
//               ),
//               Padding(
//                 padding:
//                     const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
//                 child: BiaTextField(
//                   controller: message,
//                   hint: "Enter message",
//                 ),
//               ),
//               Padding(
//                 padding:
//                     const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
//                 child: BiaDropdown(
//                     options: prioritys,
//                     controller: priority,
//                     hint: "Select Priority",
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
