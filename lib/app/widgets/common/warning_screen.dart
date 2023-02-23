import 'package:biapay_app/app/configs/assets.dart';
import 'package:biapay_app/app/modules/dashboard/views/dashboard_view.dart';
import 'package:biapay_app/app/widgets/auth/auth_option_card.dart';
import 'package:biapay_app/app/widgets/common/bia_button.dart';
import 'package:biapay_app/app/widgets/common/bia_scaffold.dart';
import 'package:flutter/material.dart';

class WarningScreen extends StatelessWidget {
  const WarningScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BiaScaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox.shrink(),
          AuthOptionCard(
              title: 'Congratulations',
              titleColor: Colors.red,
              description:
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam vehicula ornare felis, in egestas elit semper ac. Nullam fringilla nec lacus id sollicitudin. Suspendisse orci sem, interdum ac mi id, congue porttitor tellus. Fusce eu interdum nunc, sed porttitor metus. Fusce eleifend ligula ac mi pharetra pellentesque. Donec congue urna leo, sed porta ipsum consequat id. Fusce eget turpis tincidunt',
              image: Assets.warning,
              onTap: () {}),
          BiaButton(
            text: 'Back',
            color: Theme.of(context).colorScheme.secondary,
            onPressed: () {
              Navigator.of(context);
            },
          )
        ],
      ),
    );
  }
}
