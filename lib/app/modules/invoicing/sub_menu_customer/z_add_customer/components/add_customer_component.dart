
import 'package:biapay_app/app/modules/invoicing/sub_menu_customer/z_add_customer/controller/add_customer_controller.dart';
import 'package:country_code_picker/country_code_picker.dart';

import '../../../../../widgets/export_file.dart';

class AddCustomerComponent {

  Widget viewHolder(AddCustomerController controller, BuildContext context) {
  return ListView(
      children: [

        BiaDropdown<String>(
          options: [LocaleKeys.male.tr, LocaleKeys.female.tr],
          margin: EdgeInsets.zero,
          hint: LocaleKeys.gender.tr,
          controller: controller.gender,
          displayName: (v) => v,
          onSelected: (v) => () {},
        ),
        SizedBox(height: 15),
        BiaTextField(
          hint: LocaleKeys.first_name.tr,
          padding: EdgeInsets.zero,
          controller: controller.firstName,
        ),
        SizedBox(height: 15),
        BiaTextField(
          hint: LocaleKeys.last_name.tr,
          padding: EdgeInsets.zero,
          controller: controller.lastName,
        ),
        SizedBox(height: 15),

        Row(

          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BiaText(LocaleKeys.country.tr, color: Colors.white, fontSize: 17),
                SizedBox(height:5),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5.r)
                  ),
                  width: 120,
                  height: 60,
                  child: CountryCodePicker(
                    barrierColor: Colors.black12,
                    //padding: EdgeInsets.only(left: 20.w),
                    showFlag: true,
                    onChanged: (code) {
                      print(code);
                      controller.countryCode = code.toString();
                    },
                    initialSelection: 'US',
                  ),
                ),
              ],
            ),
            SizedBox(width: 5,),
            Expanded(
              child: BiaTextField(
                hint: LocaleKeys.mobile_number.tr,
                padding: EdgeInsets.zero,
                controller: controller.mobileNumber,
              ),
            ),
          ],
        ),
        SizedBox(height: 15),
        BiaTextField(
          hint: LocaleKeys.email_address.tr,
          padding: EdgeInsets.zero,
          controller: controller.emailId,
        ),
        SizedBox(height: 15),
        BiaTextField(
          hint: LocaleKeys.reference.tr,
          padding: EdgeInsets.zero,
          controller: controller.reference,
        ),
        SizedBox(height: 15),
        BiaTextField(
          hint: LocaleKeys.address_one.tr,
          padding: EdgeInsets.zero,
          controller: controller.address1,
        ),
        SizedBox(height: 15),
        BiaTextField(
          hint: LocaleKeys.address_two.tr,
          padding: EdgeInsets.zero,
          controller: controller.address2,
        ),
        SizedBox(height: 15),
        GetBuilder<AddCustomerController>(builder: (controller){return
          BiaDropdown<String>(
            options: controller.currencyElementList,
            margin: EdgeInsets.zero,
            hint: LocaleKeys.currency.tr,
            controller: controller.currency,
            displayName: (v) => v,
            onSelected: (v) => controller.getCurrencyId(v),
          );}),
        SizedBox(height: 15),
        GetBuilder<AddCustomerController>(builder: (controller){
          return BiaDropdown<String>(
            options: controller.countryElementList,
            margin: EdgeInsets.zero,
            hint: LocaleKeys.country.tr,
            controller: controller.country,
            displayName: (v) => v,
            onSelected: (v) => controller.setStateListWithSelectedCountry(v),
          );
        }),
        SizedBox(height: 15),
        GetBuilder<AddCustomerController>(builder: (controller){
          return BiaDropdown<String>(
            options: controller.stateElementList,
            margin: EdgeInsets.zero,
            hint: LocaleKeys.state.tr,
            controller: controller.state,
            displayName: (v) => v,
            onSelected: (v) => controller.getSelectedState(v),
          );
        }),
        SizedBox(height: 15),
        BiaTextField(
          hint: LocaleKeys.city.tr,
          padding: EdgeInsets.zero,
          controller: controller.city,
        ),
        SizedBox(height: 15),
        BiaTextField(
          hint: LocaleKeys.zip_code.tr,
          padding: EdgeInsets.zero,
          controller: controller.zipCode,
        ),
        SizedBox(height: 15),
        BiaTextField(
          hint: LocaleKeys.taxRate.tr,
          padding: EdgeInsets.zero,
          controller: controller.taxRate,
        ),
        SizedBox(height: 15),
        BiaTextField(
          hint: LocaleKeys.website.tr,
          padding: EdgeInsets.zero,
          controller: controller.website,
        ),
        SizedBox(height: 25),
        GetBuilder<AddCustomerController>(builder: (controller) {
          return Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.white, width: 1)
            ),
            width: MediaQuery.of(context).size.width / 2.25,
            child: TextButton(
                onPressed : (){
                  controller.setCustomerMap();
                },
                child: BiaText(
                  LocaleKeys.add_customer.tr,
                  fontSize: 20.h,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                )),
          );
        })
      ]
  );
  }

}