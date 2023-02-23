// import 'package:biapay_app/presentation/common/biapay_ui_package.dart';
// import 'package:biapay_app/presentation/common/widgets/common/bia_appbar.dart';
// import 'package:biapay_app/presentation/common/widgets/common/bia_scaffold.dart';
// import 'package:biapay_app/presentation/common/widgets/common/bia_text.dart';
// import 'package:flutter/material.dart';

// class MYMails extends StatelessWidget {
//   const MYMails({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     const String loremIpsum =
//         '''Lorem ipsum dolor sit amet, conse ctetur adipis cing elit. Fusce luctus nisl pretium nisi iaculis convallis. Suspe ndisse finibus risus ultricies ornare placerat. Donec nec nibh id felis aliquam pharetra id vitae eros. Vivamus ac ex et massa laoreet fringilla. Morbi sollicitudin lectus non rhoncus commodo. Donec leo risus, facilisis eu vestibulum vitae, condimentum sed quam. In lacus tortor, consectetur a risus ut, ma''';
//     const String imagex =
//         "https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940";

//     return BiaScaffold(
//         appBar: BiaAppBar.simple('My mails'),
//         body: ListView(
//           children: [
//             SizedBox(
//               height: 20.h,
//             ),
//             Padding(
//               padding: EdgeInsets.symmetric(vertical: 20.h),
//               child: BiaText(
//                 'All mails',
//                 color: Colors.white,
//                 fontSize: 30.h,
//               ),
//             ),
//             Container(
//               //margin: EdgeInsets.symmetric(vertical: 10.h),
//               clipBehavior: Clip.hardEdge,
//               padding: EdgeInsets.symmetric(vertical: 10.h),
//               decoration: const BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.only(
//                     topRight: Radius.circular(10),
//                     topLeft: Radius.circular(10),
//                   )),
//               child: Column(
//                 children: const [
//                   BiaNotificationTile(
//                       image: imagex, title: 'John Doe', details: loremIpsum),
//                   BiaNotificationTile(
//                     image: imagex,
//                     title: 'John Doe',
//                     details: loremIpsum,
//                     count: 2,
//                   ),
//                   BiaNotificationTile(
//                     image: imagex,
//                     title: 'John Doe',
//                     details: loremIpsum,
//                     count: 6,
//                   ),
//                 ],
//               ),
//             ),
//             Container(
//               // margin: EdgeInsets.symmetric(vertical: 10.h),
//               clipBehavior: Clip.hardEdge,
//               padding: EdgeInsets.symmetric(vertical: 10.h),
//               decoration: const BoxDecoration(
//                 color: Colors.white,
//               ),
//               child: Column(
//                 children: const [
//                   BiaNotificationTile(
//                       image: imagex, title: 'John Doe', details: loremIpsum),
//                   BiaNotificationTile(
//                     image: imagex,
//                     title: 'John Doe',
//                     details: loremIpsum,
//                     count: 2,
//                   ),
//                   BiaNotificationTile(
//                     image: imagex,
//                     title: 'John Doe',
//                     details: loremIpsum,
//                     count: 6,
//                   ),
//                 ],
//               ),
//             ),
//             Container(
//               //  margin: EdgeInsets.symmetric(vertical: 10.h),
//               clipBehavior: Clip.hardEdge,
//               padding: EdgeInsets.symmetric(vertical: 10.h),
//               decoration: const BoxDecoration(
//                 color: Colors.white,
//               ),
//               child: Column(
//                 children: const [
//                   BiaNotificationTile(
//                       image: imagex, title: 'John Doe', details: loremIpsum),
//                   BiaNotificationTile(
//                     image: imagex,
//                     title: 'John Doe',
//                     details: loremIpsum,
//                     count: 2,
//                   ),
//                   BiaNotificationTile(
//                     image: imagex,
//                     title: 'John Doe',
//                     details: loremIpsum,
//                     count: 6,
//                   ),
//                 ],
//               ),
//             ),
//             SizedBox(
//               height: 10.h,
//             )
//           ],
//         ));
//   }
// }
