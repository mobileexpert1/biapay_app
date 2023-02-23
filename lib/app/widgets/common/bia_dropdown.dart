import 'package:biapay_app/app/widgets/common/bia_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BiaDropdown<T> extends StatefulWidget {
  final List<dynamic> options;
  final dynamic Function(dynamic data) displayName;
  final void Function(dynamic value) onSelected;
  final String hint;
  final TextEditingController? controller;
  final EdgeInsets? margin;
  final bool outerLabel;
  final bool showBorder;
  const BiaDropdown(
      {Key? key,
        required this.options,
        required this.controller,
        required this.hint,
        required this.displayName,
        this.margin,
        required this.onSelected,
        this.outerLabel = true,
        this.showBorder = false})
      : super(key: key);

  @override
  _BiaDropdownState<T> createState() => _BiaDropdownState<T>();
}

class _BiaDropdownState<T> extends State<BiaDropdown<T?>> {
  @override
  Widget build(BuildContext context) {
    final _defualtBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(5),
      borderSide: BorderSide(color: Colors.white),
    );
    return Padding(
      padding: widget.margin ?? EdgeInsets.symmetric(horizontal: 10.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (widget.outerLabel)
            BiaText(
              widget.hint,
              color: Colors.white,
              textType: TextType.headLine6,
              fontWeight: FontWeight.w300,
              padding: EdgeInsets.only(bottom: 5.h),
            ),
          Container(
            // padding: EdgeInsets.symmetric(horizontal: 10.w),
            decoration: BoxDecoration(
                border:
                widget.showBorder ? Border.all(color: Colors.grey) : null,
                borderRadius: BorderRadius.circular(5)),
            child: DropdownButtonFormField(
              decoration: InputDecoration(
                border: _defualtBorder,
                enabledBorder: _defualtBorder,
                focusedBorder: _defualtBorder,
                filled: true,
                fillColor: Colors.white,
                isDense: true,
                contentPadding:
                EdgeInsets.symmetric(horizontal: 10.w, vertical: 18.h),
              ),
              isExpanded: true,
              hint: BiaText(
                widget.controller!.text.isEmpty
                    ? widget.outerLabel
                    ? 'Select'
                    : widget.hint
                    : widget.controller!.text,
                textType: TextType.headLine6,
                maxLine: 1,
                // color: Colors.blue[900],
              ),
              style: Theme.of(context).primaryTextTheme.caption,
              validator: (data) =>
              data == null ? "Please select from dropdown" : null,
              // underline: const SizedBox.shrink(),
              icon: Icon(
                Icons.arrow_drop_down,
                color: Colors.blue[900],
              ),
              items: widget.options.map((dynamic value) {
                return DropdownMenuItem(
                  value: value,
                  child: BiaText(widget.displayName(value).toString(),
                      textType: TextType.headLine6, maxLine: 2),

                  // child: Row(
                  //   children: <Widget>[
                  //     BiaText(widget.displayName(value).toString(),
                  //         textType: TextType.headLine6, maxLine: 2),
                  //   ],
                  // ),
                );
              }).toList(),

              onChanged: (value) {
                setState(() {
                  widget.controller!.text =
                      widget.displayName(value).toString();
                  widget.onSelected(value);
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
