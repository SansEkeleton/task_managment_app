import 'package:flutter/material.dart';
import 'package:wepsysproject_task_managment_app/services/guid_gen.dart';

import '../blocs/bloc_exports.dart';
import '../models/task.dart';

class AddTaskScreen extends StatelessWidget {
  const AddTaskScreen({
    super.key,
  });
  
  @override
  Widget build(BuildContext context) {
    TextEditingController titleController = TextEditingController();
    return Container(
      
      padding: const EdgeInsets.all(20),
      child: Column(children: [
        const Text('Add Task', style: TextStyle(fontSize: 24),),
        const SizedBox(height: 10,),
        TextField(
          autofocus: true,
          controller: titleController,
          decoration: const InputDecoration(
            label: Text('title'),
            border: OutlineInputBorder()
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextButton(onPressed: () => Navigator.pop(context), 
            child: const Text('cancel')),

            ElevatedButton(onPressed: (){
            var task = Task(title: titleController.text,
            id: GUIDGen.generate());
            context.read<TasksBloc>().add(AddTask(task: task));
            Navigator.pop(context);
        }, 
        child: const Text('Add') )
          ],
        ),
       
      ],),
    );
  }
}
