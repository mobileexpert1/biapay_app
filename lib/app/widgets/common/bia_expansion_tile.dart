import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'bia_text.dart';

class BiaExpansionTile extends StatefulWidget {
  final String title;
  final String details;
  BiaExpansionTile({Key? key, required this.title, required this.details})
      : super(key: key);

  @override
  _BiaExpansionTileState createState() => _BiaExpansionTileState();
}

class _BiaExpansionTileState extends State<BiaExpansionTile> {
  bool isOpen = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 15.h),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: ExpansionTile(
          initiallyExpanded: isOpen,
          title: BiaText(
            widget.title,
            fontWeight: FontWeight.w600,
            textType: TextType.headLine5,
            color: Colors.blue[800],
          ),
          trailing: RotatedBox(
            quarterTurns: isOpen ? 1 : 0,
            child: Icon(
              Icons.chevron_right,
              size: 40,
              color: Colors.blue[800],
            ),
          ),
          onExpansionChanged: (value) {
            setState(() {
              isOpen = value;
            });
          },
          children: [
            BiaText(
              widget.details,
              textType: TextType.headLine6,
              color: Colors.blue[800],
              padding: EdgeInsets.all(15.w),
              maxLine: 10,
            ),
          ]),
    );
  }
}
