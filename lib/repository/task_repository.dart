import 'package:dekitane/api/task_api_interface.dart';
import 'task_repository_interface.dart';

class TaskRepository implements TaskRepositoryInterface {
  final TaskApiInterface taskApi;

  TaskRepository({required this.taskApi});

  @override
  Future<void> createTask({
    required String title,
    required int point,
  }) async {
    // 将来的にここでDTO変換やキャッシュ処理などができる
    await taskApi.createTask(title: title, point: point);
  }
}