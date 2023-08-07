import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../../../data/models/project_model.dart';

class ProjectName extends StatelessWidget {
  final ProjectModel project;

  const ProjectName({
    super.key,
    required this.project,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            project.name,
            style: const TextStyle(
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(
            height: 24,
            child: IconButton(
              onPressed: () {},
              iconSize: 20,
              padding: const EdgeInsets.all(8),
              visualDensity: VisualDensity.compact,
              icon: PhosphorIcon(
                PhosphorIcons.bold.caretDoubleRight,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
