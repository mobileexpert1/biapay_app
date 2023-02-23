import 'package:biapay_app/app/widgets/common/bia_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomMenuItem extends StatelessWidget {
  final String title;
  final String subTitle;
  final IconData icon;
  final VoidCallback onTap;
  const CustomMenuItem(
      {Key? key,
      required this.title,
      required this.subTitle,
      required this.icon,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
        child: Row(
          children: [
            Icon(
              icon,
              color: Colors.white,
              size: ScreenUtil().setSp(25),
            ),
            SizedBox(
              width: 20.w,
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BiaText(
                  title,
                  textType: TextType.headLine6,
                  color: Colors.white,
                ),
                SizedBox(
                  height: 5.h,
                ),
                BiaText(
                  subTitle,
                  textType: TextType.body2,
                  color: Colors.grey,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
