/*import 'package:biapay_app/app/routes/app_pages.dart';
import 'package:biapay_app/app/widgets/common/bia_appbar.dart';
import 'package:biapay_app/app/widgets/common/bia_button.dart';
import 'package:biapay_app/app/widgets/common/bia_scaffold.dart';
import 'package:biapay_app/generated/locales.g.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../widgets/export_file.dart';
import '../controllers/choose_language_controller.dart';

class ChooseLanguageView extends GetView<ChooseLanguageController> {
  @override
  Widget build(BuildContext context) {
    return BiaScaffold(
      drawer: null,
      appBar: BiaAppBar(
        centerTitle: false,
        showAction: false,
        showIcon: true,
      ),
      body: Column(
        children: [showAddButton()],
      ),
    );
  }

  List mlist = ["1", "2", "3", "4", "5", "6"];


  void showNow() {
    showGeneralDialog(

      context: Get.context!,
      pageBuilder: (BuildContext buildContext, Animation<double> animation,
          Animation<double> secondaryAnimation) {
        return Dialog(

          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListView.builder(
                  shrinkWrap: true,
                  itemCount: 2,
                  itemBuilder: (context, index) {
                    return Text("tested");
                  })
              //your content
            ],
          ),
        );
      },
      barrierDismissible: true,
      barrierLabel: MaterialLocalizations.of(Get.context!).modalBarrierDismissLabel,
      barrierColor: Colors.transparent,
      transitionDuration: const Duration(milliseconds: 200),
    );
  }

  showAddButton() {
    return InkWell(
      onTap: () {
        print("i clicked");
        showNow();
        *//* showDialog(
            context: Get.context!,
            builder: (context) {
              return showAlertDialog();
            });*//*
      },
      child: Container(
          margin: EdgeInsets.only(top: 20.h),
          padding: EdgeInsets.all(15.0),
          color: Colors.white,
          child: Text("Press Me")),
    );
  }

  showAlertDialog() {
    return AlertDialog(
        scrollable: true,
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
              width: double.maxFinite,
              height: 300,
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: 14,
                  itemBuilder: (context, index) {
                    return Text("tested");
                  }),
            )
            //your content
          ],
        ));
  }
}*/

import 'package:biapay_app/app/routes/app_pages.dart';
import 'package:biapay_app/app/widgets/common/bia_appbar.dart';
import 'package:biapay_app/app/widgets/common/bia_button.dart';
import 'package:biapay_app/app/widgets/common/bia_scaffold.dart';
import 'package:biapay_app/generated/locales.g.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../widgets/export_file.dart';
import '../controllers/choose_language_controller.dart';

class ChooseLanguageView extends GetView<ChooseLanguageController> {
  @override
  Widget build(BuildContext context) {
    return BiaScaffold(
       drawer:  null,
       appBar:  BiaAppBar(centerTitle: false,
        showAction: false,
        showIcon: true,),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 35,
            ),
            Text(
              LocaleKeys.intro_home_screen_title.tr,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Text(
                LocaleKeys.intro_home_screen_field_language.tr,
                style: const TextStyle(
                    color: Colors.white, fontSize: 14, fontFamily: "Arial"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: InkWell(
                onTap: controller.showLanguages,
                child: Container(
                  height: 50,
                  width: double.infinity,
                  padding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                  decoration:
                      BoxDecoration(border: Border.all(color: Colors.white)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Obx(
                        () => Row(
                          children: [
                            if (controller.selectedLanguage['name'] != null)
                              controller.getImageFromBase64String(
                                  controller.selectedLanguage['base64Flag']),
                            Text(
                              controller.currentLocale.value.name,
                              style: const TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Icon(
                        Icons.expand_more,
                        color: Colors.white,
                      )
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Text(
                LocaleKeys.intro_home_screen_field_country.tr,
                style: const TextStyle(
                    color: Colors.white, fontSize: 14, fontFamily: "Arial"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: InkWell(
                onTap: controller.showCountries,
                child: Container(
                  height: 50,
                  width: double.infinity,
                  padding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                  decoration:
                      BoxDecoration(border: Border.all(color: Colors.white)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      if (controller.selectedCountry?.value.name != null)
                        Obx(
                          () => Row(
                            children: [
                              controller.getImageFromBase64String(
                                  controller.selectedCountry!.value.flag),
                              Text(
                                controller.selectedCountry!.value.name,
                                style: const TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        )
                      else
                        Text(
                          'select_country'.tr,
                          style: const TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      const Icon(
                        Icons.expand_more,
                        color: Colors.white,
                      )
                    ],
                  ),
                ),
              ),
            ),
            // BiaButton(text: "Direct", onPressed: ()=>)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 40.0),
              child: BiaButton(
                onPressed: () {
                  Get.toNamed(Routes.LANDING);
                  // Get.toNamed(Routes.BASE_APP);
                  // Get.toNamed(Routes.TONTINE);
                  // Get.to(() => ShopManager2());
                },
                text: LocaleKeys.next.tr,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
