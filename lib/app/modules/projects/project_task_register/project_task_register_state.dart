import 'package:equatable/equatable.dart';
import 'package:match/match.dart';

part 'project_task_register_state.g.dart';

@match
enum ProjectTaskRegisterStatus { initial, loading, success, error }

class ProjectTaskRegisterState extends Equatable {
  final ProjectTaskRegisterStatus status;

  final String? errorMessage;

  const ProjectTaskRegisterState(
    this.status,
    this.errorMessage,
  );

  const ProjectTaskRegisterState.initial()
      : status = ProjectTaskRegisterStatus.initial,
        errorMessage = null;

  ProjectTaskRegisterState copyWith({
    ProjectTaskRegisterStatus? status,
    String? errorMessage,
  }) {
    return ProjectTaskRegisterState(
      status ?? this.status,
      errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [status, errorMessage];

  @override
  String toString() => 'ProjectTaskRegisterState(status: $status, errorMessage: $errorMessage)';
}
