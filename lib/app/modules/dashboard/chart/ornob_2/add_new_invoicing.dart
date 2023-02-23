// import 'package:biapay_app/presentation/common/widgets/common/bia_dropdown.dart';
// import 'package:biapay_app/presentation/common/biapay_ui_package.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_hooks/flutter_hooks.dart';

// class AddNewInvoicing extends HookWidget {
//   const AddNewInvoicing({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final List<String> name = ['Name 1', 'Name 2', 'Name 3'];
//     final List<String> shop = ['Shop 1', 'Shop 2', 'Shop 3'];
//     final List<String> pos = ['POS 1', 'POS 2', 'POS 3'];
//     final List<String> date = ['Date 1', 'Date 2', 'Date 3'];
//     final List<String> currency = [
//       'USD',
//       'Euro',
//     ];
//     final List<String> item = ['Item 1', 'Item 2', 'Item 3'];

//     return BiaScaffold(
//       appBar: BiaAppBar.simple('Add new invoice'),
//       body: ListView(
//         children: [
//           SizedBox(
//             height: 20.h,
//           ),
//           BiaDropdown<String>(
//               options: name,
//               margin: EdgeInsets.only(left: 20.h, right: 20.h),
//               controller: useTextEditingController(text: 'Select name'),
//               hint: 'Add customer',
//               displayName: (v) => v,
//               onSelected: (item) {}),
//           SizedBox(
//             height: 5.h,
//           ),
//           BiaDropdown<String>(
//               options: shop,
//               margin: EdgeInsets.only(left: 20.h, right: 20.h),
//               controller: useTextEditingController(text: 'Select shop'),
//               hint: 'Shop',
//               displayName: (v) => v,
//               onSelected: (item) {}),
//           SizedBox(
//             height: 5.h,
//           ),
//           BiaDropdown<String>(
//               options: pos,
//               margin: EdgeInsets.only(left: 20.h, right: 20.h),
//               controller: useTextEditingController(text: 'Select POS'),
//               hint: 'POS(1st one)',
//               displayName: (v) => v,
//               onSelected: (item) {}),
//           BiaTextField(
//             controller: TextEditingController(text: "Select invoice date"),
//             hint: 'Invoice date',
//           ),
//           BiaTextField(
//             controller: TextEditingController(text: ""),
//             hint: 'Invoice number',
//           ),
//           BiaDropdown<String>(
//               options: date,
//               margin: EdgeInsets.only(left: 20.h, right: 20.h),
//               controller: useTextEditingController(text: 'Select date'),
//               hint: 'Due date',
//               displayName: (v) => v,
//               onSelected: (item) {}),
//           SizedBox(
//             height: 5.h,
//           ),
//           BiaTextField(
//             padding: EdgeInsets.only(left: 20.h, right: 20.h),
//             controller: useTextEditingController(text: 'Select date'),
//             hint: "Delivery date",
//             suffixIcon: const Icon(Icons.calendar_today),
//           ),
//           BiaDropdown<String>(
//               options: currency,
//               margin: EdgeInsets.only(
//                   left: 20.h, right: 20.h, top: 5.h, bottom: 5.h),
//               controller: useTextEditingController(text: 'Select currency'),
//               hint: 'Currency',
//               displayName: (v) => v,
//               onSelected: (item) {}),
//           BiaTextField(
//             controller: TextEditingController(text: "Enter order number"),
//             hint: 'Invoice number',
//           ),
//           Container(
//             margin: EdgeInsets.only(left: 20.h, right: 20.h),
//             width: double.infinity,
//             height: 80.h,
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 BiaText(
//                   'Item description',
//                   fontSize: 28.h,
//                   color: Colors.white,
//                   fontWeight: FontWeight.bold,
//                 ),
//                 TextButton(
//                     onPressed: () {},
//                     child: Row(
//                       children: <Widget>[
//                         Icon(
//                           Icons.add_circle_outline,
//                           color: Colors.white,
//                           size: 35.h,
//                         ),
//                         BiaText(
//                           'Add new item',
//                           fontSize: 20.h,
//                           color: Colors.white,
//                         )
//                       ],
//                     )),
//               ],
//             ),
//           ),
//           BiaDropdown<String>(
//               options: item,
//               margin: EdgeInsets.only(
//                   left: 20.h, right: 20.h, top: 5.h, bottom: 5.h),
//               controller: useTextEditingController(text: 'Select item'),
//               hint: 'Item',
//               displayName: (v) => v,
//               onSelected: (item) {}),
//           BiaTextField(
//             controller: TextEditingController(text: "Enter description"),
//             hint: 'Description',
//           ),
//           BiaTextField(
//             controller: TextEditingController(text: "Enter quantity"),
//             hint: 'Quantity',
//           ),
//           BiaTextField(
//             controller: TextEditingController(text: "Enter price"),
//             hint: 'Price',
//           ),
//           Padding(
//             padding: EdgeInsets.only(left: 20.h),
//             child: BiaText(
//               'Discount(% or amount)',
//               color: Colors.white,
//               fontSize: 20.h,
//             ),
//           ),
//           Row(
//             children: [
//               Checkbox(
//                 value: false,
//                 onChanged: (value) {},
//                 activeColor: Colors.white,
//               ),
//               BiaText(
//                 'Percentage',
//                 color: Colors.white,
//                 fontSize: 20.h,
//               ),
//               SizedBox(
//                 width: 80.h,
//               ),
//               Checkbox(
//                 value: false,
//                 onChanged: (value) {},
//                 activeColor: Colors.white,
//               ),
//               BiaText(
//                 'Fixed amount',
//                 color: Colors.white,
//                 fontSize: 20.h,
//               ),
//             ],
//           ),
//           BiaTextField(
//             controller: TextEditingController(text: "Enter tax"),
//             hint: 'Tax %',
//           ),
//           BiaTextField(
//             controller: TextEditingController(text: "Enter shipping fee"),
//             hint: 'Shipping fee',
//           ),
//           BiaTextField(
//             controller: TextEditingController(text: ""),
//             hint: 'Tax',
//           ),
//           BiaTextField(
//             controller: TextEditingController(text: ""),
//             hint: 'Discount value',
//           ),
//           BiaTextField(
//             controller: TextEditingController(text: ""),
//             hint: 'Subtotal',
//           ),
//           SizedBox(
//             height: 10.h,
//           ),
//           Padding(
//             padding: EdgeInsets.only(left: 20.h),
//             child: Row(
//               children: [
//                 BiaText(
//                   ' Global discount',
//                   color: Colors.white,
//                   fontSize: 20.h,
//                 ),
//                 SizedBox(
//                   width: 120.h,
//                 ),
//                 BiaText(
//                   ' 434',
//                   color: Colors.white,
//                   fontSize: 20.h,
//                 ),
//               ],
//             ),
//           ),
//           Container(
//             margin: EdgeInsets.only(left: 20.h, right: 20.h, top: 20.h),
//             decoration: BoxDecoration(
//               border: Border.all(color: Colors.white),
//             ),
//           ),
//           SizedBox(
//             height: 10.h,
//           ),
//           Padding(
//             padding: EdgeInsets.only(left: 20.h),
//             child: Row(
//               children: [
//                 BiaText(
//                   ' Global coupons',
//                   color: Colors.white,
//                   fontSize: 20.h,
//                 ),
//                 SizedBox(
//                   width: 120.h,
//                 ),
//                 BiaText(
//                   ' 41',
//                   color: Colors.white,
//                   fontSize: 20.h,
//                 ),
//               ],
//             ),
//           ),
//           Container(
//             margin: EdgeInsets.only(left: 20.h, right: 20.h, top: 20.h),
//             decoration: BoxDecoration(
//               border: Border.all(color: Colors.white),
//             ),
//           ),
//           SizedBox(
//             height: 10.h,
//           ),
//           Padding(
//             padding: EdgeInsets.only(left: 20.h),
//             child: Row(
//               children: [
//                 BiaText(
//                   'Tax 1(...%)',
//                   color: Colors.white,
//                   fontSize: 20.h,
//                 ),
//                 SizedBox(
//                   width: 180.h,
//                 ),
//                 BiaText(
//                   ' 1',
//                   color: Colors.white,
//                   fontSize: 20.h,
//                 ),
//               ],
//             ),
//           ),
//           Container(
//             margin: EdgeInsets.only(left: 20.h, right: 20.h, top: 20.h),
//             decoration: BoxDecoration(
//               border: Border.all(color: Colors.white),
//             ),
//           ),
//           SizedBox(
//             height: 10.h,
//           ),
//           Padding(
//             padding: EdgeInsets.only(left: 20.h),
//             child: Row(
//               children: [
//                 BiaText(
//                   'Tax 2(...%)',
//                   color: Colors.white,
//                   fontSize: 20.h,
//                 ),
//                 SizedBox(
//                   width: 180.h,
//                 ),
//                 BiaText(
//                   ' 2',
//                   color: Colors.white,
//                   fontSize: 20.h,
//                 ),
//               ],
//             ),
//           ),
//           Container(
//             margin: EdgeInsets.only(left: 20.h, right: 20.h, top: 20.h),
//             decoration: BoxDecoration(
//               border: Border.all(color: Colors.white),
//             ),
//           ),
//           SizedBox(
//             height: 10.h,
//           ),
//           Padding(
//             padding: EdgeInsets.only(left: 20.h),
//             child: Row(
//               children: [
//                 BiaText(
//                   'Total',
//                   color: Colors.white,
//                   fontSize: 20.h,
//                 ),
//                 SizedBox(
//                   width: 180.h,
//                 ),
//                 BiaText(
//                   ' 23453467',
//                   color: Colors.white,
//                   fontSize: 20.h,
//                 ),
//               ],
//             ),
//           ),
//           Container(
//             margin: EdgeInsets.only(left: 20.h, right: 20.h, top: 20.h),
//             decoration: BoxDecoration(
//               border: Border.all(color: Colors.white),
//             ),
//           ),
//           BiaButton(
//             text: 'Save',
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
