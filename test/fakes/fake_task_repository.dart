import 'package:dekitane/repository/task_repository_interface.dart';

class FakeTaskRepository implements TaskRepositoryInterface {
  final bool shouldFail;

  FakeTaskRepository({required this.shouldFail});

  @override
  Future<void> createTask({
    required String title,
    required int point,
  }) async {
    if (shouldFail) {
      throw Exception('fail');
    }
  }
}
