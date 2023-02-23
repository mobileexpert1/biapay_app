import 'package:biapay_app/app/configs/configs.dart';
import 'package:biapay_app/app/widgets/biapay_ui_package.dart';
import 'package:flutter/material.dart';

class MemberComponent extends StatelessWidget {
  const MemberComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15)
            .copyWith(right: 5),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text.rich(TextSpan(children: [
                    TextSpan(
                        text: "Jores Tala",
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          color: Config.colors.blueColor,
                        )),
                    TextSpan(
                        text: "  (Manager)",
                        style: TextStyle(
                          fontWeight: FontWeight.normal,
                          color: Config.colors.blueColor,
                          fontSize: 18.sp,
                        )),
                  ])),
                  SizedBox(
                    height: 10,
                  ),
                  Text.rich(TextSpan(children: [
                    TextSpan(
                        text: "Active",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Config.colors.blueColor,
                        )),
                    TextSpan(
                        text: "    20-07-2022",
                        style: TextStyle(
                          fontWeight: FontWeight.normal,
                          color: Config.colors.blueColor,
                          fontSize: 15.sp,
                        )),
                  ]))
                ],
              ),
            ),
            Icon(
              Icons.keyboard_arrow_right_outlined,
            )
          ],
        ),
      ),
    );
  }
}
