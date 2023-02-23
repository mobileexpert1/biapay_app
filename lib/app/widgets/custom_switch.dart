import 'package:biapay_app/app/configs/configs.dart';
import 'package:flutter/material.dart';

class CustomSwitch extends StatelessWidget {
  const CustomSwitch({
    Key? key,
    required this.value,
    required this.onChanged,
    this.color,
    this.borderColor,
  }) : super(key: key);
  final bool value;
  final void Function(bool value) onChanged;
  final Color? color;
  final Color? borderColor;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onChanged.call(!this.value),
      child: SizedBox(
        height: 25,
        width: 49,
        child: Card(
          margin: EdgeInsets.zero,
          shape: StadiumBorder(
              side: BorderSide(
            color: color ?? Colors.black,
          )),
          child: Stack(
            children: [
              AnimatedContainer(
                duration: Duration(milliseconds: 200),
                decoration: BoxDecoration(
                  color: (color ?? Colors.white).withOpacity(value ? .3 : 0),
                  borderRadius: BorderRadius.circular(30),
                ),
                height: 25,
                width: value ? 40 : 0,
              ),
              AnimatedPositioned(
                duration: Duration(milliseconds: 200),
                top: 0,
                bottom: 0,
                left: value ? 22 : -2,
                child: Padding(
                  padding: const EdgeInsets.all(2),
                  child: AnimatedContainer(
                    duration: Duration(milliseconds: 150),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: color ?? Config.colors.blueColor,
                    ),
                    height: 25,
                    width: 25,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
