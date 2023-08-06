import 'package:isar/isar.dart';

import '../enums/project_status_enum.dart';
import 'project_task.dart';

part 'project.g.dart';

@Collection()
class Project {
  Id? id = Isar.autoIncrement;

  late String name;
  late int estimate;

  @enumerated
  late ProjectStatusEnum status;

  final tasks = IsarLinks<ProjectTask>();
}
