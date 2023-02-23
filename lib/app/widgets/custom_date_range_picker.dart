import 'package:biapay_app/app/widgets/common/bia_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class CustomDateRangePicker extends StatelessWidget {
  final Function(DateTimeRange) onDateChanged;
  const CustomDateRangePicker({Key? key, required this.onDateChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 350.h,
            width: 450.w,
            child: SfDateRangePicker(
              onSelectionChanged: (DateRangePickerSelectionChangedArgs args) {
                final DateTime endDate = args.value.endDate != null
                    ? (args.value.endDate as DateTime?)!
                    : DateTime.now();
                onDateChanged(DateTimeRange(
                    start: args.value.startDate as DateTime, end: endDate));
              },
              selectionMode: DateRangePickerSelectionMode.range,
            ),
          ),
          BiaButton(
              color: Theme.of(context).colorScheme.secondary,
              text: 'OK',
              onPressed: () {
                Get.back();
              })
        ],
      ),
    );
  }
}
