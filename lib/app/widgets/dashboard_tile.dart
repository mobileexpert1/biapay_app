import 'package:biapay_app/app/configs/configs.dart';
import 'package:biapay_app/app/widgets/common/bia_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DashboardTile extends StatelessWidget {
  final String title;
  final String image;
  final VoidCallback? ontap;
  const DashboardTile(
      {Key? key, required this.title, required this.image, this.ontap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 70.w,
            width: 70.w,
            padding: EdgeInsets.all(10.w),
            margin: EdgeInsets.only(bottom: 5.h),
            decoration: BoxDecoration(
              // color: Theme.of(context).colorScheme.primary,
              color: Config.colors.primaryColor,
              shape: BoxShape.circle,
            ),
            alignment: Alignment.center,
            child: SvgPicture.asset(
              image,
            ),
          ),
          BiaText(
            title,
            align: TextAlign.center,
            // textType: TextType.headLine6,
          )
        ],
      ),
    );
  }
}
