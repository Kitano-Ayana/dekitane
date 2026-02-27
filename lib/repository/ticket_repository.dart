import 'package:dekitane/api/ticket_api_interface.dart';
import 'ticket_repository_interface.dart';

class TicketRepository implements TicketRepositoryInterface {
  final TicketApiInterface ticketApi;

  TicketRepository({required this.ticketApi});

  @override
  Future<void> createTicket({
    required String title,
    required int point,
  }) async {
    // 将来的にここでDTO変換やキャッシュ処理などができる
    await ticketApi.createTicket(title: title, point: point);
  }
}