import 'dart:developer';

import 'package:isar/isar.dart';

import '../../../core/database/i_database.dart';
import '../../../core/exceptions/repository_exception.dart';
import '../../entities/project.dart';
import '../../entities/project_task.dart';
import '../../enums/project_status_enum.dart';
import 'i_project_repository.dart';

class ProjectRepository implements IProjectRepository {
  final IDatabase _database;

  ProjectRepository({
    required IDatabase database,
  }) : _database = database;

  @override
  Future<void> register(Project project) async {
    try {
      final connection = await _database.openConnection();

      await connection.writeTxn(() async {
        await connection.projects.put(project);
      });
    } on IsarError catch (err, s) {
      const message = 'Erro ao cadastrar projeto.';

      log(message, error: err, stackTrace: s);

      throw RepositoryException(message);
    }
  }

  @override
  Future<List<Project>> findByStatus(ProjectStatusEnum status) async {
    try {
      final connection = await _database.openConnection();

      final projects = await connection.projects.filter().statusEqualTo(status).findAll();

      return projects;
    } on IsarError catch (err, s) {
      const message = 'Erro ao listar projetos.';

      log(message, error: err, stackTrace: s);

      throw RepositoryException(message);
    }
  }

  @override
  Future<Project> findById(int id) async {
    try {
      final connection = await _database.openConnection();

      final project = await connection.projects.get(id);

      if (project == null) {
        throw RepositoryException('Projeto não encontrado.');
      }

      return project;
    } on IsarError catch (err, s) {
      const message = 'Erro ao listar projetos.';

      log(message, error: err, stackTrace: s);

      throw RepositoryException(message);
    }
  }

  @override
  Future<Project> addTask(int projectId, ProjectTask projectTask) async {
    try {
      final connection = await _database.openConnection();

      final project = await findById(projectId);

      project.tasks.add(projectTask);

      await connection.writeTxn(() async {
        await connection.projectTasks.put(projectTask);
        await project.tasks.save();
      });

      return project;
    } on IsarError catch (err, s) {
      const message = 'Erro ao cadastrar tarefa ao projeto.';

      log(message, error: err, stackTrace: s);

      throw RepositoryException(message);
    }
  }
}
