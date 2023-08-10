import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../../../core/base_state/base_state.dart';
import '../../../data/models/project_model.dart';
import 'project_detail_cubit.dart';
import 'project_detail_state.dart';
import 'widgets/project_detail_sliver_app_bar.dart';
import 'widgets/project_pie_chart.dart';
import 'widgets/project_task_tile.dart';

class ProjectDetailPage extends StatefulWidget {
  const ProjectDetailPage({super.key});

  @override
  State<ProjectDetailPage> createState() => _ProjectDetailPageState();
}

class _ProjectDetailPageState extends BaseState<ProjectDetailPage, ProjectDetailCubit> {
  @override
  void onReady() {
    super.onReady();

    final project = Modular.args.data as ProjectModel;
    cubit.setProject(project);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<ProjectDetailCubit, ProjectDetailState>(
        bloc: cubit,
        listener: (context, state) {
          state.status.matchAny(
            loading: () => showLoader(),
            error: () {
              hideLoader();
              showError(state.errorMessage ?? 'Erro não informado.');
            },
            any: () => hideLoader(),
          );
        },
        builder: (context, state) {
          final project = state.project;

          final totalTasksDuration = project?.tasks
              .fold<int>(0, (previousValue, element) => previousValue += element.duration);

          return CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: [
              ProjectDetailSliverAppBar(project: project),
              SliverList(
                delegate: SliverChildListDelegate([
                  const SizedBox(height: 50),
                  ProjectPieChart(
                    projectHoursEstimated: project?.estimate ?? 0,
                    hoursAccomplished: totalTasksDuration ?? 0,
                  ),
                  const SizedBox(height: 30),
                  ...project?.tasks.map((e) => ProjectTaskTile(projectTask: e)).toList() ?? [],
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
          );
        },
      ),
    );
  }
}
