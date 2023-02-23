import 'package:biapay_app/app/configs/configs.dart';
import 'package:biapay_app/app/widgets/biapay_ui_package.dart';
import 'package:flutter/material.dart';

class CustomRadio<T> extends StatelessWidget {
  const CustomRadio({
    Key? key,
    required this.value,
    required this.groupValue,
    required this.onChanged,
    this.title,
    this.minWidth,
    this.style,
    this.enabledColor,
    this.disabledColor,
  }) : super(key: key);
  final T value;
  final T groupValue;
  final void Function(T value) onChanged;
  final String? title;
  final double? minWidth;
  final TextStyle? style;
  final Color? enabledColor;
  final Color? disabledColor;

  @override
  Widget build(BuildContext context) {
    final selected = value == groupValue;
    double size = selected ? 15 : .1;
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          onChanged.call(value);
        },
        borderRadius: BorderRadius.circular(8),
        child: SizedBox(
          height: 50,
          child: Row(
            children: [
              AnimatedContainer(
                width: 20,
                height: 20,
                duration: Duration(milliseconds: 300),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: selected
                        ? enabledColor ?? Config.colors.redColor
                        : disabledColor ?? Config.colors.greyColor,
                    width: 1.5,
                  ),
                ),
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 300),
                  width: size,
                  height: size,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: enabledColor ?? Config.colors.redColor,
                  ),
                ),
              ),
              if (title != null) ...[
                SizedBox(
                  width: minWidth ?? 15,
                ),
                Expanded(
                  child: BiaText(
                    title,
                    fontSize: 25.sp,
                    color: disabledColor ?? Config.colors.greyColor2,
                  ),
                )
              ]
            ],
          ),
        ),
      ),
    );
  }
}
