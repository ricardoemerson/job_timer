import '../../entities/project.dart';
import '../../enums/project_status_enum.dart';
import '../../models/project_model.dart';
import '../../repositories/project/i_project_repository.dart';
import 'i_project_service.dart';

class ProjectService implements IProjectService {
  final IProjectRepository _projectRepository;

  ProjectService({
    required IProjectRepository projectRepository,
  }) : _projectRepository = projectRepository;

  @override
  Future<void> register(ProjectModel projectModel) async {
    final project = Project()
      ..id = projectModel.id
      ..name = projectModel.name
      ..estimate = projectModel.estimate
      ..status = projectModel.status;

    await _projectRepository.register(project);
  }

  @override
  Future<List<ProjectModel>> findByStatus(ProjectStatusEnum status) async {
    final projects = await _projectRepository.findByStatus(status);

    return projects.map<ProjectModel>((e) => ProjectModel.fromEntity(e)).toList();
  }
}
