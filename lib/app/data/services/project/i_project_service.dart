import '../../enums/project_status_enum.dart';
import '../../models/project_model.dart';
import '../../models/project_task_model.dart';

abstract class IProjectService {
  Future<void> register(ProjectModel project);
  Future<List<ProjectModel>> findByStatus(ProjectStatusEnum status);
  Future<ProjectModel> findById(int id);
  Future<ProjectModel> addTask(int projectId, ProjectTaskModel projectTask);
  Future<void> finishById(int id);
}
