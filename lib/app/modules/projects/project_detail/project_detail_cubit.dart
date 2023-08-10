import 'package:bloc/bloc.dart';

import '../../../data/models/project_model.dart';
import 'project_detail_state.dart';

class ProjectDetailCubit extends Cubit<ProjectDetailState> {
  ProjectDetailCubit() : super(const ProjectDetailState.initial());

  void setProject(ProjectModel project) {
    emit(state.copyWith(status: ProjectDetailStatus.success, project: project));
  }
}
