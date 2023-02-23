import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'bia_text.dart';

class BiaCheckBox extends StatefulWidget {
  final bool initValue;
  final String title;
  final EdgeInsets? padding;
  final Function(bool value) onChanged;
  BiaCheckBox({
    Key? key,
    required this.initValue,
    required this.title,
    this.padding,
    required this.onChanged,
  }) : super(key: key);

  @override
  _BiaCheckBoxState createState() => _BiaCheckBoxState();
}

class _BiaCheckBoxState extends State<BiaCheckBox> {
  late bool value;

  @override
  void initState() {
    value = widget.initValue;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
        data: Theme.of(context).copyWith(
          unselectedWidgetColor: Colors.white,
        ),
        child: Padding(
          // padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
          padding: widget.padding ??
              EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
          child: Row(
            children: [
              Container(
                height: Checkbox.width * 1.5,
                width: Checkbox.width * 1.5,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.white,
                ),
                child: Checkbox(
                  value: value,
                  checkColor: Colors.green[400],
                  activeColor: Colors.transparent,
                  onChanged: (value) {
                    setState(() {
                      this.value = value!;
                    });

                    widget.onChanged.call(value!);
                  },
                ),
              ),
              SizedBox(width: 10.w),
              BiaText(
                widget.title,
                textType: TextType.headLine6,
                color: Colors.white,
              ),
            ],
          ),
        ));
  }
}
