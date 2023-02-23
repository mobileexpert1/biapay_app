import 'package:biapay_app/app/widgets/biapay_ui_package.dart';
import 'package:biapay_app/generated/locales.g.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

import '../controllers/scan_controller.dart';

class ScanView extends GetView<ScanController> {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ScanController());
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: BiaText(
          LocaleKeys.scan_to_pay_title.tr,
          color: Colors.white,
          textType: TextType.headLine5,
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
      ),
      body: QRView(
        key: controller.qrKey,
        overlay: QrScannerOverlayShape(
          borderRadius: 20,
          borderWidth: 10,
          borderColor: Colors.white,
        ),
        onQRViewCreated: controller.onQrCreated,
      ),
    );
  }
}
