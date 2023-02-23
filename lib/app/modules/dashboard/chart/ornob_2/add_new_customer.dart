// import 'package:biapay_app/presentation/common/biapay_ui_package.dart';
// import 'package:biapay_app/presentation/common/phone_controller_hook.dart';
// import 'package:biapay_app/presentation/common/widgets/common/bia_dropdown.dart';
// import 'package:flutter/cupertino.dart';
// //import 'package:biapay_app/resources/assets.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_hooks/flutter_hooks.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:phone_form_field/phone_form_field.dart';
// //import 'package:country_code_picker/country_code_picker.dart';

// class AddNewCustomer extends HookWidget {
//   const AddNewCustomer({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final PhoneController phoneController = usePhoneController();

//     final List<String> gender = ['Male', 'Female', 'Others'];
//     final List<String> currency = [
//       'USD',
//       'Euro',
//     ];
//     final List<String> country = ['Country 1', 'Country 2', 'Country 3'];

//     return BiaScaffold(
//       appBar: BiaAppBar.simple('Add new customer'),
//       body: ListView(
//         children: [
//           SizedBox(
//             height: 20.h,
//           ),
//           BiaDropdown<String>(
//               options: gender,
//               margin: EdgeInsets.only(left: 20.h, right: 20.h),
//               controller: useTextEditingController(text: 'Select gender'),
//               hint: 'Gender',
//               displayName: (v) => v,
//               onSelected: (item) {}),
//           BiaTextField(
//             controller: TextEditingController(text: 'Enter first name'),
//             hint: 'First name',
//           ),
//           BiaTextField(
//             controller: TextEditingController(text: 'Enter last name'),
//             hint: 'Last name',
//           ),
//           BiaTextField(
//             controller: TextEditingController(text: 'Enter email adress'),
//             hint: 'E-mail',
//           ), //Email
//           Padding(
//             padding: EdgeInsets.symmetric(horizontal: 17.w),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 BiaText(
//                   'Mobile Number',
//                   color: Colors.white,
//                   textType: TextType.headLine6,
//                   fontWeight: FontWeight.w300,
//                   padding: EdgeInsets.only(bottom: 5.h, top: 20.h),
//                 ),
//                 PhoneFormField(
//                   controller: phoneController,
//                   validator: PhoneValidator.required(),
//                   style: TextType.headLine5.toStyle(context: context)!.copyWith(
//                         color: Colors.blue[900],
//                         fontWeight: FontWeight.w300,
//                       ),
//                   decoration: InputDecoration(
//                     isDense: true,
//                     fillColor: Colors.white,
//                     filled: true,
//                     hintText: 'Phone',
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(5),
//                     ),
//                     focusedBorder: const OutlineInputBorder(
//                       borderSide: BorderSide(color: Colors.transparent),
//                     ),
//                     enabledBorder: const OutlineInputBorder(
//                       borderSide: BorderSide(color: Colors.transparent),
//                     ),
//                     contentPadding:
//                         EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           SizedBox(
//             height: 10.h,
//           ),
//           BiaDropdown<String>(
//               options: currency,
//               margin: EdgeInsets.only(left: 20.h, right: 20.h),
//               controller: useTextEditingController(text: 'Select currency'),
//               hint: 'Currency',
//               displayName: (v) => v,
//               onSelected: (item) {}),
//           BiaTextField(
//             controller: TextEditingController(text: 'Enter address line 1'),
//             hint: 'Address line 1',
//           ),
//           BiaTextField(
//             controller: TextEditingController(text: 'Enter address line 2'),
//             hint: 'Address line 2',
//           ),
//           BiaTextField(
//             controller: TextEditingController(text: 'Enter zip code'),
//             hint: 'Zip code',
//           ),
//           BiaTextField(
//             controller: TextEditingController(text: 'Enter city'),
//             hint: 'City',
//           ),
//           BiaTextField(
//             controller: TextEditingController(text: 'Enter state'),
//             hint: 'State',
//           ),
//           BiaDropdown<String>(
//               options: country,
//               margin: EdgeInsets.only(left: 20.h, right: 20.h),
//               controller: useTextEditingController(text: 'Select country'),
//               hint: 'Country',
//               displayName: (v) => v,
//               onSelected: (item) {}),
//           BiaTextField(
//             controller: TextEditingController(text: 'Enter tzx'),
//             hint: 'Tax',
//           ),
//           BiaTextField(
//             controller: TextEditingController(text: 'Enter note/comment'),
//             hint: 'Notes/Comment',
//           ),
//           BiaTextField(
//             controller: TextEditingController(text: 'Enter website'),
//             hint: 'Website',
//           ),
//           BiaButton(
//             text: 'Next',
//             onPressed: () {},
//             color: Colors.lightGreen,
//           ),
//           SizedBox(
//             height: 20.h,
//           ),
//         ],
//       ),
//     );
//   }
// }
