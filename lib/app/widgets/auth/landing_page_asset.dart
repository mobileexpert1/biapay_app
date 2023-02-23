import 'package:biapay_app/app/widgets/auth/wave_clipper.dart';
import 'package:biapay_app/app/widgets/common/bia_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LandingPageAsset extends StatelessWidget {
  final String biapayLogo;
  final String imageFile;
  final String text;
   LandingPageAsset(
      {Key? key,
      required this.biapayLogo,
      required this.imageFile,
      required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        ClipPath(
          clipper: WaveClipper(),
          child: Container(
            height: 400,
            width: double.infinity,
            color: Colors.white,
            alignment: Alignment.topCenter,
            child: Padding(
                padding: EdgeInsets.all(30.w),
                child: Column(
                  children: [
                    BiaText(
                      text,
                      textType: TextType.headLine5,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    Container(
                        margin: EdgeInsets.symmetric(vertical: 20.h),
                        width: 250.h,
                        child: Image.asset(biapayLogo)),
                  ],
                )),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 200.h),
          child: Image.asset(
            imageFile,
            width: 350.w,
          ),
        ),
      ],
    );
  }
}
