import 'package:biapay_app/app/widgets/common/bia_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileItem extends StatelessWidget {
  final String title;
  final String subTitle;
  final VoidCallback onTap;
  final bool canEdit;
  const ProfileItem(
      {Key? key,
      required this.title,
      required this.subTitle,
      required this.onTap,
      this.canEdit = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BiaText(
              subTitle,
              textType: TextType.body2,
              color: Colors.grey,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                BiaText(
                  title,
                  textType: TextType.headLine6,
                  padding: EdgeInsets.symmetric(vertical: 10.h),
                  color: Colors.black,
                ),
                if (canEdit)
                  BiaText(
                    'Edit',
                    textType: TextType.headLine6,
                    padding: EdgeInsets.symmetric(vertical: 10.h),
                    color: Colors.blue,
                  ),
              ],
            ),
            const Divider(
              height: 1,
              thickness: 1,
            )
          ],
        ),
      ),
    );
  }
}
