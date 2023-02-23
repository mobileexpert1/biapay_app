import 'package:biapay_app/app/widgets/common/bia_button.dart';
import 'package:biapay_app/app/widgets/common/bia_text.dart';
import 'package:biapay_app/app/widgets/common/bia_textfield.dart';
import 'package:biapay_app/app/widgets/common/input_field_type/input_field_type.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChangeEmailDialogue extends StatelessWidget {
  final Function(String) otap;
  const ChangeEmailDialogue({required this.otap, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final _formKey = useMemoized(() => GlobalKey<FormState>());

    // final TextEditingController emailController = useTextEditingController();
    return AlertDialog(
      contentPadding: const EdgeInsets.only(top: 20),
      title: BiaText(
        'Change email address',
        textType: TextType.headLine5,
        color: Theme.of(context).colorScheme.primary,
      ),
      content: Form(
        // key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            BiaTextField(
                // controller: emailController,
                inputType: const InputFieldType.email(),
                borderColor: Colors.black,
                textColor: Colors.black,
                hintColor: Colors.black,
                hint: 'Enter your email'),
            BiaButton(
                color: Theme.of(context).colorScheme.primary,
                textColor: Colors.white,
                textType: TextType.body1,
                padding: EdgeInsets.zero,
                text: 'Change',
                onPressed: () {
                  // if (_formKey.currentState!.validate()) {
                  //   Navigator.pop(context);
                  //   otap(emailController.text);
                  // }
                })
          ],
        ),
      ),
    );
  }
}
