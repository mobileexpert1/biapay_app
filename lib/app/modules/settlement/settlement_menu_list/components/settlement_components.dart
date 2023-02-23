import 'package:biapay_app/app/modules/settlement/settlement_menu_list/controller/settlement_controller.dart';
import '../../../../widgets/export_file.dart';

class SettlementComponent {
  List<String> menus = [LocaleKeys.settlement_account.tr, LocaleKeys.settlement_report.tr];

  Widget invoicingMenu(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 25.h),
      child: invoicingMenuList(context),
    );
  }

  Widget invoicingMenuList(BuildContext context) {
    return Column(
      children: [for (var item in menus) invoicingMenuItem(context, item)],
    );
  }

  Widget invoicingMenuItem(BuildContext context, String rowTitle) {
    return Padding(
      padding: EdgeInsets.only(top: 10.h, bottom: 10.h),
      child: GestureDetector(
        onTap: () {
          SettlementController().handleNavigationFormInvoicing((menus.indexOf(rowTitle)));
        },
        child: Container(
            width: Get.width,
            height: 55.h,
            decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(15.r)),
            child: menuItemRow(rowTitle)),
      ),
    );
  }

  Widget menuItemRow(String rowTitle) {
    return Align(
        alignment: Alignment.centerLeft, child: Padding(padding: EdgeInsets.only(left: 20.w, right: 20.w), child: menuItemRowBody(rowTitle)));
  }

  Widget menuItemRowBody(String rowTitle) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        BiaText(
          rowTitle,
          fontSize: 18.sp,
          fontWeight: FontWeight.w600,
        ),
        Icon(Icons.arrow_forward_ios_rounded, size: 20.h)
      ],
    );
  }
}