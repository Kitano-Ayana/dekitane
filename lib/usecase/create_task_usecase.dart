import 'package:dekitane/repository/task_repository_interface.dart';

class CreateTaskUseCase {
  final TaskRepositoryInterface repository;

  CreateTaskUseCase({
    required this.repository,
  });

  Future<void> execute({
    required String title,
    required int point,
  }) async {

   await repository.createTask(title: title, point: point);
  }

}