import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:wepsysproject_task_managment_app/models/task.dart';
import 'package:wepsysproject_task_managment_app/screens/edit_task_page.dart';
import 'package:wepsysproject_task_managment_app/widgets/popup_menu_widget.dart';

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

  void _editTask(BuildContext context){
    showModalBottomSheet(
      context: context, 
      isScrollControlled: true,
      builder: (context) => SingleChildScrollView(
        child: Container(padding: EdgeInsets.only(bottom: 
        MediaQuery.of(context).viewInsets.bottom),
        child: EditTaskScreen(oldTask: task),
        ),
        
      ));
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Row(
              children: [
                task.isFavorite == false ? Icon(Icons.star_outline, size: 30,): Icon(Icons.star),
                SizedBox(width: 10,),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(task.title,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                decoration: 
                                  task.isDone! ? TextDecoration.lineThrough : null,
                                  fontSize: 18
                              ),
                            ),
                          Text(DateFormat().add_yMEd().format(DateTime.parse(task.date)))
                    ],
                  ),
                ),
              ],
            ),
          ),
          
          Row(
            children: [
              Checkbox(value: task.isDone, 
                onChanged: task.isDeleted == false ? (value){
                  context.read<TasksBloc>().add(UpdateTask(task: task));
                    }: null,),
            PopupMenu(
              task: task,
              cancelOrDeleteCallBack: ()=>
               _onRemoveOrDeleteTask(context, task),
               likeOrDislike: () => context.read<TasksBloc>().add(
                MarkFavoriteOrUnfavoriteTask(task: task)),
                editTask: (){
                  _editTask(context);
                },
               )
            ],
          ),
        ],
      ),
    );
  }
}



/*ListTile(
      title: Text(
        task.title, 
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          decoration: task.isDone! 
          ? TextDecoration.lineThrough 
          : null),),
      trailing: Checkbox(value: task.isDone, 
      onChanged: task.isDeleted == false ? (value){
        context.read<TasksBloc>().add(UpdateTask(task: task));
      }: null, ),
      onLongPress: () ,
    );*/