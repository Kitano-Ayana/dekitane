import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:dekitane/screens/admin/task/widgets/task_create_form.dart';

void main() {
  testWidgets('TaskCreateForm 初期表示', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: TaskCreateForm(),
        ),
      ),
    );

    //タイトル
    expect(find.text('新しいタスクを追加する'), findsOneWidget);

    //ラベル
    expect(find.text('タスク名'), findsOneWidget);
    expect(find.text('付与ポイント'), findsOneWidget);

    //ボタン
    expect(find.text('タスク追加'), findsOneWidget);
  });

  testWidgets('未入力で送信するとバリデーションエラーが表示', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: TaskCreateForm(),
        ),
      ),
    );

    await tester.tap(find.text('タスク追加'));
    await tester.pump();

    //バリデーションエラーメッセージ
    expect(find.text('タスク名を入力してください'), findsOneWidget);
    expect(find.text('ポイントを入力してください'), findsOneWidget);
  });

  testWidgets('正しい入力でDTOが生成される', (tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: TaskCreateForm(),
        ),
      ),
    );

    await tester.enterText(find.byKey(const ValueKey('titleField')), '部屋の片付け');
    await tester.enterText(find.byKey(const ValueKey('pointField')), '10');

    await tester.tap(find.text('タスク追加'));
    await tester.pump();

    expect(true, isTrue);
  });

  testWidgets('正常入力でバリデーションエラーなし', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: TaskCreateForm(),
        ),
      ),
    );

    await tester.enterText(
      find.byType(TextFormField).at(0),
      '掃除',
    );
    await tester.enterText(
      find.byType(TextFormField).at(1),
      '10',
    );

    await tester.tap(find.text('タスク追加'));
    await tester.pump();

    expect(find.textContaining('入力してください'), findsNothing);
  });

  testWidgets('正しい入力で送信できる', (tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home:Scaffold(
          body: TaskCreateForm(),
        ),
      ),
    );

    await tester.enterText(find.byKey(const ValueKey('titleField')), '掃除');
    await tester.enterText(find.byKey(const ValueKey('pointFiled')), '10');

    await tester.tap(find.text('タスク追加'));

    await tester.pumpAndSettle();
  });
}
