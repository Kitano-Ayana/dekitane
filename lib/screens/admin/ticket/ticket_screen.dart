import 'package:dekitane/dto/ticket_create_dto.dart';
import 'package:dekitane/usecase/create_ticket_usecase.dart';
import 'package:flutter/material.dart';
import '../../../data/ticket_stub.dart';
import 'widgets/ticket_create_form.dart';
import 'widgets/ticket_list.dart';

class TicketScreen extends StatelessWidget {
  final CreateTicketUseCase createTicketUseCase;

  const TicketScreen({
    super.key,
    required this.createTicketUseCase,
  });


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('タスク管理'),
      ),
      body: Column(
        children: [
          TicketCreateForm(
            onSubmit: (TicketCreateDto dto) async  {
              try {
                await createTicketUseCase.execute(title: dto.title, point: dto.point);

                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('チケットを作成しました'),
                  ),
                );
              } catch (e) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('チケットを作成に失敗しました'),
                  ),
                );
              }
            },
          ),
          const Divider(),
          Expanded(child: TicketList(tickets: ticketStubList)),
        ],
      ),
    );
  }
}