import 'package:biapay_app/app/widgets/common/bia_appbar.dart';
import 'package:biapay_app/app/widgets/common/bia_button.dart';
import 'package:biapay_app/app/widgets/common/bia_expansion_tile.dart';
import 'package:biapay_app/app/widgets/common/bia_scaffold.dart';
import 'package:biapay_app/app/widgets/export_file.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';



class Policies extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BiaScaffold(
        appBar: BiaAppBar.simple(LocaleKeys.legal_info.tr),
        body: Container(
          padding: EdgeInsets.only(top: 20.h),
          child: Column(
            children: [
              BiaButton.withRightArrow(
                text: LocaleKeys.term_condition.tr,
                onPressed: (){
                Get.toNamed(Routes.WEB_VIEW,arguments:TERMS_CONDITIONS );
                },
              ),

              SizedBox(
                height: 10.h,
              ),
              BiaButton.withRightArrow(text: LocaleKeys.legal_notice.tr, onPressed: () {
                Get.toNamed(Routes.WEB_VIEW,arguments:LEGAL_POLICY );

              }),
              SizedBox(
                height: 10.h,
              ),
              BiaButton.withRightArrow(
                  text: LocaleKeys.privacy_policy.tr, onPressed: () {
                Get.toNamed(Routes.WEB_VIEW,arguments:PRIVACY_POLICY );

              }),
            ],
          ),
        ));
  }
}



