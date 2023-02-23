// import 'package:biapay_app/presentation/common/biapay_ui_package.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:biapay_app/resources/assets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../configs/assets.dart';
import '../../../../widgets/common/bia_appbar.dart';
import '../../../../widgets/common/bia_button.dart';
import '../../../../widgets/common/bia_scaffold.dart';
import '../../../../widgets/common/bia_text.dart';

class ElectronicTicker extends StatelessWidget {
  const ElectronicTicker({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BiaScaffold(
        appBar: BiaAppBar.simple('Electronic ticket'),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(),
            Container(
              //height: 200.h,
              width: double.infinity,
              padding: EdgeInsets.all(20.h),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(10)),
              child: Column(
                children: [
                  Image.asset(
                    Assets.congratulation,
                    height: 150,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  BiaText(
                    'Stay tuned',
                    textType: TextType.headLine4,
                    color: Colors.blue[800],
                  )
                ],
              ),
            ),
            BiaButton(
              text: 'Back',
              onPressed: () {},
              color: Colors.lightGreen,
              textColor: Colors.white,
            )
          ],
        ));
  }
}
