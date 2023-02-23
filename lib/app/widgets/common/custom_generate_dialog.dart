

import 'dart:ui';

import '../export_file.dart';

showGenerateDialog({context,child}){
  return showGeneralDialog(
    context: context,
    pageBuilder: (BuildContext buildContext, Animation<double> animation,
        Animation<double> secondaryAnimation) {
      hidekeyboard();
      return BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Dialog(
          child: child,
        ),
      );
    },
    barrierDismissible: true,
    barrierLabel:
    MaterialLocalizations.of(Get.context!).modalBarrierDismissLabel,
    barrierColor: Colors.transparent,
    transitionDuration: const Duration(milliseconds: 200),
  );
}