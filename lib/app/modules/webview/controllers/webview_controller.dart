import 'dart:io';

import 'package:biapay_app/app/widgets/export_file.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/scheduler.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewStaticController extends GetxController {
  var urlLink="".obs;

  @override
  void onInit() {
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      if (Platform.isAndroid) WebView.platform = AndroidWebView();

      getUrlLink();
    });
    // TODO: implement onInit
    super.onInit();
  }

  getUrlLink() {
    if (Get.arguments != null) {
      urlLink.value = Get.arguments;
      print("Url is ${urlLink}");
      update();
    }
  }
}
