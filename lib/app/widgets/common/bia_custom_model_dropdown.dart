import 'package:biapay_app/app/widgets/common/bia_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../models/merchent_shop_model.dart';
import '../../models/security_question.dart';

class BiaShopDropdown<T> extends StatefulWidget {
  final List<MerchentShopDataModel>? options;
  final dynamic Function(MerchentShopDataModel data) displayName;
  final void Function(MerchentShopDataModel value) onSelected;
  final void Function() ?onTab;
  final String hint;
  final TextEditingController? controller;
  final EdgeInsets? margin;
  final bool outerLabel;
  final bool showBorder;
  const BiaShopDropdown(
      {Key? key,
        required this.options,
        required this.controller,
        required this.hint,
        required this.displayName,
        this.margin,
        this.onTab,
        required this.onSelected,
        this.outerLabel = true,
        this.showBorder = false})
      : super(key: key);

  @override
  _BiaDropdownState<T> createState() => _BiaDropdownState<T>();
}

class _BiaDropdownState<T> extends State<BiaShopDropdown<T?>> {
  @override
  Widget build(BuildContext context) {
    final _defualtBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(5),
      borderSide: BorderSide(color: Colors.white),
    );
    return Padding(
      padding: widget.margin ?? EdgeInsets.symmetric(horizontal: 10.w),
      child: InkWell(
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
              child: DropdownButtonFormField<MerchentShopDataModel>(
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
                 onTap: (){
                  if(widget.onTab!=null){
                     widget.onTab!();
                  }
                  print("on tab s pressed");
                },
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
                items: widget.options?.map((MerchentShopDataModel value) {
                  return DropdownMenuItem<MerchentShopDataModel>(
                    value: value,
                    child: BiaText(value.name??""/*widget.displayName(value.question).toString()*/,
                        textType: TextType.headLine6, maxLine: 2),
                  );
                }).toList(),

                onChanged: (value) {
                  print(value);
                  setState(() {
                   widget.controller!.text =  value?.name??"";
                    widget.onSelected(value!);
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
