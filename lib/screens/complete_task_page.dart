import 'package:flutter/material.dart';
import 'package:wepsysproject_task_managment_app/models/task.dart';
import 'package:wepsysproject_task_managment_app/screens/drawer.dart';

import 'package:wepsysproject_task_managment_app/widgets/list_task_widget.dart';

import '../blocs/bloc_exports.dart';

class CompleteTasksScreen extends StatelessWidget {
   const CompleteTasksScreen({super.key});
   static const id = 'tasks_page';

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TasksBloc, TasksState>(
      builder: (context, state) {
        List<Task> taskList = state.completeTasks;
        return Scaffold(
          drawer: MyDrawer(),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
               Center(
                child: Chip(
                  label: Text(
                    '${taskList.length}: Tasks',
                  ),
                ),
              ),
              TaskList(taskList: taskList)
            ],
          ),
          
        );
      },
    );
  }
}

