import 'dart:io';

import 'package:biapay_app/app/models/providers/base_provider.dart';
import 'package:dio/dio.dart';

import '../ticket_model.dart';

class TicketProvider extends BaseProvider {
  @override
  void onInit() {
    super.onInit();
  }

  Future<List<Ticket>> getTickets() => dio.get("user/ticket").then((response) =>
      (response.data as List).map((e) => Ticket.fromJson(e)).toList());


  Future<List<String>> get priorities => dio
      .get('user/ticket/priority')
      .then((response) => (response.data as List).cast<String>());
  Future<List<String>> get status => dio
      .get('user/ticket/status')
      .then((response) => (response.data as List).cast<String>());
  Future<void> uploadImage(
          {String type = "TICKET", required File doc, required int ticketId}) =>
      dio
          .post("user/upload",
              data: FormData.fromMap({
                "document": MultipartFile.fromFileSync(doc.path),
                "type": type,
                "ticket_id": ticketId,
              }))
          .then((value) => null);
}
