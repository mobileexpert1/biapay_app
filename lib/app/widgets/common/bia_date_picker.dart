import 'package:biapay_app/app/widgets/common/bia_textfield.dart';
import 'package:date_time_format/date_time_format.dart';
import 'package:flutter/material.dart';

class BiaDatePicker extends StatelessWidget {
  final String title;
  final Function(DateTime)? onChanged;
  final TextEditingController? controller;
    bool? isEnabled=false;
    BiaDatePicker(
      {Key? key, required this.controller, required this.title, this.onChanged,this.isEnabled})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        final DateTime? picked = await showDatePicker(
            context: context,
            initialEntryMode: DatePickerEntryMode.calendarOnly,
            initialDate: DateTime.now(),
            initialDatePickerMode: DatePickerMode.day,
            firstDate: DateTime(1999),
            lastDate: isEnabled==true?DateTime.now():DateTime(2040));
        if (picked != null) {
          controller!.text = picked.format().split('T').first;
          onChanged?.call(picked);
        }
      },
      child: BiaTextField(
        enabled: false,
        borderColor: Colors.black,
        controller: controller,
        hint: title,
        textColor: Colors.black,
        hintColor: Colors.black,
        padding: EdgeInsets.zero,
        suffixIcon: const Icon(
          Icons.calendar_today_rounded,
          color: Colors.grey,
          size: 16,
        ),
      ),
    );
  }
}
