// import 'package:biapay_app/presentation/common/widgets/common/bia_dropdown.dart';
// import 'package:biapay_app/presentation/common/biapay_ui_package.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:biapay_app/resources/assets.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_hooks/flutter_hooks.dart';

// class Contact extends HookWidget {
//   const Contact({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final List<String> name = ['Name 1', 'Name 2', 'Name 3'];
//     final List<String> subject = ['Subject 1', 'Subject 2', 'Subject 3'];
//     final List<String> email = ['Email 1', 'Email 2', 'Email 3'];

//     return BiaScaffold(
//       appBar: BiaAppBar.simple('Contact'),
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//         children: [
//           Image.asset(
//             Assets.contact,
//             width: 200.w,
//           ),
//           BiaDropdown<String>(
//               options: name,
//               margin: EdgeInsets.only(left: 20.h, right: 20.h),
//               controller: useTextEditingController(text: 'Enter your name'),
//               hint: 'Your name',
//               displayName: (v) => v,
//               onSelected: (item) {}),
//           BiaDropdown<String>(
//               options: email,
//               margin: EdgeInsets.only(left: 20.h, right: 20.h),
//               controller:
//                   useTextEditingController(text: 'Enter your Email address'),
//               hint: 'Email',
//               displayName: (v) => v,
//               onSelected: (item) {}),
//           BiaDropdown<String>(
//               options: subject,
//               margin: EdgeInsets.only(left: 20.h, right: 20.h),
//               controller: useTextEditingController(text: 'Enter subject'),
//               hint: 'Subject',
//               displayName: (v) => v,
//               onSelected: (item) {}),
//           BiaTextField(
//             controller: TextEditingController(text: 'Enter messsage'),
//             hint: 'Massege',
// // label: "username".tr
//             suffixIcon: SizedBox(
//               height: 200.h,
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.only(top: 20),
//             child: Row(
//               children: [
//                 BiaButton(
//                   text: 'Back',
//                   onPressed: () {},
//                   color: Colors.lightGreen,
//                   textType: TextType.headLine4,
//                   width: 185.w,
//                   textColor: Colors.white,
//                 ),
//                 BiaButton(
//                   text: 'Send',
//                   onPressed: () {},
//                   color: Colors.lightGreen,
//                   textType: TextType.headLine4,
//                   width: 185.w,
//                   textColor: Colors.white,
//                 ),
//               ],
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
