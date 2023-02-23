// import 'package:biapay_app/presentation/common/biapay_ui_package.dart';
// import 'package:flutter/cupertino.dart';

// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// class ReactiveMember extends StatefulWidget {
//   const ReactiveMember({Key? key}) : super(key: key);

//   @override
//   _ReactiveMemberState createState() => _ReactiveMemberState();
// }

// class _ReactiveMemberState extends State<ReactiveMember> {
//   List<String> tontains = ["tontain1", "tontain2"];

//   List<String> members = ["member1", "member2"];

//   TextEditingController tontain = TextEditingController();

//   TextEditingController member = TextEditingController();

//   TextEditingController note = TextEditingController();
//   @override
//   Widget build(BuildContext context) {
//     return BiaScaffold(
//         appBar: BiaAppBar.simple('Reactive a member'),
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
//                   "Activate a tontain member",
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
//             ],
//           ),
//         ));
//   }
// }
