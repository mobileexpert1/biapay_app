import 'package:biapay_app/app/configs/const.dart';
import 'package:biapay_app/app/widgets/common/bia_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomDropDown extends StatelessWidget {
  final List<String> options;
  final String? value;
  final String title;
  final Function(String?) onTap;
  const CustomDropDown(
      {Key? key,
      required this.options,
      required this.value,
      required this.onTap,
      required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          BiaText(
            '$title:',
            textType: TextType.headLine5,
          ),
          Container(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              decoration: BoxDecoration(
                  border: Border.all(color: AppColors.colorBlueDark),
                  borderRadius: BorderRadius.circular(5)),
              child: DropdownButton<String>(
                hint: BiaText(
                  value ?? 'Select $title',
                  textType: TextType.headLine5,
                ),
                style: Theme.of(context).primaryTextTheme.caption,
                underline: const SizedBox.shrink(),
                icon: const Icon(Icons.arrow_drop_down,
                    color: AppColors.colorBlueDark),
                items: options.map((String value) {
                  return DropdownMenuItem(
                    value: value,
                    child: Row(
                      children: <Widget>[
                        BiaText(
                          value,
                          textType: TextType.headLine5,
                        ),
                        Icon(
                          Icons.arrow_drop_down,
                          size: 25.h,
                          color: AppColors.colorBlack,
                        )
                      ],
                    ),
                  );
                }).toList(),
                onChanged: onTap,
              )),
        ],
      ),
    );
  }
}
