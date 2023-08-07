import 'package:flutter/material.dart';

import '../../../data/models/project_model.dart';

class ProjectProgress extends StatelessWidget {
  final ProjectModel project;

  const ProjectProgress({
    super.key,
    required this.project,
  });

  @override
  Widget build(BuildContext context) {
    final totalTasks =
        project.tasks.fold<int>(0, (previousValue, task) => previousValue += task.duration);

    var percent = 0.0;

    if (totalTasks > 0) {
      percent = totalTasks / project.estimate;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: const BorderRadius.vertical(
          bottom: Radius.circular(10),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: LinearProgressIndicator(
              backgroundColor: Colors.grey[400],
              value: percent,
            ),
          ),
          const SizedBox(width: 10),
          Text('${project.estimate}h'),
        ],
      ),
    );
  }
}
