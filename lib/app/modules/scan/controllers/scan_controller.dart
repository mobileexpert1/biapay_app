import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class ScanController extends GetxController {
  //TODO: Implement ScanController
  final qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController? controller;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    controller?.dispose();
  }

  @override
  InternalFinalCallback<void> get onStart {
    if (Platform.isAndroid) {
      controller?.pauseCamera();
    } else if (Platform.isIOS) {
      controller?.resumeCamera();
    }
    return super.onStart;
  }

  void onQrCreated(QRViewController p1) {
    this.controller = controller;
    controller?.scannedDataStream.listen((scanData) {
      print(scanData);
    });
  }
}
