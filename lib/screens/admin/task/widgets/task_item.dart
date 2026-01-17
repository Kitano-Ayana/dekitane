import 'package:flutter/material.dart';
import '../../../../models/task.dart';

class TaskItem extends StatelessWidget {
  final Task task;

  const TaskItem({
    super.key,
    required this.task,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(task.title),
      subtitle: Text('スタンプ： ${task.stampCount}'),
      trailing: IconButton(
        icon: const Icon(Icons.delete),
        onPressed: (){
          //TODO:処理あとで
        },
      ),
    );
  }
}
