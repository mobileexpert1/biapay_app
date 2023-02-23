import 'package:biapay_app/app/modules/kyc/components/identity_information.dart';
import 'package:biapay_app/app/modules/kyc/components/location_info.dart';
import 'package:biapay_app/app/modules/kyc/components/personnals_infos.dart';
import 'package:biapay_app/app/widgets/biapay_ui_package.dart';
import 'package:biapay_app/generated/locales.g.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/kyc_controller.dart';

class KycView extends GetView<KycController> {
  @override
  Widget build(BuildContext context) {
    final controller = Get.find<KycController>();
    return BiaScaffold(
      appBar:  BiaAppBar.simple(LocaleKeys.kyc_form.tr),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: 15),
        child: Form(
          key: controller.formKey,
          child: Column(
            children: [
              PersonnalInfosKyc(),
              SizedBox(
                height: 15,
              ),
            //  LocationInfos(),
              SizedBox(
                height: 15,
              ),

              Divider(thickness: 0.9.w,color: Colors.white,),

              IdentityInformationView(),
              // if (isMerchant) ...[
              //   BusinnessInfos(),
              // ],
              BiaButton.greenButtonInRow(
                width: Get.width,
                  text: LocaleKeys.save_submit.tr,
                  onPressed: controller.validateAllFields),

              SizedBox(
                height: 15,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
