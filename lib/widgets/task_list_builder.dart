import 'package:flutter/material.dart';

import '../models/tasks_model.dart';
import 'task_tile.dart';

class TasksListBuilder extends StatelessWidget {
  const TasksListBuilder({
    Key? key,
    required this.tasksList,
  }) : super(key: key);

  final List<TaskModel> tasksList;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: ExpansionPanelList.radio(
          children: tasksList
              .map(
                (e) => ExpansionPanelRadio(
                  value: e.id,
                  headerBuilder: (context, isExpanded) => TaskTile(task: e),
                  body: ListTile(
                    title: SelectableText.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: e.title,
                          ),
                          const TextSpan(text: '\n\nDescription:\n'),
                          TextSpan(
                            text: e.description,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}


// Expanded(
//       child: ListView.builder(
//         itemCount: tasksList.length,
//         itemBuilder: (context, index) {
//           var task = tasksList[index];
//           return TaskTile(task: task);
//         },
//       ),
//     );