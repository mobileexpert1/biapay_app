import 'dart:io';

import 'package:biapay_app/app/configs/configs.dart';
import 'package:biapay_app/app/configs/get_extension.dart';
import 'package:biapay_app/app/models/providers/ticket_provider.dart';
import 'package:biapay_app/app/models/ticket_model.dart';
import 'package:biapay_app/app/modules/ticket/views/new_tiket.dart';
import 'package:biapay_app/generated/locales.g.dart';
import 'package:dio/dio.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../widgets/export_file.dart';

class TicketController extends GetxController {
  List<PopupMenuItem<int>>? filterList = [];

  //TODO: Implement TicketController
  final searchController = TextEditingController();
  final keyForm = GlobalKey<FormState>();
  final _ticketProvider = TicketProvider();

  final ticket = Ticket();
  final priorities = <String>[].obs;
  final status = <String>[].obs;
  final loading = false.obs;
  final error = false.obs;
  int? page = 0, pageSize = 10;
  ScrollController scrollController = ScrollController();

  RxList<Ticket>? tickets = <Ticket>[].obs;
  RxList<Ticket>? mainTicketList = <Ticket>[].obs;
  final image = Rx<File?>(null);

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

      getTicket();
      //  paginatedlist();
    });
  }

  paginatedlist() {
    scrollController.addListener(() {
      if (scrollController.position.maxScrollExtent ==
          scrollController.position.pixels) {
        //int? totalPages=palLinkModel?.totalPages??0;
        // if(palLinkModel!=null&&page! <totalPages){
        page = page! + 1;
        update();
        getTicket();
        // }
      }
    });
  }

  getArguments() {
    if (Get.arguments != null) {
      Ticket ticket = Get.arguments;
      update();
    }
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

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

  Future<void> newTicket() async {
    var result = await Get.toNamed(Routes.NEW_TICKETS);
    if (result != null) {
      mainTicketList?.clear();
      tickets?.clear();
      getTicket();
    }
  }

  getTicket() async {
    Get.showLoader();
    await userProvider
        .getTicketApiCall(page: page, size: pageSize)
        .then((value) {
      Get.closeLoader();
      if (value != null) {
        mainTicketList!.addAll(value);
        tickets!.addAll(value);
        mainTicketList!.refresh();
        tickets!.refresh();
        update();
      }
    }).onError((error, stackTrace) {
      Get.closeLoader();
      Get.showtoast(error.toString());
    });
  }

  void pickImage() {
    ImagePicker().pickImage(source: ImageSource.gallery).then((value) {
      if (value != null) {
        image(File(value.path));
      }
    });
  }



  applySerachOnList() {
    if (mainTicketList?.value.length != 0) {
      tickets!.clear();
      mainTicketList?.forEach((element) {
        if(element?.title?.toLowerCase().startsWith(searchController?.text.toLowerCase()??"")==true){
          tickets!.add(element!);
          tickets!.refresh();
          update();
        }
      });
      if(tickets?.length==0){
        print("cjel ${tickets?.length}");
        tickets?.refresh();
        update();
      }
    }
  }
}
