import 'package:biapay_app/app/modules/tontine/views/tontine_detail_view.dart';
import 'package:biapay_app/app/widgets/biapay_ui_package.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/tontine_controller.dart';

class TontineView extends GetView<TontineController> {
  @override
  Widget build(BuildContext context) {
    return BiaScaffold(
      appBar: BiaAppBar.simple('Tontine'),
      body: Container(
        padding: EdgeInsets.only(top: 20.h),
        child: Column(
          children: <Widget>[
            SizedBox(
              width: double.infinity,
              height: 80.h,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  BiaText(
                    'My tontine',
                    fontSize: 24.h,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                  TextButton(
                      onPressed: () {},
                      child: Row(
                        children: <Widget>[
                          Icon(
                            Icons.add_circle_outline,
                            color: Colors.white,
                            size: 35.h,
                          ),
                          BiaText(
                            'Add a new toontine',
                            fontSize: 20.h,
                            color: Colors.white,
                          )
                        ],
                      )),
                ],
              ),
            ),
            BiaButton.withRightArrow(
                text: 'Tontine 1',
                onPressed: () {
                  Get.to(() => const TontineDetailView());
                }),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10.h),
              child: BiaButton.withRightArrow(
                  text: 'Tontine 2',
                  onPressed: () {
                    Get.to(() => const TontineDetailView());
                  }),
            ),
            BiaButton.withRightArrow(
                text: 'Tontine 3',
                onPressed: () {
                  Get.to(() => const TontineDetailView());
                }),
          ],
        ),
      ),
    );
  }
}
