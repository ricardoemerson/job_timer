import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/base_state/base_state.dart';
import '../../data/models/project_model.dart';
import 'home_cubit.dart';
import 'home_state.dart';
import 'widgets/home_header.dart';
import 'widgets/project_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends BaseState<HomePage, HomeCubit> {
  @override
  Future<void> onReady() async {
    super.onReady();

    await cubit.loadProjects();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: SafeArea(
          child: ListTile(
            title: TextButton(
              onPressed: cubit.signOut,
              child: const Text('Sair'),
            ),
          ),
        ),
      ),
      body: BlocListener<HomeCubit, HomeState>(
        bloc: cubit,
        listener: (context, state) {
          return state.status.matchAny(
            loading: () => showLoader(),
            success: () => hideLoader(),
            error: () {
              hideLoader();
              showError(state.errorMessage ?? 'Erro não informado.');
            },
            any: () => hideLoader(),
          );
        },
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            const SliverAppBar(
              title: Text('Projetos'),
              centerTitle: true,
              expandedHeight: 100,
              toolbarHeight: 100,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(16),
                ),
              ),
            ),
            SliverPersistentHeader(
              delegate: HomeHeader(cubit: cubit),
              pinned: true,
            ),
            BlocSelector<HomeCubit, HomeState, List<ProjectModel>>(
              bloc: cubit,
              selector: (state) {
                return state.projects;
              },
              builder: (context, projects) {
                return SliverList.builder(
                  itemCount: projects.length,
                  itemBuilder: (context, index) {
                    final project = projects[index];

                    return ProjectTile(project: project);
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
