import 'dart:developer' show log;

import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart' show immutable;

import '../bloc_exports.dart';

import '../../models/tasks_model.dart';

part 'tasks_event.dart';
part 'tasks_state.dart';

class TasksBloc extends HydratedBloc<TasksEvent, TasksState> {
  TasksBloc()
      : super(
          const TasksState(),
        ) {
    on<AddTask>((event, emit) {
      log('run AddTask');
      emit(
        TasksState(
          allTasks: List.from(state.allTasks)..add(event.task),
        ),
      );
    });

    on<UpdateTask>(_onUpdateTask);

    on<DeleteTask>((event, emit) {
      log('run DELETE Task');
      emit(TasksState(allTasks: List.from(state.allTasks)..remove(event.task)));
    });
  }

  void _onUpdateTask(UpdateTask event, Emitter<TasksState> emit) {
    log('run UpdateTask');
    final state = this.state;
    final task = event.task;
    final int index = state.allTasks.indexOf(task);
    List<TaskModel> allTasks = List.from(state.allTasks)..remove(task);
    task.isDone == false
        ? allTasks.insert(index, task.copyWith(isDone: true))
        : allTasks.insert(index, task.copyWith(isDone: false));

    emit(TasksState(allTasks: allTasks));
  }

  @override
  TasksState? fromJson(Map<String, dynamic> json) {
    var myTaskState = TasksState.fromMap(json);

    return myTaskState;
  }

  @override
  Map<String, dynamic>? toJson(TasksState state) {
    var myTaskStateToJson = state.toMap();

    return myTaskStateToJson;
  }
}
