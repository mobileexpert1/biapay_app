import 'dart:io';

import 'package:biapay_app/app/configs/assets.dart';
import 'package:biapay_app/app/configs/configs.dart';
import 'package:biapay_app/app/widgets/biapay_ui_package.dart';
import 'package:biapay_app/generated/locales.g.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../widgets/browse/custom_file/image_picker_bottomsheet.dart';
import '../controllers/edit_profile_controller.dart';

class EditProfil extends StatelessWidget {
  var controller = Get.put(EditController());

  @override
  Widget build(BuildContext context) {
    return BiaScaffold(
      appBar: BiaAppBar.simple(LocaleKeys.edit_pro.tr),
      hasSidePadding: false,
      body: SingleChildScrollView(
          padding: EdgeInsets.only(top: 20),
          child: Column(
            children: [
              GetBuilder<EditController>(builder: (controller) {
                return uploadProfileWidget(context, controller);
              }),
              SizedBox(
                height: 20.h,
              ),
              BiaTextField(
                hint: LocaleKeys.enter_first_name.tr,
                label: LocaleKeys.first_name.tr,
              ),
              SizedBox(
                height: 5.h,
              ),
              BiaTextField(
                hint: LocaleKeys.enter_last_name.tr,
                label: LocaleKeys.last_name.tr,
              ),
              SizedBox(
                height: 5.h,
              ),
              BiaTextField(
                hint: LocaleKeys.enter_email.tr,
                label: LocaleKeys.email.tr,
              ),
              SizedBox(
                height: 5.h,
              ),
              BiaTextField(
                hint: 'Phone Number',
                inputType: const InputFieldType.phone(),
              ),
              SizedBox(
                height: 20.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: BiaButton.greenButtonInRow(
                  text: LocaleKeys.update.tr,
                  onPressed: () {},
                  width: double.infinity,
                ),
              ),
            ],
          )),
    );
  }

  uploadProfileWidget(context, controller) {
    return InkWell(
      onTap: () {
        showModalBottomSheet(
            context: context,
            builder: (BuildContext bc) => ImagePickerBottomSheet(
                ontap: (camera) => controller.getImage(camera, 1, "address")));
      },
      child: SizedBox(
        height: 130,
        width: 130,
        child: Stack(
          children: [
            Center(
              child: controller.uint8list != null
                  ? CircleAvatar(
                      backgroundImage: MemoryImage(controller.uint8list),
                      radius: 70,
                    )
                  : controller.profileImage == ""
                      ? CircleAvatar(
                          backgroundImage: AssetImage(Assets.scanPay),
                          radius: 70,
                        )
                      : CircleAvatar(
                          backgroundImage:
                              FileImage(File(controller.profileImage.value)),
                          radius: 70,
                        ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: InkWell(
                borderRadius: BorderRadius.circular(40),
                child: Card(
                  shape: CircleBorder(),
                  child: Padding(
                    padding: const EdgeInsets.all(5),
                    child: Icon(
                      Icons.edit_outlined,
                      color: Config.colors.primaryColor,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
