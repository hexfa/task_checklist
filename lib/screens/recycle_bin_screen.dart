import 'package:flutter/material.dart';
import 'package:todo_bloc/blocs/bloc_exports.dart';
import 'package:todo_bloc/models/tasks_model.dart';

import '../widgets/task_list_builder.dart';
import 'drawer_screen.dart';

class RecycleBinScreen extends StatelessWidget {
  const RecycleBinScreen({super.key});
  static const routeName = '/recycle-bin-screen';

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TasksBloc, TasksState>(
      builder: (context, state) {
        List<TaskModel> removedTasks = state.removedTasks;
        return Scaffold(
          appBar: AppBar(
            title: const Text('Recycle Bin is here'),
            actions: [
              IconButton(
                onPressed: () {
                  context.read<TasksBloc>().add(
                        DeleteAllTasks(deletedTasks: removedTasks),
                      );
                },
                icon: removedTasks.isNotEmpty
                    ? const Icon(Icons.delete_rounded)
                    : const Icon(Icons.delete_outline_rounded),
              ),
            ],
          ),
          drawer: const DrawerScreen(),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Chip(
                  label: removedTasks.length > 1
                      ? Text(
                          '${removedTasks.length} tasks has been removed',
                        )
                      : Text(
                          '${removedTasks.length} task has been removed',
                        ),
                ),
              ),
              TasksListBuilder(
                tasksList: removedTasks,
              )
            ],
          ),
        );
      },
    );
  }
}
