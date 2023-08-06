import 'package:flutter_modular/flutter_modular.dart';

import 'project_register/project_register_cubit.dart';
import 'project_register/project_register_page.dart';

class ProjectsModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.lazySingleton((i) => ProjectRegisterCubit(projectService: i())),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/project-register', child: (context, args) => const ProjectRegisterPage()),
      ];
}
