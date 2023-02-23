import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../export_file.dart';
import 'bia_text.dart';

class BiaDialogue extends StatelessWidget {
  final String title;
  final String details;
  final bool isError;
  final String buttonText;
  final VoidCallback? onTap;

  const BiaDialogue(
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
          Container(
            height: 200.h,
            width: Get.width,
            child: ListView.builder(
                itemCount: 3,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      customerItemTxtWidget(text: "djhdjsa"),
                      Divider(
                        thickness: 0.5,
                        color: Colors.black,
                      ),
                      index == 1
                          ? SizedBox()
                          : SizedBox(
                              height: 2,
                            )
                    ],
                  );
                }),
          )
        ],
      ),
    );
  }

  customerItemTxtWidget({String? text}) {
    return BiaText(
      text ?? "asdhgahdgas",
      align: TextAlign.start,
      fontSize: 23.sp,
      padding: EdgeInsets.only(left: 0.0),
      fontWeight: FontWeight.w400,
      color: Colors.black,
    );
  }
}
