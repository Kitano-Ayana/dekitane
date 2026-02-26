import 'package:dekitane/dto/task_create_dto.dart';
import 'package:dekitane/usecase/create_task_usecase.dart';
import 'package:flutter/material.dart';
import '../../../data/task_stub.dart';
import 'widgets/task_create_form.dart';
import 'widgets/task_list.dart';

class TaskScreen extends StatelessWidget {
  final CreateTaskUseCase createTaskUseCase;

  const TaskScreen({
    super.key,
    required this.createTaskUseCase,
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
                await createTaskUseCase.execute(title: dto.title, point: dto.point);

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