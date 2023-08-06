import 'package:flutter_modular/flutter_modular.dart';

import '../../data/repositories/project/i_project_repository.dart';
import '../../data/repositories/project/project_repository.dart';
import '../../data/services/auth/auth_service.dart';
import '../../data/services/auth/i_auth_service.dart';
import '../../data/services/project/i_project_service.dart';
import '../../data/services/project/project_service.dart';
import '../database/database.dart';
import '../database/i_database.dart';

class ApplicationModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.lazySingleton<IDatabase>(
          (i) => Database(),
          export: true,
        ),
        Bind.lazySingleton<IAuthService>(
          (i) => AuthService(),
          export: true,
        ),
        Bind.lazySingleton<IProjectRepository>(
          (i) => ProjectRepository(database: i()),
          export: true,
        ),
        Bind.lazySingleton<IProjectService>(
          (i) => ProjectService(projectRepository: i()),
          export: true,
        ),
      ];
}
