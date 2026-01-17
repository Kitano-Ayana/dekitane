import 'package:flutter_test/flutter_test.dart';
import '../../lib/validators/task_validator.dart';

void main() {
  group('TaskValidator.title', () {
    test('空文字の場合はエラーを返す', () {
      final input = '';
      final result = TaskValidator.title(input);
      expect(result, 'タスク名を入力してください');
    });

    group('TaskValidator.point', () {
      test('空文字の場合はエラーを返す', () {
        final input = '';
        final result = TaskValidator.point(input);
        expect(result, 'ポイントを入力してください');
      });
    });
  });
}
