import 'dart:developer';

import 'package:bloc/bloc.dart';

import '../../../core/exceptions/repository_exception.dart';
import '../../../data/enums/project_status_enum.dart';
import '../../../data/models/project_model.dart';
import '../../../data/services/project/i_project_service.dart';
import 'project_register_state.dart';

class ProjectRegisterCubit extends Cubit<ProjectRegisterState> {
  final IProjectService _projectService;

  ProjectRegisterCubit({
    required IProjectService projectService,
  })  : _projectService = projectService,
        super(const ProjectRegisterState.initial());

  Future<void> register(String name, int estimate) async {
    try {
      emit(state.copyWith(status: ProjectRegisterStatus.loading));

      final project = ProjectModel(
        name: name,
        estimate: estimate,
        status: ProjectStatusEnum.em_andamento,
        tasks: [],
      );

      await _projectService.register(project);

      emit(state.copyWith(status: ProjectRegisterStatus.success));
    } on RepositoryException catch (err, s) {
      const message = 'Erro ao salvar projeto.';

      log(message, error: err, stackTrace: s);

      emit(state.copyWith(status: ProjectRegisterStatus.error, errorMessage: message));
    }
  }
}
