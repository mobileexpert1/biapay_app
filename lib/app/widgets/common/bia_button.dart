import 'package:biapay_app/app/configs/configs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'bia_text.dart';

class BiaButton extends StatelessWidget {
  final String text;
  final void Function() onPressed;
  final Color? color;
  final EdgeInsets? margin;
  final Color? textColor;
  final double width;
  final TextType textType;
  final EdgeInsets? padding;
  final double borderRadius;
  final double? height;
  final Widget? customWidget;
  final bool showRightArrow;
  final double? elevation;
  final String? assetIcon;
  const BiaButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.color,
    this.width = double.infinity,
    this.textColor,
    this.margin,
    this.borderRadius = 50,
    this.textType = TextType.headLine5,
    this.padding,
    this.showRightArrow = false,
    this.height,
    this.customWidget,
    this.elevation,
    this.assetIcon,
  }) : super(key: key);

  factory BiaButton.greenButtonInRow(
      {required String text, required VoidCallback onPressed, double? width,EdgeInsets? margin}) {
    return BiaButton(
      text: text,
      onPressed: onPressed,
      margin: margin??EdgeInsets.zero,
      color: Colors.lightGreen[400],
      width: width ?? 200.w,
      textColor: Colors.white,
    );
  }

  factory BiaButton.customWidget(
      {required Widget child, required VoidCallback onPressed,EdgeInsets? margin}) {
    return BiaButton(
      text: '',
      onPressed: onPressed,
      color: Colors.lightGreen[400],
      customWidget: child,
      margin: margin??EdgeInsets.zero,
    );
  }

  factory BiaButton.withRightArrow({
    required String text,
    required VoidCallback onPressed,
    double? height,
    double? radius,
    String? assetIcon,
  }) {
    return BiaButton(
      text: text,
      margin: EdgeInsets.zero,
      onPressed: onPressed,
      showRightArrow: true,
      textColor: Colors.blue[900],
      borderRadius: radius ?? 10,
      height: height,
      assetIcon: assetIcon,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: margin ?? EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
      child: MaterialButton(
        elevation: elevation,
        padding: padding ?? EdgeInsets.all(15.w),
        color: color ?? Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: showRightArrow
              ? MainAxisAlignment.spaceBetween
              : MainAxisAlignment.center,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (assetIcon != null)
                  Container(
                    height: 40,
                    width: 40,
                    margin: EdgeInsets.only(right: 15),
                    decoration: BoxDecoration(
                      color: Config.colors.whiteColor,
                      shape: BoxShape.circle,
                    ),
                    alignment: Alignment.center,
                    child: Image.asset(
                      assetIcon!,
                      width: 20,
                      height: 20,
                    ),
                  ),
                if (customWidget != null)
                  customWidget!
                else
                  BiaText(text,
                      color: textColor ?? Theme.of(context).colorScheme.primary,
                      maxLine: 1,
                      fontWeight: FontWeight.w600,
                      textType: textType),
              ],
            ),
            if (showRightArrow)
              Icon(
                Icons.chevron_right_outlined,
                color: textColor,
                size: 30.sp,
              )
          ],
        ),
      ),
    );
  }
}
