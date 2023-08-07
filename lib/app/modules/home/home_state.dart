import 'package:equatable/equatable.dart';
import 'package:match/match.dart';

import '../../data/enums/project_status_enum.dart';
import '../../data/models/project_model.dart';

part 'home_state.g.dart';

@match
enum HomeStatus { initial, loading, success, error }

class HomeState extends Equatable {
  final HomeStatus status;
  final List<ProjectModel> projects;
  final ProjectStatusEnum filter;
  final String? errorMessage;

  const HomeState({
    required this.status,
    required this.projects,
    required this.filter,
    this.errorMessage,
  });

  HomeState.initial()
      : status = HomeStatus.initial,
        projects = <ProjectModel>[],
        filter = ProjectStatusEnum.em_andamento,
        errorMessage = null;

  HomeState copyWith({
    HomeStatus? status,
    List<ProjectModel>? projects,
    ProjectStatusEnum? filter,
    String? errorMessage,
  }) {
    return HomeState(
      status: status ?? this.status,
      projects: projects ?? this.projects,
      filter: filter ?? this.filter,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [status, projects, filter, errorMessage];

  @override
  String toString() {
    return 'HomeState(status: $status, projects: $projects, filter: $filter, errorMessage: $errorMessage)';
  }
}
