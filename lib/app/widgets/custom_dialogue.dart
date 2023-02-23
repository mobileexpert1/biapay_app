import 'package:biapay_app/app/widgets/common/bia_button.dart';
import 'package:biapay_app/app/widgets/common/bia_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomDialogue extends StatelessWidget {
  final String title;
  final String details;
  final bool isError;
  final String buttonText;
  final VoidCallback? onTap;
  const CustomDialogue(
      {Key? key,
      required this.title,
      required this.details,
      this.isError = false,
      this.buttonText = 'Close',
      this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: const EdgeInsets.only(top: 20),
      title: BiaText(
        title,
        textType: TextType.headLine5,
        color:
            isError ? Colors.redAccent : Theme.of(context).colorScheme.primary,
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          BiaText(
            details,
            padding: EdgeInsets.all(20.w),
            color: Theme.of(context).colorScheme.primary,
          ),
          BiaButton(
              color: Theme.of(context).colorScheme.primary,
              textColor: Colors.white,
              textType: TextType.body1,
              padding: EdgeInsets.zero,
              text: buttonText,
              onPressed: onTap ??
                  () {
                    Navigator.pop(context);
                  })
        ],
      ),
    );
  }
}
