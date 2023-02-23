import 'package:biapay_app/app/modules/kyc/controllers/kyc_controller.dart';
import 'package:biapay_app/app/widgets/biapay_ui_package.dart';
import 'package:biapay_app/app/widgets/browse/custom_file/custom_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BusinnessInfos extends StatelessWidget {
  const BusinnessInfos({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<KycController>();
    return Container(
      padding: EdgeInsets.all(10.w),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BiaText(
            'Business Details',
            textType: TextType.headLine5,
            padding: EdgeInsets.symmetric(vertical: 10.h),
          ),
          CustomDropDown(
            title: 'Categories',
            onTap: (value) {},
            options: ["ONE"],
            value: "ONE",
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 200.w,
                child: Column(
                  children: [
                    BiaTextField(
                      borderColor: Colors.black,
                      controller: controller.namgeOfOrgController,
                      hint: 'Name Of Organization',
                      textColor: Colors.black,
                      hintColor: Colors.black,
                      padding: EdgeInsets.symmetric(vertical: 10.h),
                    ),
                    BiaDatePicker(
                      controller: controller.registeredDateController,
                      title: 'Registered Date',
                    ),
                    BiaTextField(
                      borderColor: Colors.black,
                      controller: controller.taxPayerNumberController,
                      hint: 'Taxpayer Number',
                      textColor: Colors.black,
                      hintColor: Colors.black,
                      padding: EdgeInsets.symmetric(vertical: 5.h),
                    ),
                    // if (provider.companyRegistrationProof != null)
                    //   InkWell(
                    //     onTap: () {
                    //       Navigator.of(context).push(MaterialPageRoute(
                    //           builder: (context) => PhotoViewerScreen(
                    //               image: provider.uploadProof)));
                    //     },
                    //     child: Image.file(provider.companyRegistrationProof!,
                    //         errorBuilder: (context, error, stackTrace) => BiaText(
                    //             'This is not a image file: ${provider.companyRegistrationProof!.path}')),
                    //   ),
                    BiaButton(
                        text: 'Company Registration Proof',
                        color: Colors.grey,
                        margin: EdgeInsets.symmetric(vertical: 10.h),
                        textType: TextType.body2,
                        textColor: Colors.white,
                        onPressed: () {
                          // showModalBottomSheet(
                          //     context: context,
                          //     builder: (BuildContext bc) =>
                          //         ImagePickerBottomSheet(
                          //             ontap: (camera) => controller.getImage(
                          //                 fileType: FileType.copmany,
                          //                 camera: camera)));
                        })
                  ],
                ),
              ),
              SizedBox(
                width: 200.w,
                child: Column(
                  children: [
                    BiaTextField(
                      borderColor: Colors.black,
                      controller: controller.websiteLinkController,
                      hint: 'website'.tr,
                      textColor: Colors.black,
                      hintColor: Colors.black,
                      padding: EdgeInsets.symmetric(vertical: 10.h),
                    ),
                    BiaTextField(
                      borderColor: Colors.black,
                      controller: controller.tradeRegisteredController,
                      hint: 'Trade Register Number',
                      textColor: Colors.black,
                      hintColor: Colors.black,
                      padding: EdgeInsets.symmetric(vertical: 5.h),
                    ),
                    // if (provider.taxAddressProof != null)
                    //   InkWell(
                    //     onTap: () {
                    //       Navigator.of(context).push(MaterialPageRoute(
                    //           builder: (context) => PhotoViewerScreen(
                    //               image: provider.taxAddressProof)));
                    //     },
                    //     child: Image.file(provider.taxAddressProof!,
                    //         errorBuilder: (context, error, stackTrace) => BiaText(
                    //             'This is not a image file: ${provider.taxAddressProof!.path}')),
                    //   ),
                    BiaButton(
                        text: 'Taxation Proof',
                        color: Colors.grey,
                        margin: EdgeInsets.symmetric(vertical: 10.h),
                        textType: TextType.body1,
                        textColor: Colors.white,
                        onPressed: () {
                          // showModalBottomSheet(
                          //     context: context,
                          //     builder: (BuildContext bc) =>
                          //         ImagePickerBottomSheet(
                          //             ontap: (camera) => controller.getImage(
                          //                 fileType: FileType.tax,
                          //                 camera: camera)));
                        })
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
