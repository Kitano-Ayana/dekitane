import 'package:flutter_test/flutter_test.dart';
import 'package:dekitane/dto/task_create_dto.dart';

void main() {
  group('TaskCreateDto', () {
    test('DTO生成ができる', () {
      final dto = TaskCreateDto(
        title: '部屋の片付け',
        point: 10,
      );

      expect(dto.title, '部屋の片付け');
      expect(dto.point, 10);
    });

    test('pointが0以下の場合はエラーになる', () {
      expect(
        () => TaskCreateDto(title: '掃除', point: 0),
        throwsArgumentError,
      );
    });
  });
}
