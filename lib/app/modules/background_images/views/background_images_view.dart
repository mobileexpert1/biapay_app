import 'package:biapay_app/app/widgets/biapay_ui_package.dart';
import 'package:biapay_app/generated/locales.g.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/background_images_controller.dart';

class BackgroundImagesView extends GetView<BackgroundImagesController> {
  @override
  Widget build(BuildContext context) {
    return BiaScaffold(
      appBar: BiaAppBar.simple(LocaleKeys.background_images.tr),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(top: 10.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BiaText(
              LocaleKeys.select_background.tr,
              color: Colors.white,
              fontSize: 25.sp,
            ),
          ],
        ),
      ),
    );
  }
}
