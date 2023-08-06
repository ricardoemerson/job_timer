import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../core/base_state/base_state.dart';
import 'home_cubit.dart';
import 'home_state.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends BaseState<HomePage, HomeCubit> {
  final controller = Modular.get<HomeCubit>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomePage'),
        centerTitle: true,
      ),
      body: BlocListener<HomeCubit, HomeState>(
        bloc: cubit,
        listener: (context, state) {
          return state.status.matchAny(any: () => hideLoader());
        },
        child: Column(
          children: [
            const Center(
              child: Text(
                'HomePage is working',
                style: TextStyle(fontSize: 20),
              ),
            ),
            ElevatedButton(onPressed: cubit.signOut, child: const Text('Sair')),
          ],
        ),
      ),
    );
  }
}
