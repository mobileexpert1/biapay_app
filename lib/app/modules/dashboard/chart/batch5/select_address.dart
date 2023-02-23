// import 'package:biapay_app/presentation/common/biapay_ui_package.dart';
// import 'package:flutter/cupertino.dart';

// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// class SelectAddress extends StatefulWidget {
//   const SelectAddress({Key? key}) : super(key: key);

//   @override
//   _SelectAddressState createState() => _SelectAddressState();
// }

// class _SelectAddressState extends State<SelectAddress> {
//   List<String> provinces = ["Sylhet", "Dhaka"];

//   List<String> towns = ["Sunamganj", "Mirpur"];

//   List<String> categorys = ["Category1", "Category2"];

//   TextEditingController province = TextEditingController();

//   TextEditingController town = TextEditingController();

//   TextEditingController search = TextEditingController();

//   TextEditingController category = TextEditingController();
//   @override
//   Widget build(BuildContext context) {
//     return BiaScaffold(
//         appBar: AppBar(
//             leading: Icon(
//               Icons.arrow_back,
//               color: Colors.black,
//             ),
//             backgroundColor: Colors.white,
//             // The search area here
//             title: Container(
//               width: double.infinity,
//               height: 40,
//               decoration: BoxDecoration(
//                   color: Colors.grey[200],
//                   borderRadius: BorderRadius.circular(5)),
//               child: Center(
//                 child: TextField(
//                   decoration: InputDecoration(
//                       prefixIcon: Icon(Icons.search),
//                       suffixIcon: IconButton(
//                         icon: Icon(Icons.clear),
//                         onPressed: () {
//                           /* Clear the search field */
//                         },
//                       ),
//                       hintText: 'Search...',
//                       border: InputBorder.none),
//                 ),
//               ),
//             )),
//         body: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Column(
//                 children: [
//                   BiaDropdown(
//                       options: provinces,
//                       controller: province,
//                       hint: "Select Province",
//                       displayName: (dynamic v) => v.toString(),
//                       onSelected: (dynamic v) {}),
//                   Padding(
//                     padding:
//                         const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
//                     child: BiaDropdown(
//                         options: towns,
//                         controller: town,
//                         hint: "Select Town",
//                         displayName: (dynamic v) => v.toString(),
//                         onSelected: (dynamic v) {}),
//                   ),
//                   Padding(
//                     padding:
//                         const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
//                     child: BiaDropdown(
//                         options: categorys,
//                         controller: category,
//                         hint: "Select Category",
//                         displayName: (dynamic v) => v.toString(),
//                         onSelected: (dynamic v) {}),
//                   ),
//                 ],
//               ),
//               BiaButton.greenButtonInRow(text: "Search", onPressed: () {})
//             ],
//           ),
//         ));
//   }
// }
