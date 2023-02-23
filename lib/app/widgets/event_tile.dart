import 'package:biapay_app/app/widgets/common/bia_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EventTile extends StatelessWidget {
  final String title;
  final String image;
  final DateTime dateTime;
  const EventTile(
      {Key? key,
      required this.title,
      required this.image,
      required this.dateTime})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 200.h,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(image), fit: BoxFit.cover)),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
            child: Row(
              children: [
                BiaText(
                  dateTime.toString().split(' ').first,
                  textType: TextType.headLine5,
                  fontWeight: FontWeight.w600,
                ),
                const SizedBox(
                  width: 40.2,
                ),
                BiaText(
                  title,
                  textType: TextType.headLine5,
                  fontWeight: FontWeight.w600,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
