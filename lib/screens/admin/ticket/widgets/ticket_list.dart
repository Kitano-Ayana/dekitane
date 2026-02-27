import 'package:flutter/material.dart';
import 'package:dekitane/models/ticket.dart';
import 'ticket_item.dart';

class TicketList extends StatelessWidget {
  final List<Ticket> tickets;

  const TicketList({super.key, required this.tickets});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: tickets.length,
      itemBuilder: (context, index) {
        return TicketItem(ticket: tickets[index]);
      },
    );
  }
}
