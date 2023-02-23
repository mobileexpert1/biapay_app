// import 'package:biapay_app/domain/i_auth_provider.dart';
// import 'package:biapay_app/domain/i_info_provider.dart';
// import 'package:biapay_app/presentation/common/biapay_ui_package.dart';
// import 'package:biapay_app/service/qr/qr_controller.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';

// class ScanToPayScreen extends StatelessWidget {
//   ScanToPayScreen({Key? key}) : super(key: key);
//   final QrController controller = Get.put(QrController(
//       authProvider: Get.find<IAuthProvider>(),
//       infoProvider: Get.find<IInfoProvider>()));
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: const BiaAppBar(),
//       body: Center(
//         child: InkWell(
//           onTap: () {
//             controller.qrScanToPay();
//           },
//           child: Container(
//             height: 300.w,
//             width: 300.w,
//             alignment: Alignment.center,
//             decoration: BoxDecoration(
//                 color: Colors.black12,
//                 shape: BoxShape.circle,
//                 border: Border.all(
//                     width: 4,
//                     color: Theme.of(context).colorScheme.primaryVariant)),
//             child: BiaText(
//               'scan_to_pay'.tr,
//               textType: TextType.headLine4,
//               color: Colors.white70,
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
