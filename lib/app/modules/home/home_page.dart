import 'package:flutter/material.dart';

import '../../core/base_state/base_state.dart';
import 'home_cubit.dart';
import 'widgets/home_header.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends BaseState<HomePage, HomeCubit> {
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
      body: CustomScrollView(
        slivers: [
          const SliverAppBar(
            title: Text('Projetos'),
            centerTitle: true,
            expandedHeight: 100,
            toolbarHeight: 100,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(15),
              ),
            ),
          ),
          SliverPersistentHeader(
            delegate: HomeHeader(),
            pinned: true,
          ),
        ],
      ),
    );
  }
}
