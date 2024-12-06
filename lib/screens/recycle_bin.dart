import 'package:flutter/material.dart';
import 'package:wepsysproject_task_managment_app/screens/drawer.dart';

import '../blocs/bloc_exports.dart';
import '../widgets/list_task_widget.dart';

class RecycleBin extends StatelessWidget {
  const RecycleBin({super.key});
  static const id = 'RecycleBin_page';

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TasksBloc, TasksState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Recycle Bin'),
            actions: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.add),
              )
            ],
          ),
          drawer: MyDrawer(),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Chip(
                  label: Text(
                    ' ${state.removeTasks.length}: Tasks',
                  ),
                ),
              ),
              TaskList(taskList: state.removeTasks)
            ],
          ),
        );
      },
    );
  }
}
