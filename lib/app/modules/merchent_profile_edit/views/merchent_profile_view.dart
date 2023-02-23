import 'dart:io';

import 'package:biapay_app/app/configs/assets.dart';
import 'package:biapay_app/app/configs/configs.dart';
import 'package:biapay_app/app/widgets/biapay_ui_package.dart';
import 'package:biapay_app/app/widgets/export_file.dart';
import 'package:biapay_app/generated/locales.g.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../widgets/browse/custom_file/image_picker_bottomsheet.dart';
import '../controllers/merchent_profile_controller.dart';

class MerchentProfileView extends StatelessWidget {
  var controller = Get.put(MerchentProfileController());

  @override
  Widget build(BuildContext context) {
    return BiaScaffold(
      appBar: BiaAppBar.simple(LocaleKeys.edit_pro.tr),
      hasSidePadding: false,
      body: SingleChildScrollView(
          padding: EdgeInsets.only(top: 20),
          child: Column(
            children: [
              uploadImageAndLogoWidget(context),
              SizedBox(
                height: 20.h,
              ),
              BiaTextField(
                controller: controller.firstNameController,
                hint: LocaleKeys.enter_first_name.tr,
                label: LocaleKeys.first_name.tr,
              ),

              SizedBox(
                height: 5.h,
              ),
              BiaTextField(
                controller: controller.emailController,
                hint: LocaleKeys.enter_email.tr,
                label: LocaleKeys.email.tr,
              ),
              SizedBox(
                height: 5.h,
              ),
              BiaTextField(
                controller: controller.phnNumberController,
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

  uploadImageAndLogoWidget(context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GetBuilder<MerchentProfileController>(builder: (controller) {
          return uploadProfileWidget(
              context, controller, LocaleKeys.upload_profile_photo.tr, 0);
        }),
        SizedBox(
          width: 20.w,
        ),
        GetBuilder<MerchentProfileController>(builder: (controller) {
          return uploadProfileWidget(
              context, controller, LocaleKeys.upload_logo.tr, 1);
        })
      ],
    );
  }

  uploadProfileWidget(context, controller, title, type) {
    return InkWell(
      onTap: () {
        showModalBottomSheet(
            context: context,
            builder: (BuildContext bc) => ImagePickerBottomSheet(
                ontap: (camera) => controller.getImage(camera, 1, "address")));
      },
      child: Column(
        children: [
          BiaText(title,
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 24.sp),
          SizedBox(
            height: 15.h,
          ),
          SizedBox(
            height: 130,
            width: 130,
            child: Stack(
              children: [
                type==0?Center(
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
                              backgroundImage: FileImage(
                                  File(controller.profileImage.value)),
                              radius: 70,
                            ),
                ):Center(
                  child: controller.profileUint8list != null
                      ? CircleAvatar(
                    backgroundImage: MemoryImage(controller.profileUint8list),
                    radius: 70,
                  )
                      : controller.logoImage == ""
                      ? CircleAvatar(
                    backgroundImage: AssetImage(Assets.scanPay),
                    radius: 70,
                  )
                      : CircleAvatar(
                    backgroundImage: FileImage(
                        File(controller.logoImage.value)),
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
        ],
      ),
    );
  }
}
