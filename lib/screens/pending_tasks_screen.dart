import 'package:flutter/material.dart';

import '../blocs/bloc_exports.dart';
import '../models/tasks_model.dart';
import '../widgets/task_list_builder.dart';

class PendingTasksScreen extends StatelessWidget {
  const PendingTasksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TasksBloc, TasksState>(
      builder: (context, state) {
        List<TaskModel> tasksList = state.pendingTasks;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Chip(
                label: tasksList.length > 1
                    ? Text(
                        '${tasksList.length} tasks are pending',
                      )
                    : Text(
                        '${tasksList.length} task is pending',
                      ),
              ),
            ),
            TasksListBuilder(tasksList: tasksList)
          ],
        );
      },
    );
  }
}
