import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../../../core/base_state/base_state.dart';
import '../../../data/models/project_model.dart';
import 'project_detail_cubit.dart';
import 'widgets/project_detail_sliver_app_bar.dart';
import 'widgets/project_pie_chart.dart';
import 'widgets/project_task_tile.dart';

class ProjectDetailPage extends StatefulWidget {
  const ProjectDetailPage({super.key});

  @override
  State<ProjectDetailPage> createState() => _ProjectDetailPageState();
}

class _ProjectDetailPageState extends BaseState<ProjectDetailPage, ProjectDetailCubit> {
  ProjectModel? project;

  @override
  void onReady() {
    super.onReady();

    project = Modular.args.data as ProjectModel;
    log('project: $project');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          ProjectDetailSliverAppBar(project: project!),
          SliverList(
            delegate: SliverChildListDelegate([
              const SizedBox(height: 50),
              const ProjectPieChart(),
              const SizedBox(height: 30),
              const ProjectTaskTile(),
              const ProjectTaskTile(),
              const ProjectTaskTile(),
              const ProjectTaskTile(),
              const ProjectTaskTile(),
            ]),
          ),
          SliverFillRemaining(
            hasScrollBody: false,
            child: Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: ElevatedButton.icon(
                  onPressed: () {},
                  icon: PhosphorIcon(PhosphorIcons.regular.checkCircle),
                  label: const Text('Finalizar projeto'),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
