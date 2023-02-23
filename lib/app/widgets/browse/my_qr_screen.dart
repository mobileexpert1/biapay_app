// import 'package:biapay_app/presentation/common/biapay_ui_package.dart';
// import 'package:biapay_app/service/qr/qr_controller.dart';
// import 'package:get/get.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:qr_flutter/qr_flutter.dart';

// import 'widget/profile_item.dart';

// class MyQrScreen extends StatelessWidget {
//   const MyQrScreen({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return GetBuilder<QrController>(
//       builder: (controller) {
//         return Scaffold(
//           appBar: const BiaAppBar(),
//           body: Padding(
//             padding: EdgeInsets.symmetric(horizontal: 15.w),
//             child: Column(
//               children: [
//                 Container(
//                   margin:
//                       EdgeInsets.symmetric(vertical: 20.h, horizontal: 40.w),
//                   padding: EdgeInsets.symmetric(vertical: 20.h),
//                   width: double.infinity,
//                   color: Colors.white,
//                   child: Column(
//                     children: [
//                       BiaText(
//                         'scan_and_pay'.tr,
//                         textType: TextType.headLine5,
//                         color: Colors.black,
//                       ),
//                       QrImage(
//                         data: controller.code,
//                         size: 300.w,
//                       )
//                     ],
//                   ),
//                 ),
//                 Container(
//                   margin: EdgeInsets.all(15.w),
//                   padding: EdgeInsets.symmetric(vertical: 20.h),
//                   decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(10),
//                       color: Colors.white),
//                   child: Column(
//                     children: [
//                       ProfileItem(
//                           title:
//                               controller.merchantInfo.profileInfo.merchantName,
//                           subTitle: 'Name',
//                           onTap: () {}),
//                       ProfileItem(
//                           title: controller.merchantInfo.email,
//                           subTitle: 'Email',
//                           onTap: () {}),
//                       ProfileItem(
//                           title: controller.merchantInfo.profileInfo.phoneNo,
//                           subTitle: 'Phone Number',
//                           onTap: () {}),
//                       BiaText(
//                         'show_qr_formoney_text'.tr,
//                         padding: EdgeInsets.symmetric(horizontal: 20.w),
//                         textType: TextType.headLine5,
//                         // fontWeight: FontWeight.w700,
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         );
//       },
//     );
//   }
// }
