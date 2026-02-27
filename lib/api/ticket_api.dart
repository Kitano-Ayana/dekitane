import 'package:dekitane/api/ticket_api_interface.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TicketApi implements TicketApiInterface {
  @override
  Future<void> createTicket({
    required String title,
    required int point,
}) async {
    await Future.delayed(const Duration(seconds: 1));

    //例外を投げる
    throw Exception('Network error');
  }
}