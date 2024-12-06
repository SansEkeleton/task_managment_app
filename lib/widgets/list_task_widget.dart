import 'package:flutter/material.dart';
import 'package:wepsysproject_task_managment_app/models/task.dart';
import 'package:wepsysproject_task_managment_app/widgets/task_tiltle_widget.dart';


class TaskList extends StatelessWidget {
  const TaskList({
    super.key,
    required this.taskList,
  });

  final List<Task> taskList;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: taskList.length,
        itemBuilder: (context, index){
          var task = taskList[index]; 
          return TaskTile(task: task);
        }),
    );
  }
}

