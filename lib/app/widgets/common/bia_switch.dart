import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'bia_text.dart';

class BiaSwitch extends StatefulWidget {
  final bool initValue;
  final String title;
  final EdgeInsets? padding;
  final Function(bool) onChanged;
  BiaSwitch({
    Key? key,
    required this.initValue,
    required this.title,
    this.padding,
    required this.onChanged,
  }) : super(key: key);

  @override
  _BiaSwitchState createState() => _BiaSwitchState();
}

class _BiaSwitchState extends State<BiaSwitch> {
  late bool value;

  @override
  void initState() {
    value = widget.initValue;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        // padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
        padding: widget.padding ?? EdgeInsets.symmetric(horizontal: 10.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            BiaText(
              widget.title,
              textType: TextType.headLine6,
              color: Colors.white,
            ),
            Switch(
              value: value,
              onChanged: (value) {
                setState(() {
                  this.value = value;
                });
                widget.onChanged(value);
              },
              activeTrackColor: Colors.lightGreenAccent,
              activeColor: Colors.white,
            ),
          ],
        ));
  }
}
