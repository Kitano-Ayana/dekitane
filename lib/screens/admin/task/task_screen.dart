import 'package:dekitane/api/task_api.dart';
import 'package:dekitane/api/task_api_interface.dart';
import 'package:dekitane/dto/task_create_dto.dart';
import 'package:flutter/material.dart';
import '../../../data/task_stub.dart';
import 'widgets/task_create_form.dart';
import 'widgets/task_list.dart';
import 'package:dekitane/repository/task_repository_interface.dart';

class TaskScreen extends StatelessWidget {
  final TaskRepositoryInterface repository;

  const TaskScreen({
    super.key,
    required this.repository,
  });


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('タスク管理'),
      ),
      body: Column(
        children: [
          TaskCreateForm(
            onSubmit: (TaskCreateDto dto) async  {
              try {
                await repository.createTask(title: dto.title, point: dto.point);

                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('タスクを作成しました'),
                  ),
                );
              } catch (e) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('タスクを作成に失敗しました'),
                  ),
                );
              }
            },
          ),
          const Divider(),
          Expanded(child: TaskList(tasks: taskStubList)),
        ],
      ),
    );
  }
}