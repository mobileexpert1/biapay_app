import 'package:biapay_app/app/configs/configs.dart';
import 'package:biapay_app/app/widgets/common/bia_text.dart';
import 'package:flutter/material.dart';

class CustomTabBar extends StatelessWidget {
  const CustomTabBar({
    Key? key,
    required this.titles,
    required this.onChanged,
    required this.currentIndex,
    this.padding,
    this.textType,
  }) : super(key: key);
  final List<String> titles;
  final void Function(int value) onChanged;
  final int currentIndex;
  final EdgeInsetsGeometry? padding;
  final TextType? textType;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? EdgeInsets.zero,
      child: Row(
        children: titles.map((e) {
          int index = titles.indexOf(e);
          bool selected = index == currentIndex;
          return Expanded(
            child: Container(
              height: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color:
                    selected ? Config.colors.primaryColor : Colors.transparent,
              ),
              child: InkWell(
                onTap: () => onChanged.call(index),
                borderRadius: BorderRadius.circular(30),
                child: Center(
                  child: BiaText(
                    e,
                    color: Colors.white,
                    textType: textType ?? TextType.headLine5,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
