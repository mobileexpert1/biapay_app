import 'package:biapay_app/app/configs/configs.dart';
import 'package:biapay_app/app/modules/kyc/controllers/kyc_controller.dart';
import 'package:biapay_app/app/widgets/biapay_ui_package.dart';
import 'package:biapay_app/generated/locales.g.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LocationInfos extends StatelessWidget {
  const LocationInfos({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<KycController>();
    return Container(
      padding: EdgeInsets.all(10.w),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10)),
      child: Form(
        key: controller.locationKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            BiaText(
              LocaleKeys.location.tr + ":",
              textType: TextType.headLine5,
              color: Colors.white,
              padding: EdgeInsets.symmetric(vertical: 10.h),
              // color: Colors.white,
            ),

            Row(
              children: [
                Expanded(
                  child: BiaTextField(
                    borderColor: Colors.black,
                    controller: controller.latitudeController,
                    inputType: const InputFieldType.number(),
                    hint: 'Latitude',
                    label: 'Latitude',
                    textColor: Colors.black,
                    hintColor: Colors.black,
                    onChanged: (e) =>
                        controller.kyc.value.latitude = double.tryParse(e),
                  ),
                ),
                Expanded(
                  child: BiaTextField(
                    borderColor: Colors.black,
                    controller: controller.longitudeController,
                    inputType: const InputFieldType.number(),
                    hint: 'Longitude',
                    label: 'Longitude',
                    textColor: Colors.black,
                    onChanged: (e) =>
                        controller.kyc.value.longitude = double.tryParse(e),
                    hintColor: Colors.black,
                  ),
                ),
              ],
            ),
            BiaButton(
              text: LocaleKeys.my_location.tr,
              color: Config.colors.greenColor,
              textColor: Colors.white,
              onPressed: controller.getLocation,
            )
          ],
        ),
      ),
    );
  }
}
