import 'package:biapay_app/app/widgets/common/bia_text.dart';
import 'package:flutter/material.dart';

class AddMoneyDialogue extends StatelessWidget {
  const AddMoneyDialogue({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: BiaText(
        'Add Money',
        textType: TextType.headLine4,
        color: Theme.of(context).colorScheme.secondary,
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          BiaText(
            'Enter amount you want to add in wallet',
            color: Theme.of(context).colorScheme.primary,
          ),
          TextFormField(
              // key: _formKey,
              // controller: _money,
              ),
        ],
      ),
    );
  }
}
