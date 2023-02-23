import 'dart:convert';
import 'package:biapay_app/app/widgets/common/bia_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_echarts/flutter_echarts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChartWidget extends StatelessWidget {
  final String title;
  final String label;
  final List<Widget> topRightWidgets;
  final Map<String, dynamic> chartData;
  const ChartWidget(
      {Key? key,
      required this.title,
      required this.topRightWidgets,
      required this.chartData,
      required this.label})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BiaText(
          label,
          textType: TextType.headLine5,
          color: Colors.white,
          padding: EdgeInsets.symmetric(vertical: 10.h),
        ),
        Container(
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(10)),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: topRightWidgets,
              ),
              SizedBox(
                height: 250.h,
                child: Echarts(option: jsonEncode(chartData)),
              ),
              BiaText(title)
            ],
          ),
        ),
      ],
    );
  }
}
