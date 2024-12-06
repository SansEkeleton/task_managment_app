 import 'package:flutter/material.dart';
import 'package:wepsysproject_task_managment_app/screens/recycle_bin.dart';
import 'package:wepsysproject_task_managment_app/screens/tabs_page.dart';
import 'package:wepsysproject_task_managment_app/screens/pending_tasks_page.dart';
 
 
 class AppRouter{
    Route? onGenerateRoute(RouteSettings routeSettings){
      switch (routeSettings.name){
        case RecycleBin.id:
          return MaterialPageRoute(builder: (_)=> RecycleBin());
        case PendingTasksScreen.id:
          return MaterialPageRoute(builder: (_)=>PendingTasksScreen());
        case TabsPage.id:
          return MaterialPageRoute(builder: (_)=>TabsPage());
        default:
          return null;
      }
    }
 }