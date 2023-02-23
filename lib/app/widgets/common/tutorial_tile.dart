import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'bia_text.dart';

class TutorialTile extends StatelessWidget {
  final String imageUrl;
  final String text;
  final int minutes;
  final int seconds;
  const TutorialTile(
      {Key? key,
      required this.imageUrl,
      required this.text,
      required this.minutes,
      required this.seconds})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            alignment: Alignment.bottomRight,
            children: [
              Container(
                height: 200.h,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    image: DecorationImage(
                        image: NetworkImage(imageUrl), fit: BoxFit.cover)),
              ),
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(bottom: 20.h, right: 20.w),
                width: 50.w,
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(10)),
                child: BiaText(
                  "$minutes:$seconds",
                  color: Colors.white,
                  padding: EdgeInsets.all(5.w),
                ),
              ),
            ],
          ),
          BiaText(
            text,
            color: Colors.blue[900],
            maxLine: 2,
            fontWeight: FontWeight.w600,
            padding: EdgeInsets.all(15.w),
          )
        ],
      ),
    );
  }
}
