import '../../enums/project_status_enum.dart';
import '../../models/project_model.dart';

abstract class IProjectService {
  Future<void> register(ProjectModel project);
  Future<List<ProjectModel>> findByStatus(ProjectStatusEnum status);
}
