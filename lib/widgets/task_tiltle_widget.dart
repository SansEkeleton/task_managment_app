import 'package:flutter/material.dart';
import 'package:wepsysproject_task_managment_app/models/task.dart';

import '../blocs/bloc_exports.dart';

class TaskTile extends StatelessWidget {
  const TaskTile({
    super.key,
    required this.task,
  });

  final Task task;

  void _onRemoveOrDeleteTask(BuildContext context, Task task){
    task.isDeleted!
    ? context.read<TasksBloc>().add(DeleteTask(task: task))
    : context.read<TasksBloc>().add(RemoveTasks(task: task));
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(task.title, style: TextStyle(decoration: task.isDone! ? TextDecoration.lineThrough : null),),
      trailing: Checkbox(value: task.isDone, 
      onChanged: task.isDeleted == false ? (value){
        context.read<TasksBloc>().add(UpdateTask(task: task));
      }: null, ),
      onLongPress: () => _onRemoveOrDeleteTask(context, task),
    );
  }
}