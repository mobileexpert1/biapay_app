import 'package:biapay_app/app/widgets/common/bia_appbar.dart';
import 'package:biapay_app/app/widgets/common/bia_scaffold.dart';
import 'package:biapay_app/app/widgets/common/bia_text.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Impressum extends StatefulWidget {
  const Impressum({Key? key}) : super(key: key);

  @override
  _ImpressumState createState() => _ImpressumState();
}

class _ImpressumState extends State<Impressum> {
  @override
  Widget build(BuildContext context) {
    return BiaScaffold(
      appBar: BiaAppBar.simple('Impressum'),
      body: Container(
        margin: EdgeInsets.only(bottom: 100.h, top: 100.h),
        padding: EdgeInsets.all(20.h),
        width: double.infinity,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(15),
            topLeft: Radius.circular(15),
            bottomRight: Radius.circular(15),
            bottomLeft: Radius.circular(15),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const BiaText(
              'Impresum',
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
            SizedBox(
              height: 30.h,
            ),
            const BiaText(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit.'
              ' Mauris ac est diam. Proin quis vulputate nunc. ',
              fontSize: 16,
            ),
            const BiaText(
              'Sed id dui sed turpis accumsan dictum. Quisque lacinia nisi est, in interdum dolor laoreet pretium. ',
              fontSize: 16,
            ),
            const BiaText(
              'Vivamus at auctor neque. Donec risus massa, auctor a sapien sit amet, finibus eleifend purus.',
              fontSize: 16,
            ),
            const BiaText(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit.'
              ' Mauris ac est diam. Proin quis vulputate nunc. ',
              fontSize: 16,
            ),
            const BiaText(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit.'
              ' Mauris ac est diam. Proin quis vulputate nunc. ',
              fontSize: 16,
            ),
            const BiaText(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit.'
              ' Mauris ac est diam. Proin quis vulputate nunc. ',
              fontSize: 16,
            ),
            const BiaText(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit.'
              ' Mauris ac est diam. Proin quis vulputate nunc. ',
              fontSize: 16,
            ),
          ],
        ),
      ),
    );
  }
}
