import 'package:flutter_modular/flutter_modular.dart';
import 'package:modular_bloc_bind/modular_bloc_bind.dart';

import 'project_detail/project_detail_cubit.dart';
import 'project_detail/project_detail_page.dart';
import 'project_register/project_register_cubit.dart';
import 'project_register/project_register_page.dart';
import 'project_task_register/project_task_register_cubit.dart';
import 'project_task_register/project_task_register_page.dart';

class ProjectsModule extends Module {
  @override
  List<Bind> get binds => [
        BlocBind.lazySingleton((i) => ProjectRegisterCubit(projectService: i())),
        BlocBind.lazySingleton((i) => ProjectDetailCubit(projectService: i())),
        BlocBind.lazySingleton((i) => ProjectTaskRegisterCubit(projectService: i())),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/project-register', child: (context, args) => const ProjectRegisterPage()),
        ChildRoute('/project-detail', child: (context, args) => const ProjectDetailPage()),
        ChildRoute(
          '/project-task-register',
          child: (context, args) => const ProjectTaskRegisterPage(),
        ),
      ];
}
