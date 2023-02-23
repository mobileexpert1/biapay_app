import 'package:biapay_app/app/widgets/helper_widget.dart';

import '../../../widgets/export_file.dart';
import '../controllers/customer_qr_controller.dart';

class CustomerQrView extends StatelessWidget {
  var controller = Get.put(CustomerQrController());

  @override
  Widget build(BuildContext context) {
    return BiaScaffold(
        resizeToAvoidBottomInset: false,
        appBar: BiaAppBar(
          centerTitle: false,
          showAction: false,
          showIcon: true,
        ),
        body: GetBuilder<CustomerQrController>(builder: (controller){
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 50.h,),
              controller.qrCodeImage!=null?qrCodeImage():Container(),
              SizedBox(height: 30.h,),
              controller.barCodeImage!=null?barCodeImage():Container()
            ],
          );
        },

        ));
  }

  qrCodeImage() {
    return Image.memory(
      controller.qrCodeImage!,
      height: 300.h,
      width: 300.w,
      fit: BoxFit.fill,
    );
  }

  barCodeImage() {
    return Image.memory(
      controller.barCodeImage!,
      height: 170.h,
      width: Get.width,
      fit: BoxFit.fill,
    );
  }
}
