import 'package:dekitane/repository/ticket_repository_interface.dart';

class CreateTicketUseCase {
  final TicketRepositoryInterface repository;

  CreateTicketUseCase({
    required this.repository,
  });

  Future<void> execute({
    required String title,
    required int point,
  }) async {

   await repository.createTicket(title: title, point: point);
  }

}