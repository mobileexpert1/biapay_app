import 'package:biapay_app/app/widgets/biapay_ui_package.dart';
import 'package:biapay_app/app/widgets/common/bia_text.dart';
import 'package:flutter/material.dart';

class AuthOptionCard extends StatelessWidget {
  final String title;
  final String description;
  final Color? titleColor;
  final String image;
  final VoidCallback onTap;
  const AuthOptionCard(
      {Key? key,
      required this.title,
      required this.description,
      required this.image,
      required this.onTap,
      this.titleColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onTap,
      padding: EdgeInsets.all(20.w),
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        children: [
          Image.asset(
            image,
            height: 150.h,
          ),
          BiaText(
            title,
            textType: TextType.headLine4,
            padding: EdgeInsets.all(20.w),
            fontWeight: FontWeight.bold,
            color: titleColor ?? Colors.blue[900],
          ),
          BiaText(
            description,
            maxLine: 6,
            color: Colors.blue[900],
            align: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
