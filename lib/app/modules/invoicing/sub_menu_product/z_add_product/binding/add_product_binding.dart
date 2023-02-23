import 'package:biapay_app/app/modules/invoicing/sub_menu_product/z_add_product/controller/add_product_controller.dart';

import '../../../../../widgets/export_file.dart';

class AddProductBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddProductController>(
          () => AddProductController(),
    );
  }
}