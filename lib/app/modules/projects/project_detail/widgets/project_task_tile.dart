import 'package:flutter/material.dart';

import '../../../../core/extensions/app_text_styles_extension.dart';
import '../../../../data/models/project_task_model.dart';

class ProjectTaskTile extends StatelessWidget {
  final ProjectTaskModel projectTask;

  const ProjectTaskTile({
    super.key,
    required this.projectTask,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Text(
                  projectTask.name,
                  style: context.textStyles.textRegular,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Text.rich(
                TextSpan(
                  style: context.textStyles.textRegular,
                  children: [
                    TextSpan(
                      text: 'Duração',
                      style: context.textStyles.textRegular.copyWith(color: Colors.grey),
                    ),
                    const TextSpan(text: '  '),
                    TextSpan(
                      text: '${projectTask.duration}h',
                      style: context.textStyles.textBold,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
