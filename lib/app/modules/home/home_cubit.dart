import 'package:bloc/bloc.dart';

import '../../data/services/auth/i_auth_service.dart';
import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final IAuthService _authService;

  HomeCubit({
    required IAuthService authService,
  })  : _authService = authService,
        super(const HomeState.initial());

  Future<void> signOut() async {
    await _authService.signOut();
  }
}
