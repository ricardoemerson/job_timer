import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:validatorless/validatorless.dart';

import '../../../core/base_state/base_state.dart';
import '../../../core/extensions/extensions.dart';
import '../../../core/widgets/loader_button.dart';
import 'project_register_cubit.dart';
import 'project_register_state.dart';

class ProjectRegisterPage extends StatefulWidget {
  const ProjectRegisterPage({super.key});

  @override
  State<ProjectRegisterPage> createState() => _ProjectRegisterPageState();
}

class _ProjectRegisterPageState extends BaseState<ProjectRegisterPage, ProjectRegisterCubit> {
  final _formKey = GlobalKey<FormState>();

  final _nameEC = TextEditingController();
  final _estimateEC = TextEditingController();

  @override
  void dispose() {
    _nameEC.dispose();
    _estimateEC.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Criar novo projeto'),
        centerTitle: true,
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
      ),
      body: BlocListener<ProjectRegisterCubit, ProjectRegisterState>(
        bloc: cubit,
        listener: (context, state) {
          return state.status.matchAny(
            loading: () => showLoader(),
            success: () {
              hideLoader();

              showSuccess('Projeto cadastrado com sucesso.');

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
                  decoration: const InputDecoration(labelText: 'Nome do projeto'),
                  textInputAction: TextInputAction.next,
                  textCapitalization: TextCapitalization.sentences,
                  validator: Validatorless.required(context.validatorMessage.required),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: _estimateEC,
                  decoration: const InputDecoration(labelText: 'Estimativa de horas'),
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
                  child: LoaderButton<ProjectRegisterCubit, ProjectRegisterState>(
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
                          int.parse(_estimateEC.text.trim()),
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
