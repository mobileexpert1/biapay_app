import 'package:biapay_app/app/widgets/common/bia_appbar.dart';
import 'package:biapay_app/app/widgets/common/bia_button.dart';
import 'package:biapay_app/app/widgets/common/bia_scaffold.dart';
import 'package:biapay_app/app/widgets/common/bia_text.dart';
import 'package:biapay_app/app/widgets/common/bia_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../export_file.dart';

class Contact extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final List<String> name = ['Name 1', 'Name 2', 'Name 3'];
    final List<String> subject = ['Subject 1', 'Subject 2', 'Subject 3'];
    final List<String> email = ['Email 1', 'Email 2', 'Email 3'];

    return BiaScaffold(
      resizeToAvoidBottomInset: false,
      appBar: BiaAppBar.simple(LocaleKeys.contact_us.tr),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // Image.asset(
            //   Assets.contact,
            //   width: 200.w,
            // ),
            Image(
              image: AssetImage("assets/images/contact.png"),
               width: Get.width,
              fit: BoxFit.contain,
            ),

            SizedBox(height: 10.h,),
            // BiaDropdown<String>(
            //     options: name,
            //     margin: EdgeInsets.only(left: 20.h, right: 20.h),
            //     // controller: useTextEditingController(text: 'Enter your name'),
            //     hint: 'Your name',
            //     displayName: (v) => v,
            //     onSelected: (item) {}),

            // BiaDropdown<String>(
            //     options: email,
            //     margin: EdgeInsets.only(left: 20.h, right: 20.h),
            //     controller:
            //         useTextEditingController(text: 'Enter your Email address'),
            //     hint: 'Email',
            //     displayName: (v) => v,
            //     onSelected: (item) {}),
            // BiaDropdown<String>(
            //     options: subject,
            //     margin: EdgeInsets.only(left: 20.h, right: 20.h),
            //     controller: useTextEditingController(text: 'Enter subject'),
            //     hint: 'Subject',
            //     displayName: (v) => v,
            //     onSelected: (item) {}),
            BiaTextField(
              maxLines: 6,
              controller: TextEditingController(),
              hint: LocaleKeys.message_txt.tr,
// label: "username".tr

            ),

            SizedBox(height: 20.h),
            BiaButton(
              text: 'Send',
              onPressed: () {

              },
              color: Colors.lightGreen,
              textType: TextType.headLine4,
              width: Get.width,
              textColor: Colors.white,
            )
          ],
        ),
      ),
    );
  }
}
