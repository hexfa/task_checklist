import 'package:flutter/material.dart';

import '../blocs/bloc_exports.dart';
import '../models/tasks_model.dart';

class EditTaskScreen extends StatelessWidget {
  final TaskModel oldTask;
  const EditTaskScreen({
    Key? key,
    required this.oldTask,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController titleController =
        TextEditingController(text: oldTask.title);
    TextEditingController descriptionController =
        TextEditingController(text: oldTask.description);

    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        children: [
          const Text(
            'Edit Task',
            style: TextStyle(fontSize: 24),
          ),
          const SizedBox(
            height: 10,
          ),
          TextField(
            autofocus: true,
            controller: titleController,
            decoration: const InputDecoration(
              label: Text('Title'),
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          TextField(
            controller: descriptionController,
            minLines: 3,
            maxLines: 5,
            decoration: const InputDecoration(
              label: Text('Description'),
              border: OutlineInputBorder(),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('cancel'),
              ),
              ElevatedButton(
                onPressed: () {
                  var editedTask = TaskModel(
                    title: titleController.text,
                    description: descriptionController.text,
                    id: oldTask.id,
                    date: oldTask.date,
                    isFavorite: oldTask.isFavorite,
                    isDone: false,
                  );
                  context.read<TasksBloc>().add(
                        EditTask(
                          oldTask: oldTask,
                          newTask: editedTask,
                        ),
                      );
                  Navigator.pop(context);
                  titleController.clear();
                },
                child: const Text('SAVE'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
