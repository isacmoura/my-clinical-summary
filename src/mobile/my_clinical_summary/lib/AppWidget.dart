import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:my_clinical_summary/AppRoutes.dart';
import 'package:my_clinical_summary/resources/consts/AppStrings.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: Modular.navigatorKey,
      supportedLocales: [const Locale('pt', 'BR')],
      title: AppStrings.appName,
      initialRoute: AppRoutes.home,
      onGenerateRoute: Modular.generateRoute,
    );
  }
}
