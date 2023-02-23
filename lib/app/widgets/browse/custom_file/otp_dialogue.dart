import 'package:biapay_app/app/widgets/common/bia_button.dart';
import 'package:biapay_app/app/widgets/common/bia_text.dart';
import 'package:biapay_app/app/widgets/common/bia_textfield.dart';
import 'package:flutter/material.dart';

class OtpDialogue extends StatelessWidget {
  const OtpDialogue({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final _formKey = useMemoized(() => GlobalKey<FormState>());

    // final TextEditingController _phone = useTextEditingController();
    return AlertDialog(
      contentPadding: const EdgeInsets.only(top: 20),
      title: BiaText(
        'Code sent',
        textType: TextType.headLine5,
        color: Theme.of(context).colorScheme.primary,
      ),
      content: Form(
        // key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            BiaTextField(
              // controller: _phone,
              hint: 'Enter otp',
              borderColor: Colors.black,
              textColor: Colors.black,
              hintColor: Colors.black,
            ),
            BiaButton(
                color: Theme.of(context).colorScheme.primary,
                textColor: Colors.white,
                textType: TextType.body1,
                padding: EdgeInsets.zero,
                text: 'Submit',
                onPressed: () {
                  // if (_formKey.currentState!.validate()) {
                  //   Navigator.pop(context);
                  // }
                })
          ],
        ),
      ),
    );
  }
}
