import 'package:racao_no_pote/app/app_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:racao_no_pote/app/app_widget.dart';
import 'package:racao_no_pote/app/core/device/location_manager.dart';
import 'package:racao_no_pote/app/modules/home/home_module.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        Bind((i) => AppController()),
        Bind((i) => LocationManager(defaultLocationName: "Africa/Abidjan", userLocationName: "America/Sao_Paulo"))
      ];

  @override
  List<Router> get routers => [
        Router("/", module: HomeModule()),
      ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}
