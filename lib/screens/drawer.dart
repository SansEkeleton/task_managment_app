import 'package:flutter/material.dart';
import 'package:wepsysproject_task_managment_app/screens/recycle_bin.dart';
import 'package:wepsysproject_task_managment_app/screens/tabs_page.dart';

import '../blocs/bloc_exports.dart';

// ignore: must_be_immutable
class MyDrawer extends StatelessWidget {
   MyDrawer({super.key});

  bool switchValue = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              color: Colors.grey,
              child: Text(
                'Task Drawer',
                style: Theme.of(context).textTheme.headlineLarge,
              ),
            ),
            BlocBuilder<TasksBloc, TasksState>(
              builder: (context, state) {
                return BlocBuilder<TasksBloc, TasksState>(
                  builder: (context, state) {
                    return GestureDetector(
                      onTap: () => Navigator.of(context)
                          .pushReplacementNamed(TabsPage.id),
                      child: ListTile(
                        leading: Icon(Icons.folder_special),
                        title: Text('My Tasks'),
                        trailing: Text('${state.pendingTasks.length} | ${state.completeTasks.length}'),
                      ),
                    );
                  },
                );
              },
            ),
            const Divider(),
            BlocBuilder<TasksBloc, TasksState>(
              builder: (context, state) {
                return GestureDetector(
                  onTap: () =>
                      Navigator.of(context).pushReplacementNamed(RecycleBin.id),
                  child: ListTile(
                    leading: Icon(Icons.delete),
                    title: Text('Bin'),
                    trailing: Text('${state.removeTasks.length}'),
                  ),
                );
              },
            ),
            BlocBuilder<SwitchBloc, SwitchState>(
              builder: (context, state) {
                return Switch(
                    value: switchValue,
                    onChanged: (newValue) {
                      newValue? context.read<SwitchBloc>().add(SwitchOnEvent())
                      : context.read<SwitchBloc>().add(SwitchOffEvent());
                    });
              },
            )
          ],
        ),
      ),
    );
  }
}
