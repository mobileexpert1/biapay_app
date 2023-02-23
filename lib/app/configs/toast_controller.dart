import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oktoast/oktoast.dart';

class ToastController extends GetxController {
  String? title;
  String message;
  ToastPosition? position;
  final Color? color;

  ToastController({
    this.title,
    required this.message,
    this.position,
    this.color,
  });

  void showToast() {
    showToastWidget(
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 10.0),
          // width: Get.width * 0.9,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: color ?? Colors.grey[900],
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Flexible(
                child: Text(
                  message,
                  style: TextStyle(
                    fontSize: 16,
                    color: Get.isDarkMode ? Colors.black : Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      dismissOtherToast: true,
      position: position,
    );
  }
}
