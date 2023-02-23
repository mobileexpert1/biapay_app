// import 'package:biapay_app/domain/core/const.dart';
// import 'package:biapay_app/domain/core/style.dart';
// import 'package:biapay_app/service/localization/localization_controller.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';
// import 'package:logger/logger.dart';

// class ChangeLocaleDropDown extends StatelessWidget {
//   const ChangeLocaleDropDown({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return GetBuilder<LocalizationController>(
//         init: LocalizationController(),
//         builder: (controller) {
//           return Container(
//               decoration: BoxDecoration(
//                   border: Border.all(color: AppColors.colorBlueDark),
//                   borderRadius: BorderRadius.circular(5)),
//               padding: EdgeInsets.symmetric(horizontal: 10.w),
//               child: DropdownButton<String>(
//                 hint: Obx(
//                   () => Text(
//                     controller.currentLocale.value!,
//                     style: Style.languageHintStyle,
//                   ),
//                 ),
//                 style: Theme.of(context).primaryTextTheme.caption,
//                 underline: const SizedBox.shrink(),
//                 icon: const Icon(Icons.arrow_drop_down,
//                     color: AppColors.colorBlueDark),
//                 items: controller.langs.map((String value) {
//                   return DropdownMenuItem(
//                     value: value,
//                     child: Row(
//                       children: <Widget>[
//                         Text(
//                           value,
//                           style: Style.languageStyle,
//                         ),
//                         Icon(
//                           Icons.arrow_drop_down,
//                           size: 25.h,
//                           color: AppColors.colorBlack,
//                         )
//                       ],
//                     ),
//                   );
//                 }).toList(),
//                 onChanged: (value) {
//                   controller.changeLocale(value);
//                   Logger().d("language selected is: $value");
//                 },
//               ));
//         });
//   }
// }
