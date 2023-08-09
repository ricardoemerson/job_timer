import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'project_detail_state.dart';

class ProjectDetailCubit extends Cubit<ProjectDetailState> {
  ProjectDetailCubit() : super(ProjectDetailInitial());
}
