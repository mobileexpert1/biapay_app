import 'dart:io';
import 'dart:typed_data';

import 'package:biapay_app/app/configs/configs.dart';
import 'package:biapay_app/app/configs/get_extension.dart';
import 'package:biapay_app/app/models/providers/ticket_provider.dart';
import 'package:biapay_app/app/models/ticket_model.dart';
import 'package:biapay_app/app/modules/events/views/new_event.dart';
import 'package:biapay_app/app/modules/ticket/views/new_tiket.dart';
import 'package:biapay_app/generated/locales.g.dart';
import 'package:dio/dio.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../models/ticket_data_model.dart';
import '../../../widgets/export_file.dart';

class NewTicketController extends GetxController {
  List<PopupMenuItem<int>>? filterList = [];

  //TODO: Implement TicketController
  final priorityController = TextEditingController();
  final titleController = TextEditingController();
  final msgController = TextEditingController();
  final statusController = TextEditingController();
  final keyForm = GlobalKey<FormState>();
  final _ticketProvider = TicketProvider();

  Ticket ticket = Ticket();
  final priorities = <String>[].obs;
  final status = <String>[].obs;
  final loading = false.obs;
  final error = false.obs;
  final tickets = <Ticket>[].obs;
  final image = Rx<File?>(null);
  Uint8List? uint8list;
  var attachMentId;

  @override
  void onInit() {
    super.onInit();
    _ticketProvider.onInit();
    final p = box.read(Config.keys.priorityTicketKey);
    final s = box.read(Config.keys.statusTicketKey);
    if (p != null) {
      priorities.addAll(p.cast<String>());
    }
    if (s != null) {
      status.addAll(s.cast<String>());
    }
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      getArguments();
      getPriorityAndStatus();
    });
  }

  getArguments() {
    if (Get.arguments != null) {
      var ticketData = Get.arguments;
      titleController.text = ticketData?.title ?? "";
      msgController.text = ticketData?.content ?? "";
      priorityController.text = ticketData?.priority ?? "";
      ticket = ticketData;
      if (ticket.attachments?.length != 0) {
        attachMentId=ticket.attachments?.first.id;
        hitApiToGetTicketImage(ticket.attachments?.first.uuid);
      }

      update();
    }
  }

  hitApiToGetTicketImage(String? uuid) async {
    Get.showLoader();
    await userProvider
        .getTicketImage(endPointUrl: TICKET_PRFOFILE, udid: uuid)
        .then((value) {
      Get.closeLoader();
      if (value != null) {
        uint8list = Uint8List.fromList(value);
        update();
        print(uint8list);
      }
    }).onError((error, stackTrace) {
      Get.closeLoader();
      Get.showtoast(error.toString());
    });
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  validateTextFields() {
    if (isEmptyFiedds(titleController?.text) == true) {
      Get.showtoast(LocaleKeys.title_empty.tr);
      return;
    } else if (isEmptyFiedds(msgController?.text) == true) {
      Get.showtoast(LocaleKeys.msg_empty.tr);
      return;
    } else if (isEmptyFiedds(priorityController?.text) == true) {
      Get.showtoast(LocaleKeys.priority_empty.tr);
      return;
    } else if (image.value == null) {
      Get.showtoast(LocaleKeys.select_image.tr);
      return;
    } else {
      hitApiTouploadImage();
    }
  }



  validateUpdatedTextFields() {
    if (isEmptyFiedds(titleController?.text) == true) {
      Get.showtoast(LocaleKeys.title_empty.tr);
      return;
    } else if (isEmptyFiedds(msgController?.text) == true) {
      Get.showtoast(LocaleKeys.msg_empty.tr);
      return;
    } else if (isEmptyFiedds(priorityController?.text) == true) {
      Get.showtoast(LocaleKeys.priority_empty.tr);
      return;
    }

    else {
      if(uint8list!=null){
        hitApitoUpdateTicket(attachMentId);
        return;
      }else if(image.value==null){
        Get.showtoast(LocaleKeys.select_image.tr);
        return;
      }else{
        hitApiTouploadImage();
      }

    }
  }

  hitApitoUploadTicket(attachmentId) async {
    hidekeyboard();
    Get.showLoader();
    var requestModel = addTicketRequestModel(
        title: titleController?.text,
        content: msgController.text,
        priority: priorityController.text,
        attachments: [
          {
            'id': attachmentId,
          }
        ]);
    await userProvider.uploadTicket(requestModel).then((value) {
      Get.closeLoader();
      if (value != null) {
        Get.back(canPop: true, result: "data");
        Get.showtoast(LocaleKeys.ticket_added_sucessfully.tr);
      }
    }).onError((error, stackTrace) {
      Get.closeLoader();
      Get.showtoast(error.toString());
    });
  }

  hitApitoUpdateTicket(attachmentId) async {
    Get.showLoader();
    hidekeyboard();
    var requestModel = addTicketRequestModel(
        title: titleController?.text,
        content: msgController.text,
        priority: priorityController.text,
        attachments: [
          {
            'id': attachmentId,
          }
        ]);
    await userProvider
        .updateTicket(ticketId: ticket.ticketNo, data: requestModel)
        .then((value) {
      Get.closeLoader();
      if (value != null) {
        Get.back(canPop: true, result: "data");
        Get.showtoast(LocaleKeys.ticket_updated_sucessfully.tr);
      }
    }).onError((error, stackTrace) {
      Get.closeLoader();
      Get.showtoast(error.toString());
    });
  }

  hitApiTouploadImage() async {
    TicketDataModel ticketDataModel;
    Get.showLoader();
    await userProvider.uploadTicketImage(image.value!).then((value) {
      Get.closeLoader();
      if (value != null) {
        ticketDataModel = value;
        update();
        if (Get.arguments == null) {
          hitApitoUploadTicket(ticketDataModel?.id);
        } else {
          hitApitoUpdateTicket(ticketDataModel?.id);
        }

      }
    }).onError((error, stackTrace) {
      Get.closeLoader();
      Get.showtoast(error.toString());
    });

    /* if (image.value != null) {
      await _ticketProvider.uploadImage(doc: image.value!, ticketId: ticket.id);
    }
    Get.back();
    tickets.insert(0, ticket);*/
  }

  void getPriorityAndStatus() async {
    try {
      status(await _ticketProvider.status);

      priorities(await _ticketProvider.priorities);
      box.write(Config.keys.priorityTicketKey, priorities);
      box.write(Config.keys.statusTicketKey, status);
      update();
    } catch (e) {
      print(e);
    }
  }

  void pickImage() {
    ImagePicker().pickImage(source: ImageSource.gallery).then((value) {
      if (value != null) {
        uint8list = null;
        image(File(value.path));
        update();
      }
    });
  }
}
