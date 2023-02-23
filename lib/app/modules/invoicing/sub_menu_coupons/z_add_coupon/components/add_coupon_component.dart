import 'package:biapay_app/app/modules/invoicing/sub_menu_coupons/z_add_coupon/controller/add_coupon_controller.dart';

import '../../../../../widgets/export_file.dart';

class AddCouponComponent {

Widget viewHolder(AddCouponController controller, BuildContext context) {
  return ListView(
      children: [
        BiaTextField(
          hint: LocaleKeys.name.tr,
          padding: EdgeInsets.zero,
          controller: controller.name,
        ),
        SizedBox(height: 15),
        BiaTextField(
          hint: LocaleKeys.discount.tr,
          padding: EdgeInsets.zero,
          controller: controller.discount,
        ),
        SizedBox(height: 15),
        BiaDropdown<String>(
          options: ["Fixed", "%"],
          margin: EdgeInsets.zero,
          hint: LocaleKeys.type.tr,
          controller: controller.type,
          displayName: (v) => v,
          onSelected: (v) => () {},
        ),
        SizedBox(height: 15),
        BiaDatePicker(
          controller: controller.startDate,
          title: LocaleKeys.start_date.tr,
        ),
        SizedBox(height: 15),
        BiaDatePicker(
          controller: controller.endDate,
          title: LocaleKeys.end_date.tr,
        ),
        SizedBox(height: 15),
        BiaTextField(
          hint: LocaleKeys.max_no_of_user.tr,
          padding: EdgeInsets.zero,
          controller: controller.maxNoOfUser,
        ),
        SizedBox(height: 15),
        BiaDropdown<String>(
          options: [LocaleKeys.enabled.tr, LocaleKeys.disabled.tr],
          margin: EdgeInsets.zero,
          hint: LocaleKeys.status.tr,
          controller: controller.status,
          displayName: (v) => v,
          onSelected: (v) => () {},
        ),
        SizedBox(height: 25),
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.white, width: 1)
          ),
          width: MediaQuery.of(context).size.width / 2.25,
          child: TextButton(
              onPressed : (){
                controller.setCouponMap();
              },
              child: BiaText(
                LocaleKeys.save.tr,
                fontSize: 20.h,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              )),
        )
      ]
  );
}

}