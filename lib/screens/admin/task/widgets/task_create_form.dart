import 'package:dekitane/dto/task_create_dto.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'task_input_row.dart';
import '../../../../validators/task_validator.dart';

class TaskCreateForm extends StatefulWidget {
  const TaskCreateForm({super.key});

  @override
  State<TaskCreateForm> createState() => _TaskCreateFormState();
}

class _TaskCreateFormState extends State<TaskCreateForm> {
  final _formKey = GlobalKey<FormState>();
  final titleController = TextEditingController();
  final pointController = TextEditingController();

  @override
  void dispose() {
    titleController.dispose();
    pointController.dispose();
    super.dispose();
  }

  void _submit() {
    final isValid = _formKey.currentState!.validate();
    if (!isValid) return;

    final dto = TaskCreateDto(
        title: titleController.text, point: int.parse(pointController.text));

    //TODO API通信
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const ListTile(
                contentPadding: EdgeInsets.zero,
                title: Text(
                  '新しいタスクを追加する',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 12),
              TaskInputRow(
                label: 'タスク名',
                controller: titleController,
                validator: TaskValidator.title,
                fieldKey: const ValueKey('titleField'),
              ),
              const SizedBox(height: 8),
              TaskInputRow(
                label: '付与ポイント',
                controller: pointController,
                isNumber: true,
                validator: TaskValidator.point,
                fieldKey: const ValueKey('pointField'),
              ),
              const SizedBox(height: 16),
              Align(
                alignment: Alignment.center,
                child: ElevatedButton(
                  onPressed: _submit,
                  child: const Text('タスク追加'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
