import 'dart:io';

import 'package:biapay_app/app/configs/configs.dart';
import 'package:biapay_app/app/configs/get_extension.dart';
import 'package:biapay_app/app/models/providers/ticket_provider.dart';
import 'package:biapay_app/app/models/ticket_model.dart';
import 'package:biapay_app/app/modules/events/views/new_event.dart';
import 'package:biapay_app/app/modules/ticket/views/new_tiket.dart';
import 'package:biapay_app/generated/locales.g.dart';
import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../widgets/export_file.dart';

class EventController extends GetxController {
  
  final eventTitleController = TextEditingController();
  final eventOwnerController = TextEditingController();
  final eventTypeController = TextEditingController();
  final eventCategoryController = TextEditingController();
  final currencyController = TextEditingController();
  final keyForm = GlobalKey<FormState>();
  
  //TODO: Implement TicketController

  final image = Rx<File?>(null);
  List<String> testList = [
    "Tested",
    "Tested",
    "Tested",
  ];
  var selectedTest;
  @override
  void onInit() {

    super.onInit();
  }

  List<DropdownMenuItem<Object?>> buildDropdownTestItems(List _testList) {
    List<DropdownMenuItem<Object?>> items = [];
    for (var i in _testList) {
      items.add(
        DropdownMenuItem(
          value: i,
          child: Text(i['keyword']),
        ),
      );
    }
    return items;
  }


  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}




  void newEvents() {
    Get.to(() =>  NewEvent());
  }

/*  void getTicket() async {
    try {
      error(true);
      loading(true);
      final _result = await _ticketProvider.getTickets();

      tickets(_result);
    } on DioError catch (e) {
      error(true);
      print(e);
    } finally {
      loading(false);
    }
  }*/

  void pickImage() {
    ImagePicker().pickImage(source: ImageSource.gallery).then((value) {
      if (value != null) {
        image(File(value.path));
      }
    });
  }
}
