import '../../entities/project.dart';
import '../../enums/project_status_enum.dart';

abstract class IProjectRepository {
  Future<void> register(Project project);
  Future<List<Project>> findByStatus(ProjectStatusEnum status);
}
