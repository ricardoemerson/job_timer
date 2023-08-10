import 'package:bloc/bloc.dart';

import '../../../data/models/project_model.dart';
import '../../../data/services/project/i_project_service.dart';
import 'project_detail_state.dart';

class ProjectDetailCubit extends Cubit<ProjectDetailState> {
  final IProjectService _projectService;

  ProjectDetailCubit({
    required IProjectService projectService,
  })  : _projectService = projectService,
        super(const ProjectDetailState.initial());

  void setProject(ProjectModel project) {
    emit(state.copyWith(status: ProjectDetailStatus.success, project: project));
  }

  Future<void> updateProject() async {
    final project = await _projectService.findById(state.project!.id!);

    emit(state.copyWith(project: project));
  }
}
