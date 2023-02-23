import 'dart:io';

import 'package:biapay_app/app/modules/events/views/new_event.dart';
import 'package:biapay_app/app/modules/kyc/controllers/kyc_controller.dart';
import 'package:biapay_app/app/widgets/biapay_ui_package.dart';
import 'package:biapay_app/app/widgets/browse/custom_file/custom_dropdown.dart';
import 'package:biapay_app/app/widgets/browse/custom_file/image_picker_bottomsheet.dart';
import 'package:biapay_app/app/widgets/browse/custom_file/photo_viewer_screen.dart';
import 'package:biapay_app/app/widgets/browse/pdf_view_page.dart';
import 'package:biapay_app/app/widgets/export_file.dart';
import 'package:biapay_app/generated/locales.g.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../configs/assets.dart';

class IdentityInformationView extends StatelessWidget {
  final controller = Get.find<KycController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BiaText(
          LocaleKeys.id_info.tr + ":",
          textType: TextType.headLine5,
          color: Colors.white,
          padding: EdgeInsets.symmetric(vertical: 10.h),
          // color: Colors.white,
        ),
        SizedBox(
          height: 10.h,
        ),
        identificationTitleWidget(),
        SizedBox(
          height: 10.h,
        ),
        identificationDropWidget(),
        SizedBox(
          height: 10.h,
        ),
        identifyIdNumberWidget(),
        SizedBox(
          height: 10.h,
        ),
        dateOfDelieveryWidget(context: context),
        SizedBox(
          height: 10.h,
        ),
        stateOfDeliveryWidget(),
        SizedBox(
          height: 10.h,
        ),
        endOfDelieveryWidget(context: context),
        SizedBox(
          height: 10.h,
        ),
        Divider(
          thickness: 0.9.w,
          color: Colors.white,
        ),
        headingTitlWidget(title: LocaleKeys.upload_proof.tr + ":"),
        uploadProofWidget(context),
        // uploadProofWidget(context),
        SizedBox(
          height: 10.h,
        ),
        headingTitlWidget(title: LocaleKeys.address_proof.tr + ":"),

        uploadAddressWidget(context),

        SizedBox(
          height: 30.h,
        ),
        /*  GetBuilder<KycController>(builder: (_) {
          return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Builder(builder: (context) {
                      final uploadProof = controller
                          .kyc.value.identityInformation?.uploadProofFile.value;
                      if (uploadProof == null) return Container();
                      return InkWell(
                        onTap: () {
                          if (controller.kyc.value.identityInformation!
                              .isPdf(uploadProof)) {
                            Get.to(() => PdfViewPage(pdfFile: uploadProof));
                          } else if (controller.kyc.value.identityInformation!
                              .isImage(uploadProof)) {
                            Get.to(() => PhotoViewerScreen(image: uploadProof));
                          }
                        },
                        child: Image.file(
                          controller.kyc.value.identityInformation!
                              .uploadProofFile.value!,
                          errorBuilder: (context, error, stackTrace) =>
                              BiaText('This is not a image file'),
                        ),
                      );
                    }),
                  ],
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                child: Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Builder(builder: (context) {
                      final address = controller.kyc.value.identityInformation
                          ?.addressProofFile.value;
                      if (address == null) return Container();
                      return controller.kyc.value.identityInformation!
                              .isImage(address)
                          ? InkWell(
                              onTap: () {
                                Get.to(() => PhotoViewerScreen(
                                      image: controller
                                          .kyc
                                          .value
                                          .identityInformation
                                          ?.addressProofFile
                                          .value,
                                    ));
                              },
                              child: Image.file(
                                controller.kyc.value.identityInformation!
                                    .addressProofFile.value!,
                                errorBuilder: (context, error, stackTrace) =>
                                    BiaText('This is not a image file'),
                              ),
                            )
                          : Container();
                    }),
                    */ /*     BiaButton(
                        text: '',
                        customWidget: BiaText(
                          LocaleKeys.proof_addr.tr,
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          align: TextAlign.center,
                        ),
                        color: Colors.grey,
                        margin: EdgeInsets.symmetric(vertical: 10.h),
                        textType: TextType.body1,
                        textColor: Colors.white,
                        onPressed: () {
                          showModalBottomSheet(
                            context: context,
                            builder: (BuildContext bc) =>
                                ImagePickerBottomSheet(
                              ontap: (camera) => controller.getImage(camera, 1),
                            ),
                          );
                        }),*/ /*
                  ],
                ),
              ),
            ],
          );
        })*/
      ],
    );
  }

  headingTitlWidget({title}) {
    return BiaText(
      title ?? "",
      textType: TextType.headLine5,
      color: Colors.white,
      padding: EdgeInsets.symmetric(vertical: 10.h),
      // color: Colors.white,
    );
  }

  identificationTitleWidget() {
    return BiaText(
      LocaleKeys.identification.tr,
      color: Colors.white,
      fontSize: 22.sp,
      fontWeight: FontWeight.w300,
      padding: EdgeInsets.only(bottom: 5.h),
    );
  }

  identificationDropWidget() {
    return GetBuilder<KycController>(builder: (_) {
      return BiaDropdown<String>(
        options: ["identityCard", "Two"],
        margin: EdgeInsets.only(left: 5.h, right: 5.h),
        hint: LocaleKeys.select_identification.tr,
        outerLabel: false,
        controller: controller.idNumberDropController,
        displayName: (v) => v,
        onSelected: (v) => () {},
      );
    });
  }

  identifyIdNumberWidget() {
    return BiaTextField(
      borderColor: Colors.black,
      controller: controller.idNumberController,
      onChanged: (e) =>
          controller.kyc.value.identityInformation?.number = double.tryParse(e),
      hint: LocaleKeys.identication_number.tr,
      label: LocaleKeys.id_number.tr,
      textColor: Colors.black,
      inputType: const InputFieldType.number(),
      hintColor: Colors.black,
      padding: EdgeInsets.symmetric(vertical: 5.h),
    );
  }

  stateOfDeliveryWidget() {
    return BiaTextField(
      borderColor: Colors.black,
      controller: controller.stateDeliveryController,
      onChanged: (e) =>
          controller.kyc.value.identityInformation?.stateofdelivery = e,
      hint: LocaleKeys.select_state_of_delivery.tr,
      label: LocaleKeys.state_of_delivery.tr,
      textColor: Colors.black,
      hintColor: Colors.black,
      padding: EdgeInsets.symmetric(vertical: 5.h),
    );
  }

  endOfDelieveryWidget({context}) {
    return GetBuilder<KycController>(builder: (_) {
      return BiaDatePicker(
          controller: controller.endDateController,
          title: LocaleKeys.end_of_validaty_date.tr);
    });
  }

  dateOfDelieveryWidget({context}) {
    return GetBuilder<KycController>(builder: (_) {
      return BiaDatePicker(
          controller: controller.deliveryDateController,
          title: LocaleKeys.date_of_delivery.tr);
    });
  }

  uploadProofWidget(context) {
    return Obx(() => Container(
      padding: EdgeInsets.all(2.h),
      child: DottedBorder(
            borderType: BorderType.RRect,
            strokeWidth: 1.8.h,
            radius: Radius.circular(10.h),
            color: Colors.white,
            child: InkWell(
              onTap: () {
                showModalBottomSheet(
                    context: context,
                    builder: (BuildContext bc) => ImagePickerBottomSheet(
                        ontap: (camera) => controller.getImage(camera, 1,"proof")));
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.r),
                child: Container(
                  height: 200.h,
                  padding: EdgeInsets.only(top: 40.h),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    image: controller.uploadProof.value == ""
                        ? null
                        : DecorationImage(
                            image: FileImage(File(controller.uploadProof.value)),
                            fit: BoxFit.cover,
                          ),
                  ),
                  child: controller.uploadProof.value != ""
                      ? SizedBox()
                      : Column(
                          children: [
                            const Icon(
                              Icons.cloud_upload_outlined,
                              color: Colors.white,
                              size: 50,
                            ),
                            BiaText(
                              LocaleKeys.select_file_to_upload.tr,
                              color: Colors.white,
                              fontSize: 18.h,
                            )
                          ],
                        ),
                ),
              ),
            ),
          ),
    ));
  }


  uploadAddressWidget(context) {
    return Obx(() => Container(
      padding: EdgeInsets.all(2.h),
      child: DottedBorder(
        borderType: BorderType.RRect,
        strokeWidth: 1.8.h,
        radius: Radius.circular(10.h),
        color: Colors.white,
        child: InkWell(
          onTap: () {
            showModalBottomSheet(
                context: context,
                builder: (BuildContext bc) => ImagePickerBottomSheet(
                    ontap: (camera) => controller.getImage(camera, 1,"address")));
          },
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8.r),
            child: Container(
              height: 200.h,
              padding: EdgeInsets.only(top: 40.h),
              width: double.infinity,
              decoration: BoxDecoration(
                image: controller.addressProof.value == "" ? null
                    : DecorationImage(
                  image: FileImage(File(controller.addressProof.value)),
                  fit: BoxFit.cover,
                ),
              ),
              child: controller.addressProof.value != ""
                  ? SizedBox()
                  : Column(
                children: [
                  const Icon(
                    Icons.cloud_upload_outlined,
                    color: Colors.white,
                    size: 50,
                  ),
                  BiaText(
                    LocaleKeys.select_file_to_upload.tr,
                    color: Colors.white,
                    fontSize: 18.h,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    ));
  }
}
