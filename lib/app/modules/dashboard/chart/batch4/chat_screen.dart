// import 'package:biapay_app/presentation/common/biapay_ui_package.dart';
// import 'package:flutter/cupertino.dart';

// import 'package:flutter/material.dart';
// import 'package:flutter_hooks/flutter_hooks.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// class ChatScreen extends HookWidget {
//   const ChatScreen({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final TextEditingController _search = useTextEditingController();
//     return BiaScaffold(
//       appBar: BiaAppBar.simple(
//         'Jhonathan Doe',
//       ),
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.end,
//         children: [
//           Expanded(
//             child: ListView(
//               children: [
//                 Container(
//                   margin: EdgeInsets.only(bottom: 10.h, top: 60.h),
//                   padding: EdgeInsets.all(20.h),
//                   width: double.infinity,
//                   decoration: const BoxDecoration(
//                     color: Colors.white,
//                     borderRadius: BorderRadius.only(
//                       topRight: Radius.circular(15),
//                       topLeft: Radius.circular(15),
//                       bottomRight: Radius.circular(15),
//                       bottomLeft: Radius.circular(15),
//                     ),
//                   ),
//                   child: const BiaText(
//                     'Lorem ipsum dolor sit amet. consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut \nenim ad minim veniam, quis nosturd exercittation ullamco laboris nisi ut aliquip ex ea commodo conseqat.Duisaute irure dolor in ',
//                     fontSize: 16,
//                     maxLine: 10,
//                   ),
//                 ),
//                 Container(
//                   margin: EdgeInsets.only(bottom: 10.h, top: 10.h, left: 20.h),
//                   padding: EdgeInsets.all(20.h),
//                   width: double.infinity,
//                   decoration: const BoxDecoration(
//                     color: Color.fromRGBO(228, 236, 255, 1),
//                     borderRadius: BorderRadius.only(
//                       topRight: Radius.circular(15),
//                       topLeft: Radius.circular(15),
//                       bottomRight: Radius.circular(15),
//                       bottomLeft: Radius.circular(15),
//                     ),
//                   ),
//                   child: const BiaText(
//                     'Lorem ipsum dolor sit amet. consec tetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nosturd exercittation ullamco ',
//                     fontSize: 16,
//                     maxLine: 10,
//                   ),
//                 ),
//                 SizedBox(
//                   height: 50.h,
//                 ),
//               ],
//             ),
//           ),
//           BiaTextField(
//             controller: _search,
//             hint: "Write a message",
//             hintColor: Colors.grey,
//           ),
//         ],
//       ),
//     );
//   }
// }
