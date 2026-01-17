import 'package:flutter/material.dart';
import '../../../data/task_stub.dart';
import 'widgets/task_create_form.dart';
import 'widgets/task_list.dart';

class TaskScreen extends StatelessWidget {
  const TaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('タスク管理'),
      ),
      body: Column(
        children: [
          const TaskCreateForm(),
          const Divider(),
          Expanded(child: TaskList(tasks: taskStubList)),
        ],
      ),
    );
  }
}