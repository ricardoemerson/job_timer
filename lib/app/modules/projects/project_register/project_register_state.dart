import 'package:equatable/equatable.dart';
import 'package:match/match.dart';

part 'project_register_state.g.dart';

@match
enum ProjectRegisterStatus { initial, loading, success, error }

class ProjectRegisterState extends Equatable {
  final ProjectRegisterStatus status;
  final String? errorMessage;

  const ProjectRegisterState({
    required this.status,
    this.errorMessage,
  });

  const ProjectRegisterState.initial()
      : status = ProjectRegisterStatus.initial,
        errorMessage = null;

  ProjectRegisterState copyWith({
    ProjectRegisterStatus? status,
    String? errorMessage,
  }) {
    return ProjectRegisterState(
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [status, errorMessage];

  @override
  String toString() => 'ProjectRegisterState(status: $status, errorMessage: $errorMessage)';
}
