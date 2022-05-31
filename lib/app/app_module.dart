import 'package:flutter_modular/flutter_modular.dart';
import 'package:reatividadeflutter/app/core/core_module.dart';
import 'package:reatividadeflutter/app/core/pages/splash_page.dart';
import 'package:reatividadeflutter/app/modules/farmers/farmer_module.dart';
import 'package:reatividadeflutter/app/modules/home/home_page.dart';

class AppModule extends Module {
  @override
  final List<Module> imports = [
    CoreModule(),
    FarmerModule(),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (context, args) => SplashPage()),
    ChildRoute('/home', child: ((context, args) => const HomePage())),
    ModuleRoute('/farmer', module: FarmerModule()),
  ];
}
