import 'package:flutter/material.dart';
import 'package:wepsysproject_task_managment_app/models/task.dart';
import 'package:wepsysproject_task_managment_app/widgets/add_task_screen_widget.dart';

import 'package:wepsysproject_task_managment_app/widgets/list_task_widget.dart';

import '../blocs/bloc_exports.dart';

class TasksScreen extends StatefulWidget {
   const TasksScreen({super.key});

  @override
  State<TasksScreen> createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  void _addTask(BuildContext context){
    showModalBottomSheet(
      context: context, 
      builder: (context) => SingleChildScrollView(
        child: Container(padding: EdgeInsets.only(bottom: 
        MediaQuery.of(context).viewInsets.bottom),
        child: const AddTaskScreen(),
        ),
        
      ));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TasksBloc, TasksState>(
      builder: (context, state) {
        List<Task> taskList = state.allTasks;
        return Scaffold(
          appBar: AppBar(
            title: const Text('Tasks App'),
            actions: [
              IconButton(
                onPressed: ()=> _addTask(context),
                icon: const Icon(Icons.add),
              )
            ],
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
               Center(
                child: Chip(
                  label: Text(
                    '${state.allTasks.length}: Tasks',
                  ),
                ),
              ),
              TaskList(taskList: taskList)
            ],
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: ()=> _addTask(context),
            tooltip: 'Add Task',
            child: const Icon(Icons.add),
          ),
        );
      },
    );
  }
}

