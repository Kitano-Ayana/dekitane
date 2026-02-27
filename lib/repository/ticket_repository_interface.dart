import 'package:flutter/material.dart';

abstract class TicketRepositoryInterface {
  Future<void> createTicket({required String title, required int point});
}
