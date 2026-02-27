abstract class TicketApiInterface {
  Future<void> createTicket({required String title, required int point});
}
