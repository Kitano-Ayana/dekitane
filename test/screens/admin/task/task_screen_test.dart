import 'package:dekitane/screens/admin/task/task_screen.dart';
import 'package:dekitane/screens/admin/task/widgets/task_create_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:dekitane/screens/admin/task/widgets/task_list.dart';

void main() {
  testWidgets('TaskScreenがエラーなく表示される', (tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: TaskScreen(),
      ),
    );

    expect(find.byType(TaskScreen), findsOneWidget);
    expect(find.text('タスク管理'), findsOneWidget);
    expect(find.byType(TaskCreateForm), findsOneWidget);
    expect(find.byType(TaskList), findsOneWidget);
  });

  testWidgets('入力フォームと送信ボタンが存在する', (tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home:TaskScreen(),
      ),
    );

    expect(find.byKey(const ValueKey('titleField')), findsOneWidget);
    expect(find.byKey(const ValueKey('pointField')), findsOneWidget);
    expect(find.text('タスク追加'), findsOneWidget);
  });

  testWidgets('テキストを入力できる', (testser) async {
    await testser.pumpWidget(
      const MaterialApp(
        home:TaskScreen()
      ),
    );

    await testser.enterText(find.byKey(const ValueKey('titleField')), '掃除',);
    await testser.enterText(find.byKey(const ValueKey('pointField')), '10',);

    expect(find.text('掃除'), findsOneWidget);
    expect(find.text('10'), findsOneWidget);
  });

  testWidgets('未入力で送信してもSnackBarは表示されない', (tester) async{
    await tester.pumpWidget(
      const MaterialApp(
        home:TaskScreen(),
      ),
    );

    await tester.tap(find.text('タスク追加'));
    await tester.pump();

    expect(find.byType(SnackBar), findsNothing);

  });

  //現在TaskApiがDIしてないのでテストできない
  testWidgets('失敗SnackBarを表示したい', (tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: TaskScreen(),
      ),
    );

    await tester.enterText(find.byKey(const ValueKey('titleField')), '掃除');
    await tester.enterText(find.byKey(const ValueKey('pointField')), '10');
    await tester.tap(find.text('タスク追加'));

    await tester.pumpAndSettle();

    // どっちが出るか制御不能
    expect(find.text('タスクを作成に失敗しました'), findsOneWidget);
  });
}
