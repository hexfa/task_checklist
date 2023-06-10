part of 'tasks_bloc.dart';

@immutable
abstract class TasksEvent extends Equatable {
  const TasksEvent();

  @override
  List<Object> get props => [];
}

@immutable
class AddTask extends TasksEvent {
  final TaskModel task;
  const AddTask({required this.task});

  @override
  List<Object> get props => [task];
}

@immutable
class UpdateTask extends TasksEvent {
  final TaskModel task;
  const UpdateTask({required this.task});

  @override
  List<Object> get props => [task];
}

@immutable
class DeleteTask extends TasksEvent {
  final TaskModel task;
  const DeleteTask({required this.task});

  @override
  List<Object> get props => [task];
}

@immutable
class DeleteAllTasks extends TasksEvent {
  final List<TaskModel> deletedTasks;
  const DeleteAllTasks({required this.deletedTasks});

  @override
  List<Object> get props => [deletedTasks];
}

@immutable
class RecycleTask extends TasksEvent {
  final TaskModel recycleTask;
  const RecycleTask({required this.recycleTask});

  @override
  List<Object> get props => [recycleTask];
}

@immutable
class RemoveTask extends TasksEvent {
  final TaskModel task;
  const RemoveTask({required this.task});

  @override
  List<Object> get props => [task];
}

@immutable
class FavoriteTask extends TasksEvent {
  final TaskModel favoriteTask;
  const FavoriteTask({required this.favoriteTask});

  @override
  List<Object> get props => [favoriteTask];
}

@immutable
class EditTask extends TasksEvent {
  final TaskModel oldTask;
  final TaskModel newTask;

  const EditTask({
    required this.oldTask,
    required this.newTask,
  });

  @override
  List<Object> get props => [
        oldTask,
        newTask,
      ];
}
