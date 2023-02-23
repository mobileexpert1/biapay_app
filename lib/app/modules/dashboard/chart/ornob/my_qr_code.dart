// import 'package:biapay_app/presentation/common/biapay_ui_package.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:biapay_app/resources/assets.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// class MyQrCode extends StatefulWidget {
//   const MyQrCode({Key? key}) : super(key: key);

//   @override
//   _MyQrCodeState createState() => _MyQrCodeState();
// }

// class _MyQrCodeState extends State<MyQrCode> {
//   @override
//   Widget build(BuildContext context) {
//     return BiaScaffold(
//       appBar: BiaAppBar.simple('QR code'),
//       body: Container(
//         padding: EdgeInsets.all(20.h),
//         alignment: Alignment.center,
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             BiaText(
//               'QR code',
//               fontSize: 40.h,
//               color: Colors.white,
//             ),
//             Column(
//               children: [
//                 Image.asset(
//                   Assets.qrCodeProfile,
//                   width: 200.w,
//                 ),
//                 BiaText(
//                   'Jhon Doe',
//                   fontSize: 35.h,
//                   color: Colors.white,
//                 ),
//                 BiaText(
//                   'Scan the QR code to connect',
//                   fontSize: 24.h,
//                   color: Colors.white,
//                   fontWeight: FontWeight.w300,
//                 ),
//               ],
//             ),
//             BiaButton.customWidget(
//                 onPressed: () {},
//                 child: Row(
//                   children: const [
//                     Icon(
//                       Icons.document_scanner,
//                       color: Colors.white,
//                       size: 30,
//                     ),
//                     SizedBox(width: 10),
//                     BiaText(
//                       'Scan to pay',
//                       color: Colors.white,
//                       textType: TextType.headLine5,
//                     ),
//                   ],
//                 )),
//           ],
//         ),
//       ),
//     );
//   }
// }
