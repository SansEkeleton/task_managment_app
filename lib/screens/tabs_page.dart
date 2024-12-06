import 'package:flutter/material.dart';
import 'package:wepsysproject_task_managment_app/screens/complete_task_page.dart';
import 'package:wepsysproject_task_managment_app/screens/drawer.dart';
import 'package:wepsysproject_task_managment_app/screens/pending_tasks_page.dart';

import '../widgets/add_task_screen_widget.dart';

class TabsPage extends StatefulWidget {
  const TabsPage({super.key});
  static const id = 'tabs_screen';

  @override
  State<TabsPage> createState() => _TabsPageState();
}

class _TabsPageState extends State<TabsPage> {
  final List<Map<String, dynamic>> _pageDetail = [
    {'pageName' : PendingTasksScreen(), 'title': 'Pending Task'},
    {'pageName' : CompleteTasksScreen(), 'title': 'Complete Task'},
  ];

  var _selectedPageIndex = 0;

  void _addTask(BuildContext context){
    showModalBottomSheet(
      context: context, 
      isScrollControlled: true,
      builder: (context) => SingleChildScrollView(
        child: Container(padding: EdgeInsets.only(bottom: 
        MediaQuery.of(context).viewInsets.bottom),
        child: const AddTaskScreen(),
        ),
        
      ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(_pageDetail[_selectedPageIndex]['title']),
      actions: [
              IconButton(
                onPressed: ()=> _addTask(context),
                icon: const Icon(Icons.add),
              )
            ],
          ),
          drawer: MyDrawer(),
          body: _pageDetail[_selectedPageIndex]['pageName'],
          floatingActionButton: _selectedPageIndex == 0 ? FloatingActionButton(
            onPressed: ()=> _addTask(context),
            tooltip: 'Add Task',
            child: const Icon(Icons.add),
          ): null,
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: _selectedPageIndex, 
            onTap: (index) {
              setState(() {
                _selectedPageIndex = index;
              });
            },
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.incomplete_circle_sharp),
                label: 'Pending Task'
            ),
              BottomNavigationBarItem(
                icon: Icon(Icons.check),
                label: 'Complete Tasks'
            )
          ],
        ),
    );
  }
}