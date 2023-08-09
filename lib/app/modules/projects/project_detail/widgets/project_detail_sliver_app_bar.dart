import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../data/models/project_model.dart';

class ProjectDetailSliverAppBar extends SliverAppBar {
  final ProjectModel project;

  ProjectDetailSliverAppBar({
    super.key,
    required this.project,
  }) : super(
          title: Text(project.name),
          centerTitle: true,
          expandedHeight: 100,
          toolbarHeight: 100,
          pinned: true,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(16),
            ),
          ),
          flexibleSpace: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Align(
                  alignment: const Alignment(0, 1.6),
                  child: Material(
                    borderRadius: BorderRadius.circular(10),
                    elevation: 2,
                    child: Container(
                      height: 48,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('${project.tasks.length} tarefas'),
                            TextButton.icon(
                              onPressed: () {},
                              icon: PhosphorIcon(
                                PhosphorIcons.fill.plusCircle,
                                color: AppColors.instance.primary,
                              ),
                              label: const Text('Adicionar tarefa'),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        );
}
