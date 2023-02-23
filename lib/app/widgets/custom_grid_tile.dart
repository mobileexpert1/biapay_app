import 'package:biapay_app/app/widgets/common/bia_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomGridTile extends StatelessWidget {
  final String title;
  final String image;
  final VoidCallback? ontap;
  const CustomGridTile(
      {Key? key, required this.title, required this.image, this.ontap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.all(20.w),
              margin: EdgeInsets.only(bottom: 5.h),
              decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary,
                  borderRadius: BorderRadius.circular(20)),
              child: Image.asset(
                image,
              ),
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
