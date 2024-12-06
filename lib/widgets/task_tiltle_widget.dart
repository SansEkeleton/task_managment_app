import 'package:flutter/material.dart';
import 'package:wepsysproject_task_managment_app/models/task.dart';

import '../blocs/bloc_exports.dart';

class TaskTile extends StatelessWidget {
  const TaskTile({
    super.key,
    required this.task,
  });

  final Task task;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(task.title, style: TextStyle(decoration: task.isDone! ? TextDecoration.lineThrough : null),),
      trailing: Checkbox(value: task.isDone, onChanged: (value){
        context.read<TasksBloc>().add(UpdateTask(task: task));
      }, ),
      onLongPress: () => context.read<TasksBloc>()..add(DeleteTask(task: task)),
    );
  }
}