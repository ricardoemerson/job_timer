import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:validatorless/validatorless.dart';

import '../../../core/base_state/base_state.dart';
import '../../../core/extensions/extensions.dart';
import '../../../core/widgets/loader_button.dart';
import '../../../data/models/project_model.dart';
import 'project_task_register_cubit.dart';
import 'project_task_register_state.dart';

class ProjectTaskRegisterPage extends StatefulWidget {
  const ProjectTaskRegisterPage({super.key});

  @override
  State<ProjectTaskRegisterPage> createState() => _ProjectTaskRegisterPageState();
}

class _ProjectTaskRegisterPageState
    extends BaseState<ProjectTaskRegisterPage, ProjectTaskRegisterCubit> {
  final _formKey = GlobalKey<FormState>();

  final _nameEC = TextEditingController();
  final _durationEC = TextEditingController();

  @override
  void onReady() {
    super.onReady();

    final project = Modular.args.data as ProjectModel;
    cubit.setProject(project);
  }

  @override
  void dispose() {
    _nameEC.dispose();
    _durationEC.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Criar nova tarefa'),
        centerTitle: true,
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
      ),
      body: BlocListener<ProjectTaskRegisterCubit, ProjectTaskRegisterState>(
        bloc: cubit,
        listener: (context, state) {
          return state.status.matchAny(
            loading: () => showLoader(),
            success: () {
              hideLoader();

              showSuccess('Tarefa cadastrada com sucesso.');

              Modular.to.pop();
            },
            error: () {
              hideLoader();

              showError(state.errorMessage ?? 'Erro não informado.');
            },
            any: () => hideLoader(),
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  controller: _nameEC,
                  autofocus: true,
                  decoration: const InputDecoration(labelText: 'Nome da tarefa'),
                  textInputAction: TextInputAction.next,
                  textCapitalization: TextCapitalization.sentences,
                  validator: Validatorless.required(context.validatorMessage.required),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: _durationEC,
                  decoration: const InputDecoration(labelText: 'Duração da tarefa'),
                  keyboardType: TextInputType.number,
                  validator: Validatorless.multiple([
                    Validatorless.required(context.validatorMessage.required),
                    Validatorless.number(context.validatorMessage.number),
                  ]),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  height: 49,
                  child: LoaderButton<ProjectTaskRegisterCubit, ProjectTaskRegisterState>(
                    bloc: cubit,
                    selector: (state) => state.status.matchAny(
                      loading: () => true,
                      any: () => false,
                    ),
                    onPressed: () async {
                      final formIsValid = _formKey.currentState?.validate() ?? false;

                      if (formIsValid) {
                        await cubit.register(
                          _nameEC.text.trim(),
                          int.parse(_durationEC.text.trim()),
                        );
                      }
                    },
                    label: 'Salvar',
                    loadingLabel: 'Salvando...',
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
