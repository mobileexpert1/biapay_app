// ignore_for_file: invalid_use_of_protected_member

import 'dart:io';

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

import '../../../models/payink_model.dart';
import '../../../widgets/export_file.dart';

class PayLinkController extends GetxController {
  int? page = 0, pageSize = 10;
  ScrollController scrollController = ScrollController();

  RxBool loading = false.obs;
  PalLinkModel? palLinkModel;
  var searchController = TextEditingController();
  RxList<PayLinkDataModel>? payLinkList = <PayLinkDataModel>[].obs;
  RxList<PayLinkDataModel>? mainLinkList = <PayLinkDataModel>[].obs;

  @override
  void onInit() {
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      hitApiToGetPayLinkList();
      paginatedlist();
    });
    super.onInit();
  }

  paginatedlist() {
    scrollController.addListener(() {
      if (scrollController.position.maxScrollExtent ==
          scrollController.position.pixels) {
        int? totalPages = palLinkModel?.totalPages ?? 0;
        if (palLinkModel != null && page! < totalPages) {
          page = page! + 1;
          update();
          hitApiToGetPayLinkList();
        }
      }
    });
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  hitApiToGetPayLinkList() async {
    Get.showLoader();
    await userProvider
        .payLinkListApiCall(page: page, size: pageSize)
        .then((value) {
      Get.closeLoader();
      if (value != null) {
        palLinkModel = value;
        payLinkList?.addAll(palLinkModel?.payLinkList ?? []);
        mainLinkList?.addAll(palLinkModel?.payLinkList ?? []);
        payLinkList?.refresh();
        mainLinkList?.refresh();
        update();
      }
    }).onError((error, stackTrace) {
      Get.closeLoader();
      Get.showtoast(error.toString());
    });
  }

  applySerachOnList() {
    if (mainLinkList?.value.length != 0) {
      payLinkList!.clear();
      mainLinkList?.forEach((element) {
        if (element?.customerName
                    ?.toLowerCase()
                    .startsWith(searchController?.text.toLowerCase() ?? "") ==
                true ||
            element?.email
                    ?.toLowerCase()
                    .startsWith(searchController?.text.toLowerCase() ?? "") ==
                true) {
          payLinkList!.add(element!);
          payLinkList!.refresh();
          update();
        }
      });
      if (payLinkList?.length == 0) {
        payLinkList?.refresh();
        update();
      }
    }
  }

  applyFilterOnList(selectedStatus) {
    if (mainLinkList?.value.length != 0) {
      List<PayLinkDataModel>? filterList = mainLinkList
          ?.where((e) =>
              e.status?.toLowerCase() ==
              selectedStatus?.toString().toLowerCase())
          .toList();
      if (filterList?.length != 0) {
        payLinkList?.clear();
        payLinkList!.addAll(filterList ?? []);
        payLinkList!.refresh();
        update();
      } else {
        payLinkList?.clear();
        payLinkList!.refresh();
        update();
      }
    }
  }
}
