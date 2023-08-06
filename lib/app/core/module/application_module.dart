import 'package:flutter_modular/flutter_modular.dart';

import '../../data/services/auth/auth_service.dart';
import '../../data/services/auth/i_auth_service.dart';
import '../database/database.dart';
import '../database/i_database.dart';

class ApplicationModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.lazySingleton<IDatabase>((i) => Database(), export: true),
        Bind.lazySingleton<IAuthService>((i) => AuthService(), export: true),
      ];
}
