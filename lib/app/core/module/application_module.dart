import 'package:flutter_modular/flutter_modular.dart';

import '../../data/services/auth/auth_service.dart';
import '../../data/services/auth/i_auth_service.dart';

class ApplicationModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.lazySingleton<IAuthService>((i) => AuthService(), export: true),
      ];
}
