import 'package:flutter_modular/flutter_modular.dart';

import 'core/module/application_module.dart';
import 'modules/splash/splash_page.dart';

class AppModule extends Module {
  @override
  List<Module> get imports => [
        ApplicationModule(),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (context, args) => const SplashPage()),
      ];
}
