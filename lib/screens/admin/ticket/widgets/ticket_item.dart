import 'package:flutter/material.dart';
import '../../../../models/ticket.dart';

class TicketItem extends StatelessWidget {
  final Ticket ticket;

  const TicketItem({
    super.key,
    required this.ticket,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(ticket.title),
      subtitle: Text('スタンプ： ${ticket.stampCount}'),
      trailing: IconButton(
        icon: const Icon(Icons.delete),
        onPressed: (){
          //TODO:処理あとで
        },
      ),
    );
  }
}
