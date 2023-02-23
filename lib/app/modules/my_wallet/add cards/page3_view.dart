import 'package:biapay_app/app/widgets/contact_component.dart';
import 'package:flutter/material.dart';

class PageThreeView extends StatelessWidget {
  const PageThreeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ContactComponent(),
        ],
      ),
    );
  }
}
