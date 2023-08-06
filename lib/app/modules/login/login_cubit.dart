import 'dart:developer';

import 'package:bloc/bloc.dart';

import '../../data/services/auth/i_auth_service.dart';
import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final IAuthService _authService;

  LoginCubit({
    required IAuthService authService,
  })  : _authService = authService,
        super(const LoginState.initial());

  Future<void> signIn() async {
    try {
      emit(state.copyWith(status: LoginStatus.loading));

      await _authService.signIn();
    } on Exception catch (err, s) {
      const message = 'Erro ao realizar login.';

      log(message, error: err, stackTrace: s);

      emit(state.copyWith(status: LoginStatus.error, errorMessage: message));
    }
  }
}
