import 'package:biapay_app/app/widgets/common/bia_button.dart';
import 'package:biapay_app/app/widgets/common/bia_text.dart';
import 'package:biapay_app/app/widgets/common/bia_textfield.dart';
import 'package:biapay_app/app/widgets/common/input_field_type/input_field_type.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ChangePhoneDialogue extends StatelessWidget {
  final Function(String) onTap;
  const ChangePhoneDialogue({required this.onTap, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final _formKey = useMemoized(() => GlobalKey<FormState>());
    String? countryCode = '';

    // final TextEditingController _phone = useTextEditingController();
    return AlertDialog(
      contentPadding: const EdgeInsets.only(top: 20),
      title: BiaText(
        'Change phone number',
        textType: TextType.headLine5,
        color: Theme.of(context).colorScheme.primary,
      ),
      content: Form(
        // key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CountryCodePicker(
                  barrierColor: Colors.black12,
                  padding: EdgeInsets.only(left: 20.w),
                  showFlag: false,
                  onChanged: (code) {
                    countryCode = code.dialCode;
                  },
                  onInit: (code) {
                    countryCode = code!.dialCode;
                  },
                  initialSelection: 'IT',
                  textStyle: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                      fontSize: ScreenUtil().setSp(25)),
                ),
                Expanded(
                  child: BiaTextField(
                    inputType: const InputFieldType.phone(),
                    // controller: _phone,
                    hint: 'phn_hint'.tr,
                    label: "phn".tr,
                    borderColor: Colors.black,
                    textColor: Colors.black,
                    hintColor: Colors.black,
                    padding: EdgeInsets.only(right: 20.w),
                  ),
                ),
              ],
            ),
            BiaButton(
                color: Theme.of(context).colorScheme.primary,
                textColor: Colors.white,
                textType: TextType.body1,
                padding: EdgeInsets.zero,
                text: 'Change',
                onPressed: () {
                  // if (_formKey.currentState!.validate()) {
                  //   onTap(countryCode! + _phone.text);
                  //   Navigator.pop(context);
                  // }
                })
          ],
        ),
      ),
    );
  }
}
