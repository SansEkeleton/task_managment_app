// ignore: depend_on_referenced_packages
import 'package:equatable/equatable.dart';
import 'package:wepsysproject_task_managment_app/blocs/bloc_exports.dart';
import 'package:wepsysproject_task_managment_app/models/task.dart';

part 'tasks_event.dart';
part 'tasks_state.dart';

class TasksBloc extends HydratedBloc<TasksEvent, TasksState> {
  TasksBloc() : super(const TasksState()) {
    on<AddTask>(_onAddTask);
    on<UpdateTask>(_onUpdateTask);
    on<DeleteTask>(_onDeleteTask);
    on<RemoveTasks>(_onRemoveTask);
    on<EditTask>(_onEditTask);
    on<MarkFavoriteOrUnfavoriteTask>(_onMarkFavoriteOrUnfavoriteTask);

  }

  void _onAddTask(AddTask event, Emitter<TasksState> emit) {
    final state = this.state;
    emit(TasksState(
      pendingTasks: List.from(state.pendingTasks)..add(event.task),
      completeTasks: state.completeTasks,
      removeTasks: state.removeTasks,
    ));
  }

  void _onUpdateTask(UpdateTask event, Emitter<TasksState> emit) {
    final state = this.state;
    final task = event.task;
  

    List<Task> pendingTasks  = state.pendingTasks;
    List<Task> completeTask  = state.completeTasks;
    task.isDeleted == false 
    ? {
      pendingTasks = List.from(pendingTasks)..remove(task),
       completeTask = List.from(completeTask)..insert(0, task.copyWith(isDone: true))
      }
    : {

      completeTask = List.from(completeTask)..remove(task),
      pendingTasks = List.from(pendingTasks)..insert(0, task.copyWith(isDone: false))
      
      };

    emit(TasksState(
      pendingTasks: pendingTasks, 
      completeTasks: completeTask, 
      removeTasks: state.removeTasks
    ));
  }

  void _onDeleteTask(DeleteTask event, Emitter<TasksState> emit) {
    final state = this.state;
    emit(TasksState(
      pendingTasks: state.pendingTasks,
      completeTasks: state.completeTasks,
      removeTasks: List.from(state.removeTasks)..remove(event.task)));
  }

  void _onRemoveTask(RemoveTasks event, Emitter<TasksState> emit) {
    final state = this.state;
    emit(TasksState(
      pendingTasks: List.from(state.pendingTasks)..remove(event.task),
      completeTasks: List.from(state.completeTasks)..remove(event.task),
      removeTasks: List.from(state.removeTasks)..add(event.task.copyWith(isDeleted: true))
    ));
  }

 void _onMarkFavoriteOrUnfavoriteTask(
    MarkFavoriteOrUnfavoriteTask event, Emitter<TasksState> emit) {
  final state = this.state;

  // Copias inmutables de las listas
  final pendingTasks = List<Task>.from(state.pendingTasks);
  final completeTasks = List<Task>.from(state.completeTasks);
  final favoriteTasks = List<Task>.from(state.favoriteTasks);

  // La tarea a modificar
  final task = event.task;

  // Determina si la tarea está completada o pendiente
  if (!task.isDone!) {
    // Si está en las tareas pendientes
    final taskIndex = pendingTasks.indexOf(task);
    if (taskIndex != -1) {
      // Marca como favorita o quita el favorito
      final updatedTask = task.copyWith(isFavorite: !task.isFavorite!);
      pendingTasks[taskIndex] = updatedTask;

      // Actualiza la lista de favoritos
      if (updatedTask.isFavorite!) {
        favoriteTasks.insert(0, updatedTask);
      } else {
        favoriteTasks.removeWhere((t) => t.id == task.id);
      }
    }
  } else {
    // Si está en las tareas completadas
    final taskIndex = completeTasks.indexOf(task);
    if (taskIndex != -1) {
      // Marca como favorita o quita el favorito
      final updatedTask = task.copyWith(isFavorite: !task.isFavorite!);
      completeTasks[taskIndex] = updatedTask;

      // Actualiza la lista de favoritos
      if (updatedTask.isFavorite!) {
        favoriteTasks.insert(0, updatedTask);
      } else {
        favoriteTasks.removeWhere((t) => t.id == task.id);
      }
    }
  }

  
  emit(
    TasksState(
      pendingTasks: pendingTasks,
      completeTasks: completeTasks,
      favoriteTasks: favoriteTasks,
      removeTasks: List<Task>.from(state.removeTasks),
    ),
  );
}

 void _onEditTask(EditTask event, Emitter<TasksState> emit) {
  final state = this.state;

  final pendingTasks = List<Task>.from(state.pendingTasks);
  final completeTasks = List<Task>.from(state.completeTasks);
  final favoriteTasks = List<Task>.from(state.favoriteTasks);

  pendingTasks.remove(event.oldTask);
  completeTasks.remove(event.oldTask);
  favoriteTasks.remove(event.oldTask);

  if (!event.newTask.isDone!) {
    pendingTasks.insert(0, event.newTask); 
  } else {
    completeTasks.insert(0, event.newTask); 
  }

  if (event.newTask.isFavorite!) {
    favoriteTasks.insert(0, event.newTask);
  }
  emit(
    TasksState(
      pendingTasks: pendingTasks,
      completeTasks: completeTasks,
      favoriteTasks: favoriteTasks,
      removeTasks: List.from(state.removeTasks),
    ),
  );
}
  
  @override
  TasksState? fromJson(Map<String, dynamic> json) {
    return TasksState.fromMap(json);
  }
  
  @override
  Map<String, dynamic>? toJson(TasksState state) {
   return state.toMap();
  }
}
