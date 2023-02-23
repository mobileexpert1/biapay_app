import 'package:biapay_app/app/modules/kyc/controllers/kyc_controller.dart';
import 'package:biapay_app/app/widgets/biapay_ui_package.dart';
import 'package:biapay_app/app/widgets/browse/custom_file/custom_dropdown.dart';
import 'package:biapay_app/app/widgets/export_file.dart';
import 'package:biapay_app/generated/locales.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class PersonnalInfosKyc extends StatelessWidget {
  final controller = Get.find<KycController>();

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisSize: MainAxisSize.min, children: [
      /*Container(
          padding: EdgeInsets.all(10.w),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(10)),
          child: CustomDropDown(
            title: 'Select Category',
            onTap: (value) {
              // controller.setCategory(value!);
            },
            options: ["One", "Two"],
            value: "One",
          )),
      SizedBox(
        height: 10,
      ),*/
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BiaText(
            LocaleKeys.profile_details.tr + ":",
            textType: TextType.headLine5,
            color: Colors.white,
            padding: EdgeInsets.symmetric(vertical: 10.h),
            // color: Colors.white,
          ),
          BiaTextField(
            borderColor: Colors.black,
            controller: controller.nameController,
            onChanged: (e) => controller.kyc.value.name = e,
            hint: LocaleKeys.name.tr,
            textColor: Colors.black,
            hintColor: Colors.black,
            padding: EdgeInsets.symmetric(vertical: 10.h),
          ),
          BiaTextField(
            borderColor: Colors.black,
            controller: controller.emailController,
            onChanged: (e) => controller.kyc.value.emailid = e,
            hint: LocaleKeys.email.tr,
            textColor: Colors.black,
            hintColor: Colors.black,
            padding: EdgeInsets.symmetric(vertical: 10.h),
          ),
          SizedBox(
            height: 10.h,
          ),

          BiaText(LocaleKeys.phn_number.tr,color: Colors.white,
          fontSize: 23.sp,fontWeight: FontWeight.w300,
          ),

          SizedBox(
            height: 10.h,
          ),
          phnTextWidget(),
          SizedBox(
            height: 10.h,
          ),

          /*BiaTextField(
            enabled: false,
            controller: controller.phoneController,
            onChanged: (e) =>
                controller.kyc.value.mobileno = double.tryParse(e),
            hint: LocaleKeys.phn_hint.tr,
            label: LocaleKeys.phn.tr,
            borderColor: Colors.black,
            textColor: Colors.black,
            hintColor: Colors.black,
            padding: EdgeInsets.symmetric(vertical: 10.h),

          ),*/
          BiaDatePicker(
            onChanged: (date) {},
            isEnabled: true,
            controller: controller.birthDateController,
            title: LocaleKeys.birthdate.tr,
          ),
          BiaTextField(
            borderColor: Colors.black,
            controller: controller.firstAddressController,
            onChanged: (e) => controller.kyc.value.addressone = e,
            hint: LocaleKeys.address_one.tr,
            label: LocaleKeys.address_one.tr,
            textColor: Colors.black,
            maxLines: 5,
            hintColor: Colors.black,
            padding: EdgeInsets.symmetric(vertical: 10.h),
          ),
          BiaTextField(
            borderColor: Colors.black,
            controller: controller.secondAddressController,
            onChanged: (e) => controller.kyc.value.addresstwo = e,
            hint: LocaleKeys.address_two.tr,
            label: LocaleKeys.address_two.tr,
            textColor: Colors.black,
            hintColor: Colors.black,
            maxLines: 5,
            padding: EdgeInsets.zero,
          ),
          BiaTextField(
            borderColor: Colors.black,
            controller: controller.cityController,
            onChanged: (e) => controller.kyc.value.city = e,
            hint: LocaleKeys.city.tr,
            label: LocaleKeys.city.tr,
            textColor: Colors.black,
            hintColor: Colors.black,
            padding: EdgeInsets.symmetric(vertical: 10.h),
          ),
          BiaTextField(
            borderColor: Colors.black,
            controller: controller.stateController,
            onChanged: (e) => controller.kyc.value.state = e,
            hint: LocaleKeys.state.tr,
            label: LocaleKeys.state.tr,
            textColor: Colors.black,
            hintColor: Colors.black,
            padding: EdgeInsets.symmetric(vertical: 10.h),
          ),
          BiaTextField(
            borderColor: Colors.black,
            controller: controller.countryController,
            hint: LocaleKeys.country.tr,
            onChanged: (e) => controller.kyc.value.country = e,
            label: LocaleKeys.country.tr,
            textColor: Colors.black,
            hintColor: Colors.black,
            padding: EdgeInsets.symmetric(vertical: 10.h),
          ),
          BiaTextField(
            borderColor: Colors.black,
            controller: controller.zipCodeController,
            onChanged: (e) => controller.kyc.value.zipcode = int.tryParse(e),
            hint: LocaleKeys.zip_code.tr,
            // inputType: const InputFieldType.number(),
            textColor: Colors.black,
            hintColor: Colors.black,
            padding: EdgeInsets.symmetric(vertical: 10.h),
          ),
          BiaTextField(
            borderColor: Colors.black,
            controller: controller.latitudeController,
            inputType: const InputFieldType.number(),
            hint: LocaleKeys.enter_latitude.tr,
            label: 'Latitude',
            textColor: Colors.black,
            hintColor: Colors.black,
            padding: EdgeInsets.symmetric(vertical: 10.h),
            onChanged: (e) =>
                controller.kyc.value.latitude = double.tryParse(e),
          ),
          BiaTextField(
            borderColor: Colors.black,
            controller: controller.longitudeController,
            inputType: const InputFieldType.number(),
            hint: LocaleKeys.enter_longitude.tr,
            label: 'Longitude',
            textColor: Colors.black,
            padding: EdgeInsets.symmetric(vertical: 10.h),
            onChanged: (e) =>
                controller.kyc.value.longitude = double.tryParse(e),
            hintColor: Colors.black,
          )
        ],
      ),
    ]);
  }

  phnTextWidget() {
    return IntlPhoneField(
      autofocus: false,
      controller: controller.phoneController,
      decoration: InputDecoration(
        fillColor: Colors.white,
        floatingLabelBehavior: FloatingLabelBehavior.never,
        filled: true,
        counterText: "",
        labelText: 'Phone Number',
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
        ),
      ),
      initialCountryCode: 'IN',
       style: TextStyle(fontSize: 24.sp),
      onChanged: (phone) {
        if (phone.completeNumber.isNotEmpty) {
          controller.completPhnNumber.value =
              phone.completeNumber.replaceAll("+", "");
          //controller.phoneController.text = phone.completeNumber;
          controller.update();
        }

        print("check complete phn number ${controller.phoneController.text}");
        print(phone.completeNumber);
      },
    );
  }
}
