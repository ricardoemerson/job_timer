import 'dart:developer';

import 'package:bloc/bloc.dart';

import '../../core/exceptions/repository_exception.dart';
import '../../data/enums/project_status_enum.dart';
import '../../data/services/auth/i_auth_service.dart';
import '../../data/services/project/i_project_service.dart';
import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final IAuthService _authService;
  final IProjectService _projectService;

  HomeCubit({
    required IAuthService authService,
    required IProjectService projectService,
  })  : _authService = authService,
        _projectService = projectService,
        super(HomeState.initial());

  Future<void> loadProjects() async {
    try {
      emit(state.copyWith(status: HomeStatus.loading));

      final projects = await _projectService.findByStatus(state.filter);

      emit(state.copyWith(status: HomeStatus.success, projects: projects));
    } on RepositoryException catch (err, s) {
      final message = err.message ?? 'Erro ao buscar projetos.';

      log(message, error: err, stackTrace: s);

      emit(state.copyWith(status: HomeStatus.error, errorMessage: message));
    }
  }

  Future<void> filter(ProjectStatusEnum status) async {
    try {
      emit(state.copyWith(status: HomeStatus.loading, projects: []));

      final projects = await _projectService.findByStatus(status);

      emit(state.copyWith(status: HomeStatus.success, projects: projects, filter: status));
    } on RepositoryException catch (err, s) {
      final message = err.message ?? 'Erro ao filtrar projetos.';

      log(message, error: err, stackTrace: s);

      emit(state.copyWith(status: HomeStatus.error, errorMessage: message));
    }
  }

  Future<void> signOut() async {
    await _authService.signOut();
  }
}
