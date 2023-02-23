import 'package:biapay_app/app/configs/toast_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:oktoast/oktoast.dart';

extension Utils on GetInterface {
  showLoader(
      {bool dismissible = false, bool canUserPop = false, bool dense: false}) {
    this.dialog(
        WillPopScope(
          onWillPop: () async {
            return canUserPop;
          },
          child: Container(
            alignment: Alignment.center,
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
            ),
          ),
        ),
        barrierDismissible: dismissible);
  }

  closeLoader() {
    if (this.isDialogOpen!) {
      Get.back();
    }
  }

  void copy(String? value) {
    Clipboard.setData(ClipboardData(text: value));
    print(value);
    // showtoast(
    //   null,
    // );
  }

  Widget circularLoader() => Center(
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
        ),
      );

  showtoast(String? msg,
      {Color color = Colors.red, ToastPosition position = ToastPosition.top}) {
    if (msg == null) return;

    ToastController(message: msg, color: color, position: position).showToast();
  }

  String parseDate(String? date, [String? format]) {
    if (date == null || date == "") return '';
    if (DateTime.tryParse(date) == null) return date;
    var formDate =
        DateFormat(format ?? "dd MMMM yyyy", Get.locale!.languageCode);
    return formDate.format(DateTime.parse(date).toLocal()).toString();
  }

  String formatNumber(val, [String? format]) {
    if (val == null) return '';
    return NumberFormat(format ?? "#,###.##", Get.locale!.languageCode)
        .format(val);
  }

  Widget getDescriptionWidget(
    String value, {
    List<String>? arg,
    TextAlign? textAlign,
    double? fontSize1,
    double? fontSize2,
    Color? color1,
    Color? color2,
  }) {
    final data = value.split("%s");

    return RichText(
        textAlign: textAlign ?? TextAlign.center,
        text: TextSpan(children: [
          for (var i = 0; i < data.length; i++) ...[
            TextSpan(
                style: Get.textTheme.headline3!.copyWith(
                  color: color1,
                  fontSize: fontSize1 ?? 13,
                ),
                text: data[i]),
            TextSpan(
                style: Get.textTheme.headline4!
                    .copyWith(color: color2, fontSize: fontSize2 ?? 15),
                text: arg != null && arg.length > 0 && i < arg.length
                    ? arg[i]
                    : ""),
          ]
        ]));
  }

  String formatNumberCard(String? number,
      {bool obscure = true, String pattern = " "}) {
    if (number == null) {
      return '';
    }
    List<String> data = [];
    int index = 0;
    String interval = "";
    for (var i = 0; i < number.length; i++) {
      index++;
      interval += number[i];
      if (index == 4) {
        data.add(interval);
        interval = "";
        index = 0;
      }
    }
    data[1] = obscure ? (data[1].substring(0, 2) + '**') : data[1];
    data[2] = obscure ? '****' : data[2];
    return data.join(pattern);
  }
}
