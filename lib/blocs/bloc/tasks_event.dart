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
