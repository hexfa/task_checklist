part of 'tasks_bloc.dart';

@immutable
class TasksState extends Equatable {
  final List<TaskModel> pendingTasks;
  final List<TaskModel> completeTasks;
  final List<TaskModel> favoriteTasks;
  final List<TaskModel> removedTasks;
  const TasksState({
    this.pendingTasks = const <TaskModel>[],
    this.completeTasks = const <TaskModel>[],
    this.favoriteTasks = const <TaskModel>[],
    this.removedTasks = const <TaskModel>[],
  });

  // TasksState.empty() : allTasks = [];

  @override
  List<Object> get props => [
        pendingTasks,
        completeTasks,
        favoriteTasks,
        removedTasks,
      ];

  Map<String, dynamic> toMap() {
    var myTasksToMap = <String, dynamic>{
      'pendingTasks': pendingTasks.map((e) => e.toMap()).toList(),
      'completeTasks': completeTasks.map((e) => e.toMap()).toList(),
      'favoriteTasks': favoriteTasks.map((e) => e.toMap()).toList(),
      'removedTasks': removedTasks.map((e) => e.toMap()).toList(),
    };
    return myTasksToMap;
  }

  factory TasksState.fromMap(Map<String, dynamic> map) {
    var myTasks = TasksState(
      pendingTasks: (map['pendingTasks'])
          .map<TaskModel>(
            (x) => TaskModel.fromMap(x),
          )
          .toList(),
      completeTasks: (map['completeTasks'])
          .map<TaskModel>(
            (x) => TaskModel.fromMap(x),
          )
          .toList(),
      favoriteTasks: (map['favoriteTasks'])
          .map<TaskModel>(
            (x) => TaskModel.fromMap(x),
          )
          .toList(),
      removedTasks: (map['removedTasks'])
          .map<TaskModel>(
            (x) => TaskModel.fromMap(x),
          )
          .toList(),
    );
    return myTasks;
  }
}
