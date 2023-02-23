import 'package:biapay_app/app/configs/configs.dart';
import 'package:biapay_app/app/widgets/common/bia_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BiaNotificationTile extends StatelessWidget {
  final String image;
  final String title;
  final String details;
  final int count;
  const BiaNotificationTile(
      {Key? key,
      required this.image,
      required this.title,
      required this.details,
      this.count = 0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(10.w),
            child: Row(
              children: [
                Container(
                  height: 70.h,
                  width: 70.w,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: NetworkImage(image), fit: BoxFit.cover)),
                ),
                SizedBox(
                  width: 20.w,
                ),
                Expanded(
                  // width: 200,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      BiaText(
                        title,
                        textType: TextType.headLine6,
                        fontWeight: FontWeight.bold,
                        color: Config.colors.blueColor,
                      ),
                      BiaText(
                        details,
                        fontSize: 14.sp,
                        color: Config.colors.blueColor,
                      )
                    ],
                  ),
                ),
                SizedBox(
                  width: 10.w,
                ),
                SizedBox(
                  width: 20.w,
                  height: 70.h,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Icon(
                        Icons.arrow_forward_ios,
                        size: 18,
                      ),
                      count != 0
                          ? Container(
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Config.colors.redColor),
                              alignment: Alignment.center,
                              child: BiaText(count.toString(),
                                  padding: EdgeInsets.all(4),
                                  color: Colors.white,
                                  textType: TextType.body2),
                            )
                          : SizedBox.shrink(),
                    ],
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: const Divider(
              color: Colors.grey,
              height: 1,
              thickness: .5,
            ),
          )
        ],
      ),
    );
  }
}
