import 'dart:developer';

import 'package:bloc/bloc.dart';

import '../../../core/exceptions/repository_exception.dart';
import '../../../data/models/project_model.dart';
import '../../../data/models/project_task_model.dart';
import '../../../data/services/project/i_project_service.dart';
import 'project_task_register_state.dart';

class ProjectTaskRegisterCubit extends Cubit<ProjectTaskRegisterState> {
  final IProjectService _projectService;

  late final ProjectModel? _project;

  ProjectTaskRegisterCubit({
    required IProjectService projectService,
  })  : _projectService = projectService,
        super(const ProjectTaskRegisterState.initial());

  void setProject(ProjectModel project) => _project = project;

  Future<void> register(String name, int duration) async {
    try {
      emit(state.copyWith(status: ProjectTaskRegisterStatus.loading));

      final projectTask = ProjectTaskModel(
        name: name,
        duration: duration,
      );

      await _projectService.addTask(_project!.id!, projectTask);

      emit(state.copyWith(status: ProjectTaskRegisterStatus.success));
    } on RepositoryException catch (err, s) {
      const message = 'Erro ao salvar tarefa.';

      log(message, error: err, stackTrace: s);

      emit(state.copyWith(status: ProjectTaskRegisterStatus.error, errorMessage: message));
    }
  }
}
