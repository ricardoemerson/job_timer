import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../core/extensions/size_extension.dart';
import 'login_cubit.dart';
import 'login_state.dart';

class LoginPage extends StatefulWidget {
  final LoginCubit cubit;

  const LoginPage({
    super.key,
    required this.cubit,
  });

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final cubit = Modular.get<LoginCubit>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DecoratedBox(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF0092B9),
              Color(0xFF0167B2),
            ],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Image.asset('assets/images/logo.png'),
            ),
            SizedBox(height: context.percentHeight(.1)),
            SizedBox(
              width: context.percentWidth(.8),
              height: 49,
              child: ElevatedButton(
                onPressed: widget.cubit.signIn,
                child: Image.asset('assets/images/google.png'),
              ),
            ),
            const SizedBox(height: 30),
            BlocSelector<LoginCubit, LoginState, bool>(
              bloc: cubit,
              selector: (state) {
                return state.status.matchAny(
                  loading: () => true,
                  any: () => false,
                );
              },
              builder: (context, showLoader) {
                return Visibility(
                  visible: showLoader,
                  child: LoadingAnimationWidget.threeArchedCircle(
                    color: Colors.white,
                    size: 60,
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
