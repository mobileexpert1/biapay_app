import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:pinput/pin_put/pin_put.dart';

import 'bia_text.dart';
import 'input_field_type/input_field_type.dart';

class BiaTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String hint;
  final String? label;
  final int maxLines;
  final Color fillColor;
  final Color hintColor;
  final Color? textColor;
  final Widget? suffixIcon;
  final Color? borderColor;
  final TextType? textType;
  final EdgeInsets? padding;
  final String? initialValue;
  final bool enabled;
  final InputFieldType inputType;
  int? maxLength;
  final void Function(String value)? onChanged;

  BiaTextField({
    this.controller,
    required this.hint,
    this.label,
    this.inputType = const InputFieldType.regular(),
    this.hintColor = Colors.grey,
    this.textColor,
    this.maxLength,
    this.fillColor = Colors.white,
    this.padding,
    this.maxLines = 1,
    this.borderColor = Colors.transparent,
    this.textType,
    this.enabled = true,
    this.onChanged,
    this.suffixIcon,
    this.initialValue,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          padding ?? EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (hint.isNotEmpty)
            BiaText(
              label ?? hint,
              color: Colors.white,
              textType: textType ?? TextType.headLine6,
              fontWeight: FontWeight.w300,
              padding: EdgeInsets.only(bottom: 5.h),
            ),
          inputType == InputFieldType.phone()
              ? IntlPhoneField(
                  controller: controller,
                  decoration: _defaultDecoration(context),
                  initialCountryCode: Get.deviceLocale?.countryCode ?? 'CM',
                  onChanged: (phone) => onChanged?.call(phone.completeNumber),
                  textAlignVertical: TextAlignVertical.center,
                  style: (textType ?? TextType.headLine5)
                      .toStyle(context: context)!
                      .copyWith(
                        color: textColor ?? Colors.blue[900],
                        fontWeight: FontWeight.w300,
                      ),
                  cursorColor: Colors.black,
                  showCursor: true,
                )
              : TextFormField(
                  maxLength: maxLength,
                  initialValue: initialValue,
                  enabled: enabled,
                  onChanged: onChanged,
                  enableInteractiveSelection:
                      inputType != const InputFieldType.password(),
                  validator: _validator,
                  showCursor: true,
                  maxLines: maxLines,
                  // cursorColor: Theme.of(context).colorScheme.primaryVariant,
                  cursorColor: Colors.black,
                  keyboardType: inputType.maybeWhen<TextInputType?>(
                      email: () => TextInputType.emailAddress,
                      phone: () => TextInputType.phone,
                      number: () => TextInputType.number,
                      orElse: () => null),
                  obscureText: inputType == const InputFieldType.password(),
                  style: (textType ?? TextType.headLine5)
                      .toStyle(context: context)!
                      .copyWith(
                        color: textColor ?? Colors.blue[900],
                        fontWeight: FontWeight.w300,
                      ),
                  controller: controller,
                  textAlignVertical: TextAlignVertical.center,
                  decoration: _defaultDecoration(context),
                ),
        ],
      ),
    );
  }

  InputDecoration _defaultDecoration(context) => InputDecoration(
        fillColor: fillColor,
        filled: true,
        contentPadding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 20.h),
        isDense: true,
        prefixStyle: TextStyle(
            color: Theme.of(context).colorScheme.secondary,
            fontSize: ScreenUtil().setSp(25)),
        hintText: hint,
        errorMaxLines: 2,
        suffixIcon: suffixIcon,
        // suffixIconConstraints: const BoxConstraints(
        //     minHeight: 25, minWidth: 25, maxWidth: 25, maxHeight: 25),
        // suffix: suffixIcon,
        labelStyle: TextType.body2
            .toStyle(context: context)!
            .copyWith(color: hintColor),
        hintStyle: (textType ?? TextType.headLine6)
            .toStyle(context: context)!
            .copyWith(color: hintColor, fontWeight: FontWeight.w300),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: borderColor!),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: borderColor!),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          // borderSide: BorderSide(color: Colors.transparent),
        ),
      );

  static Widget mobileOrEmail(
      {required TextEditingController countryCode,
      required TextEditingController controller}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BiaText(
          'Email or phone',
          color: Colors.white,
          textType: TextType.headLine6,
          fontWeight: FontWeight.w300,
          padding: EdgeInsets.only(bottom: 5.h, top: 20.h),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 50.h,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5),
                  border: Border(right: BorderSide(color: Colors.grey))),
              margin: EdgeInsets.only(right: 5),
              child: CountryCodePicker(
                barrierColor: Colors.black12,
                padding: EdgeInsets.zero,
                onChanged: (code) {
                  countryCode.text = code.dialCode!;
                },
                onInit: (code) {
                  countryCode.text = code!.dialCode!;
                },
                initialSelection: countryCode.text,
                textStyle: TextStyle(
                    color: Colors.grey, fontSize: ScreenUtil().setSp(20)),
              ),
            ),
            Expanded(
              child: BiaTextField(
                padding: EdgeInsets.zero,
                controller: controller,
                hint: '',
              ),
            ),
          ],
        ),
      ],
    );
  }

  static Widget otp({required TextEditingController? controller}) {
    BoxDecoration _pinPutDecoration = BoxDecoration(
      color: Colors.white,
      // border: Border.all(color: Colors.deepPurpleAccent),
      borderRadius: BorderRadius.circular(15.0),
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BiaText(
          'Enter OTP',
          color: Colors.white,
          textType: TextType.headLine6,
          fontWeight: FontWeight.w300,
          padding: EdgeInsets.only(bottom: 5.h, top: 20.h),
        ),
        PinPut(
          fieldsCount: 6,
          validator: (value) =>
              value!.length != 6 ? 'Please enter otp properly' : null,
          eachFieldHeight: 50.h,
          eachFieldWidth: 60.w,
          textStyle: TextStyle(
              color: Colors.blue[900], fontSize: ScreenUtil().setSp(30)),
          controller: controller,
          submittedFieldDecoration: _pinPutDecoration.copyWith(
            borderRadius: BorderRadius.circular(20.0),
          ),
          selectedFieldDecoration: _pinPutDecoration,
          followingFieldDecoration: _pinPutDecoration.copyWith(
            borderRadius: BorderRadius.circular(5.0),
          ),
        ),
      ],
    );
  }

  String? _validator(String? text) {
    if (text!.isEmpty) {
      print('empty');
      return "empty_field".tr;
    } else {
      return inputType.when(
          phone: () {
            final RegExp regExp =
                RegExp(r"((\+)|(00))?[0-9\(][\s\-\)0-9][^\n]{6,15}[0-9]");
            return !regExp.hasMatch(text) ? 'phone_valid'.tr : null;
          },
          email: () {
            final RegExp regExp = RegExp(
                r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$");
            return !regExp.hasMatch(text) ? 'err_email'.tr : null;
          },
          password: () {
            final RegExp regExp =
                RegExp(r"^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[a-zA-Z\d\w\W]{8,}$");
            return !regExp.hasMatch(text) ? 'err_password_format'.tr : null;
          },
          regular: () => null,
          url: () {
            final RegExp regExp = RegExp(
                r"\b(http:\/\/www\.|https:\/\/www\.|http:\/\/|https:\/\/)?[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(:[0-9]{1,5})?(\/\S*)?\b\/?");
            return !regExp.hasMatch(text) ? 'phone_valid'.tr : null;
          },
          number: () {
            return double.tryParse(text) == null
                ? "Only numbers are allowed"
                : null;
          });
    }
  }
}
