import 'package:biapay_app/app/widgets/biapay_ui_package.dart';
import 'package:biapay_app/generated/locales.g.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/tutorials_controller.dart';

class TutorialsView extends GetView<TutorialsController> {
  @override
  Widget build(BuildContext context) {
    const String loremIpsum =
        '''Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce luctus nisl pretium nisi iaculis convallis. Suspendisse finibus risus ultricies ornare placerat. Donec nec nibh id felis aliquam pharetra id vitae eros. Vivamus ac ex et massa laoreet fringilla. Morbi sollicitudin lectus non rhoncus commodo. Donec leo risus, facilisis eu vestibulum vitae, condimentum sed quam. In lacus tortor, consectetur a risus ut, ma''';

    const String image =
        "https://media.istockphoto.com/photos/modern-home-office-interior-picture-id1257975650?b=1&k=6&m=1257975650&s=170667a&w=0&h=c9S9zVNl--Y36gzh-nPVyeh7ljqeRH6nRnKoX6-4N0E=";

    return BiaScaffold(
      appBar: BiaAppBar.simple(LocaleKeys.tutorials.tr),
      body: ListView.builder(
        padding: EdgeInsets.only(top: 15),
        itemCount: 15,
        itemBuilder: (context, index) => Container(
          margin: EdgeInsets.only(bottom: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (index == 0)
                BiaText(
                  LocaleKeys.all_tutorial.tr,
                  fontSize: 28.h,
                  color: Colors.white,
                ),
              const TutorialTile(
                imageUrl: image,
                text: loremIpsum,
                minutes: 2,
                seconds: 15,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
