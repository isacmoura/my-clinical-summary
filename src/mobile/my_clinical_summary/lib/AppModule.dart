import 'package:flutter_modular/flutter_modular.dart';
import 'package:my_clinical_summary/AppBinds.dart';
import 'package:my_clinical_summary/AppRoutes.dart';
import 'package:my_clinical_summary/AppWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class AppModule extends MainModule {
  AppModule();

  @override
  List<Bind> get binds => [...Injector.router()];

  @override
  Widget get bootstrap => AppWidget();

  @override
  List<ModularRouter> get routers => AppRoutes.router();
}