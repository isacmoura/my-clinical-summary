import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:my_clinical_summary/AppModule.dart';
import 'package:my_clinical_summary/resources/consts/AppStrings.dart';

Future main() async {
  await startMain();
}

Future startMain() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(ModularApp(module: AppModule()));
}
