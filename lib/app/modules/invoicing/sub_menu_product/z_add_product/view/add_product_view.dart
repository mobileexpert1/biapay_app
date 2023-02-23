import 'dart:io';
import 'package:biapay_app/app/modules/invoicing/sub_menu_product/z_add_product/component/add_product_components.dart';
import 'package:biapay_app/app/modules/invoicing/sub_menu_product/z_add_product/controller/add_product_controller.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../../widgets/export_file.dart';

class AddProductView extends GetView<AddProductController> {

  @override
  Widget build(BuildContext context) {
    return BiaScaffold(
      appBar: BiaAppBar.simple(LocaleKeys.add_product.tr, isShowFilter: true),
      body: Container(
        padding: EdgeInsets.only(top: 20.h),
        child: AddProductComponent().viewHolder(controller, context)
      ),
    );
  }
}