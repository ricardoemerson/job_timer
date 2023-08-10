import '../../entities/project.dart';
import '../../entities/project_task.dart';
import '../../enums/project_status_enum.dart';

abstract class IProjectRepository {
  Future<void> register(Project project);
  Future<List<Project>> findByStatus(ProjectStatusEnum status);
  Future<Project> findById(int id);
  Future<Project> addTask(int projectId, ProjectTask projectTask);
}
