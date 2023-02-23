import 'package:biapay_app/app/modules/invoicing/sub_menu_customer/z_add_customer/components/add_customer_component.dart';
import 'package:biapay_app/app/modules/invoicing/sub_menu_customer/z_add_customer/controller/add_customer_controller.dart';
import '../../../../../widgets/export_file.dart';

class AddCustomerView extends GetView<AddCustomerController> {
  @override
  Widget build(BuildContext context) {
    return BiaScaffold(
      appBar: BiaAppBar.simple(LocaleKeys.add_customer.tr, isShowFilter: true),
      body: Container(
        padding: EdgeInsets.only(top: 20.h),
        child: AddCustomerComponent().viewHolder(controller, context)
      ),
    );
  }
}