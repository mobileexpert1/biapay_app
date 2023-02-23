//
// // import 'package:biapay_app/presentation/common/biapay_ui_package.dart';
// // import 'package:biapay_app/presentation/common/widgets/common/bia_dropdown.dart';
// import 'package:dotted_border/dotted_border.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// // import 'package:flutter_hooks/flutter_hooks.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
//
// import '../../../../widgets/common/bia_appbar.dart';
// import '../../../../widgets/common/bia_button.dart';
// import '../../../../widgets/common/bia_dropdown.dart';
// import '../../../../widgets/common/bia_scaffold.dart';
// import '../../../../widgets/common/bia_text.dart';
// import '../../../../widgets/common/bia_textfield.dart';
//
// class AddNewTickets extends HookWidget {
//   const AddNewTickets({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     final List<String> options = ['Priority 1', 'Priority 2', 'Priority 3'];
//     final TextEditingController dropDownController = useTextEditingController();
//     return BiaScaffold(
//       appBar: BiaAppBar.simple('Add a ticket'),
//       body: Column(
//         // mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: <Widget>[
//           SizedBox(
//             height: 20.h,
//           ),
//           BiaTextField(
//             controller: TextEditingController(text: 'Enter subject'),
//             hint: 'Subject',
//             padding: EdgeInsets.all(20.h),
//           ),
//           BiaTextField(
//             controller: TextEditingController(text: 'Enter message'),
//             hint: 'Message',
//             maxLines: 5,
//             padding: EdgeInsets.all(20.h),
//           ),
//           BiaDropdown<String>(
//               options: options,
//               margin: EdgeInsets.only(left: 20.h, right: 20.h),
//               controller: dropDownController,
//               hint: 'Priority',
//               displayName: (v) => v,
//               onSelected: (item) {}),
//           Container(
//             margin: EdgeInsets.only(left: 20.h, right: 20.h, top: 20.h),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 BiaText(
//                   'File upload',
//                   fontSize: 20.h,
//                   color: Colors.white,
//                 ),
//                 SizedBox(
//                   height: 10.h,
//                 ),
//                 DottedBorder(
//                   borderType: BorderType.RRect,
//                   radius: Radius.circular(10.h),
//                   color: Colors.white,
//                   child: Container(
//                     height: 200.h,
//                     padding: EdgeInsets.only(top: 40.h),
//                     width: double.infinity,
//                     child: Column(
//                       children: [
//                         const Icon(
//                           Icons.cloud_upload_outlined,
//                           color: Colors.white,
//                           size: 50,
//                         ),
//                         BiaText(
//                           'Select files to upload or drag &drop them here',
//                           color: Colors.white,
//                           fontSize: 18.h,
//                         )
//                       ],
//                     ),
//                   ),
//                 )
//               ],
//             ),
//           ),
//           BiaButton(
//             text: 'Save',
//             onPressed: () {},
//             color: Colors.lightGreen,
//             textColor: Colors.white,
//           )
//         ],
//       ),
//     );
//   }
// }
//
