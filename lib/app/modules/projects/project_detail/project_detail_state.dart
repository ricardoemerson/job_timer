import 'package:equatable/equatable.dart';
import 'package:match/match.dart';

import '../../../data/models/project_model.dart';

part 'project_detail_state.g.dart';

@match
enum ProjectDetailStatus { initial, loading, success, error }

class ProjectDetailState extends Equatable {
  final ProjectDetailStatus status;
  final ProjectModel? project;
  final String? errorMessage;

  const ProjectDetailState(
    this.status,
    this.project,
    this.errorMessage,
  );

  const ProjectDetailState.initial()
      : status = ProjectDetailStatus.initial,
        project = null,
        errorMessage = null;

  ProjectDetailState copyWith({
    ProjectDetailStatus? status,
    ProjectModel? project,
    String? errorMessage,
  }) {
    return ProjectDetailState(
      status ?? this.status,
      project ?? this.project,
      errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [status, project, errorMessage];

  @override
  String toString() =>
      'ProjectDetailState(status: $status, project: $project, errorMessage: $errorMessage)';
}
