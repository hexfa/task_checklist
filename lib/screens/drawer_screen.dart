import 'package:flutter/material.dart';
import 'package:todo_bloc/blocs/bloc_exports.dart';
import 'package:todo_bloc/models/tasks_model.dart';
import 'package:todo_bloc/screens/tab_screen.dart';

import '../screens/recycle_bin_screen.dart';

class DrawerScreen extends StatelessWidget {
  const DrawerScreen({super.key});

  final switchValue = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 15,
              ),
              decoration: const BoxDecoration(
                color: Colors.grey,
              ),
              child: Text(
                'Task Drawer',
                style: Theme.of(context).textTheme.headline4,
                textAlign: TextAlign.center,
              ),
            ),
            BlocBuilder<TasksBloc, TasksState>(
              builder: (context, state) {
                List<TaskModel> tasksList = state.pendingTasks;
                return ListTile(
                  onTap: () => Navigator.of(context)
                      .pushReplacementNamed(TabScreen.routeName),
                  leading: const Icon(Icons.folder_special_rounded),
                  trailing: Text(tasksList.length.toString()),
                  title: const Text('My Tasks List'),
                );
              },
            ),
            const Divider(),
            BlocBuilder<TasksBloc, TasksState>(
              builder: (context, state) {
                List<TaskModel> removedList = state.removedTasks;
                return ListTile(
                  onTap: () => Navigator.of(context)
                      .pushReplacementNamed(RecycleBinScreen.routeName),
                  leading: const Icon(Icons.folder_delete_outlined),
                  trailing: Text(removedList.length.toString()),
                  title: const Text('Recycle Bin'),
                );
              },
            ),
            BlocBuilder<SwitchBloc, SwitchState>(
              builder: (context, state) {
                return Switch(
                  value: state.switchValue,
                  onChanged: (newValue) {
                    newValue
                        ? context.read<SwitchBloc>().add(SwitchOnEvent())
                        : context.read<SwitchBloc>().add(SwitchOffEvent());
                  },
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
