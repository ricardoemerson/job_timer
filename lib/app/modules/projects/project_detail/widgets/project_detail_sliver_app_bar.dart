import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../../../../core/theme/theme.dart';
import '../../../../data/enums/project_status_enum.dart';
import '../../../../data/models/project_model.dart';
import '../project_detail_cubit.dart';

class ProjectDetailSliverAppBar extends SliverAppBar {
  final ProjectModel? project;

  ProjectDetailSliverAppBar({
    super.key,
    required this.project,
  }) : super(
          title: Text(
            project?.name ?? '',
            style: AppTextStyles.instance.textBold,
            overflow: TextOverflow.ellipsis,
          ),
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
                            Text(
                              '${project?.tasks.length ?? 0} tarefas',
                              style: AppTextStyles.instance.textMedium,
                            ),
                            SliverVisibility(
                              visible: project?.status != ProjectStatusEnum.finalizado,
                              replacementSliver: Text(
                                'Projeto finalizado',
                                style: AppTextStyles.instance.textMedium,
                              ),
                              sliver: TextButton.icon(
                                onPressed: () async {
                                  await Modular.to.pushNamed(
                                    '/projects/project-task-register',
                                    arguments: project,
                                  );

                                  Modular.get<ProjectDetailCubit>().updateProject();
                                },
                                icon: PhosphorIcon(
                                  PhosphorIcons.fill.plusCircle,
                                  color: AppColors.instance.primary,
                                ),
                                label: const Text('Adicionar tarefa'),
                              ),
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
