// ignore_for_file: public_member_api_docs, sort_constructors_first

part of 'tasks_bloc.dart';

class TasksState extends Equatable {
  final List<Task> pendingTasks;
  final List<Task> completeTasks;
  final List<Task> removeTasks;
  const TasksState({
    this.pendingTasks= const <Task> [],
    this.completeTasks= const <Task> [],
    this.removeTasks = const <Task> [],
  });
  
  @override
  List<Object> get props => [pendingTasks];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'pendingTask': pendingTasks.map((x) => x.toMap()).toList(),
      'completeTask': completeTasks.map((x) => x.toMap()).toList(),
      'removeTasks': removeTasks.map((x) => x.toMap()).toList(),
    };
  }

  factory TasksState.fromMap(Map<String, dynamic> map) {
    return TasksState(
      pendingTasks: List<Task>.from((map['pendingTasks'] as List<int>).map<Task>((x) => Task.fromMap(x as Map<String,dynamic>),),),
      completeTasks: List<Task>.from((map['completeTasks'] as List<int>).map<Task>((x) => Task.fromMap(x as Map<String,dynamic>),),),
      removeTasks: List<Task>.from((map['removeTasks'] as List<int>).map<Task>((x) => Task.fromMap(x as Map<String,dynamic>),),),
    );
  }


}

