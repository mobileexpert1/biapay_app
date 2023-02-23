import 'package:webview_flutter/webview_flutter.dart';

import '../../../widgets/export_file.dart';
import '../controllers/webview_controller.dart';

class WebViewScreen extends StatelessWidget {
  var controller = Get.put(WebViewStaticController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BiaAppBar.simple(LocaleKeys.web_view.tr),
      body: GetBuilder<WebViewStaticController>(builder: (controller){
        return controller.urlLink.value==""?
            Container(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation(Colors.white),
              ),
            )
            :WebView(
          onPageStarted: (data) {
            Get.showLoader();
          },
          onPageFinished: (data) {
            Get.closeLoader();
          },
          onProgress: (progress) {
            print("check progress ${progress}");
          },
          initialUrl: controller.urlLink.value,
        );
      }),
    );
  }
}
