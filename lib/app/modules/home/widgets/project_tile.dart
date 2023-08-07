import 'package:flutter/material.dart';

import '../../../data/models/project_model.dart';
import 'project_name.dart';
import 'project_progress.dart';

class ProjectTile extends StatelessWidget {
  final ProjectModel project;

  const ProjectTile({
    super.key,
    required this.project,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxHeight: 90),
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: Colors.grey[300]!,
        ),
      ),
      child: Column(
        children: [
          ProjectName(project: project),
          Expanded(
            child: ProjectProgress(project: project),
          ),
        ],
      ),
    );
  }
}
