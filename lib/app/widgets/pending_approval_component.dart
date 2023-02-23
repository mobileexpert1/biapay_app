import 'package:biapay_app/app/configs/configs.dart';
import 'package:biapay_app/app/widgets/biapay_ui_package.dart';
import 'package:biapay_app/generated/locales.g.dart';
import 'package:flutter/material.dart';

class PendingApprovalComponent extends StatelessWidget {
  const PendingApprovalComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 25,
                  child: BiaText(
                    "J",
                    textType: TextType.headLine4,
                    fontSize: 30.sp,
                    color: Config.colors.blueColor,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(
                  width: 15,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      BiaText(
                        "John Doe",
                        textType: TextType.headLine5,
                        fontSize: 25.sp,
                        fontWeight: FontWeight.w400,
                        color: Config.colors.blueColor,
                      ),
                      SizedBox(
                        height: 3,
                      ),
                      BiaText(
                        "24-06-2021",
                        fontSize: 18.sp,
                        color: Config.colors.greyColor3,
                      ),
                      SizedBox(
                        height: 3,
                      ),
                      BiaText(
                        "Jackpot / jackpot approval",
                        fontSize: 18.sp,
                        color: Config.colors.greyColor3,
                      ),
                    ],
                  ),
                )
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: BiaButton(
                    text: LocaleKeys.approved,
                    onPressed: () {},
                    borderRadius: 5,
                    color: Config.colors.greenColor,
                    textColor: Colors.white,
                  ),
                ),
                Expanded(
                    child: BiaButton(
                  text: LocaleKeys.rejected,
                  onPressed: () {},
                  borderRadius: 5,
                  color: Config.colors.redColor,
                  textColor: Colors.white,
                )),
              ],
            )
          ],
        ),
      ),
    );
  }
}
