abstract class TaskApiInterface {
  Future<void> createTask({required String title, required int point});
}
