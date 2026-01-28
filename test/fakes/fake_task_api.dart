import 'package:dekitane/api/task_api.dart';

class FakeTaskApi extends TaskApi {
  bool shouldFail;
  bool called = false;

  FakeTaskApi({required this.shouldFail});

  @override
  Future<void> createTask({
    required String title,
    required int point,
  }) async {
    called = true;

    if (shouldFail) {
      throw Exception('Fake Api Error');
    }
  }
}
