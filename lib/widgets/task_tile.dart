import 'package:flutter/material.dart';
import 'package:intl/intl.dart' as intl;
import 'package:todo_bloc/screens/edit_task_screen.dart';

import '../blocs/bloc_exports.dart';
import '../models/tasks_model.dart';
import 'my_popup_menu.dart';

class TaskTile extends StatelessWidget {
  const TaskTile({
    Key? key,
    required this.task,
  }) : super(key: key);

  final TaskModel task;

  void _removeOrDeleteTask(BuildContext ctx, TaskModel taskModel) {
    if (taskModel.isDelete!) {
      return ctx.read<TasksBloc>().add(DeleteTask(task: taskModel));
    } else {
      return ctx.read<TasksBloc>().add(RemoveTask(task: taskModel));
    }
  }

  void _editTask(BuildContext context, TaskModel task) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => SingleChildScrollView(
        child: Container(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: EditTaskScreen(oldTask: task),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var listTile = ListTile(
      title: Text(
        task.title,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          decoration: task.isDone! ? TextDecoration.lineThrough : null,
          color: task.isDone! ? Colors.grey : Colors.black,
        ),
      ),
      trailing: task.isDelete!
          ? IconButton(
              onPressed: () {
                context.read<TasksBloc>().add(RecycleTask(recycleTask: task));
              },
              icon: const Icon(Icons.refresh),
            )
          : Checkbox(
              value: task.isDone,
              onChanged: (value) {
                context.read<TasksBloc>().add(UpdateTask(task: task));
              },
            ),
      subtitle: Text(
        intl.DateFormat()
            .add_yMEd()
            .add_Hms()
            .format(DateTime.parse(task.date)),
      ),
      leading: MyPopupMenu(
        task: task,
        cancelOrDeleteCallback: () => _removeOrDeleteTask(context, task),
        likeOrDislikeCallback: () =>
            context.read<TasksBloc>().add(FavoriteTask(favoriteTask: task)),
        editTaskCallback: () {
          Navigator.of(context).pop();
          _editTask(context, task);
        },
        restoreTaskCallback: () =>
            context.read<TasksBloc>().add(RecycleTask(recycleTask: task)),
      ),
      // onLongPress: () => _removeOrDeleteTask(context, task),
    );
    return listTile;
  }
}
