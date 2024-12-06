import 'package:flutter/material.dart';

import '../models/task.dart';

class PopupMenu extends StatelessWidget {

  final Task task;
  final VoidCallback cancelOrDeleteCallBack;
  final VoidCallback likeOrDislike;
  final VoidCallback editTask;


  const PopupMenu({
    super.key, 
    required this.cancelOrDeleteCallBack,
    required this.task, 
    required this.likeOrDislike, 
    required this.editTask,
  });

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(itemBuilder: task.isDeleted == false ? ((context) => [
      PopupMenuItem(
        onTap: null,
        child: TextButton.icon(
          onPressed: editTask, 
          icon: const Icon(Icons.edit),
          label: const Text('edit'),
          ),
        ),
      PopupMenuItem(
        onTap: likeOrDislike,
        child: TextButton.icon(
          onPressed: null, 
          icon: task.isFavorite == false ? Icon(Icons.bookmark_add_outlined)
          : const Icon(Icons.bookmark_remove),
          label: task.isFavorite == false? Text('Add to bookmarks')
          : Text('Remove from Bookmarks') ,
          ),
        ),
      PopupMenuItem(
        onTap: cancelOrDeleteCallBack,
        child: TextButton.icon(
          onPressed: null, 
          icon:  Icon(Icons.delete),
          label:  Text('delete'),
          )
        )
    ]): (context) => [
      PopupMenuItem(
        onTap: (){},
        child: TextButton.icon(
          onPressed: null, 
          icon:  Icon(Icons.restore),
          label:  Text('Restore'),
          )
        ),
        PopupMenuItem(
        onTap: cancelOrDeleteCallBack,
        child: TextButton.icon(
          onPressed: null, 
          icon:  Icon(Icons.delete),
          label:  Text('delete Forever'),
          )
        )

      ]

    
    ); 
  
  }
}