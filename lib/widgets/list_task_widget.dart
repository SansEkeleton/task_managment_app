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
      child: SingleChildScrollView(
        child: ExpansionPanelList.radio(
          children: taskList.map((task)=> ExpansionPanelRadio(
            value: task.id, 
            headerBuilder: (context, isOpen) => TaskTile(task: task), 
            body:ListTile(
              title: SelectableText.rich(
                TextSpan(
                  children: [TextSpan(
                    text: 'text\n',
                    style: TextStyle(
                      fontWeight: FontWeight.bold
                      ) 
                    ),
                    TextSpan(text: task.title),
                    TextSpan(
                    text: '\n\ndescription\n',
                    style: TextStyle(
                      fontWeight: FontWeight.bold
                      ) 
                    ),
                    TextSpan(text: task.description)
                    ]
                  )
                ),
            )
            )
          ).toList(),
        ),
      ),
    );
  }
}

/*Expanded(
      child: ListView.builder(
        itemCount: taskList.length,
        itemBuilder: (context, index){
          var task = taskList[index]; 
          return TaskTile(task: task);
        }),
    );*/