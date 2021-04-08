import 'package:flutter_modular/flutter_modular.dart';
import 'package:my_clinical_summary/features/home/HomePage.dart';
import 'package:my_clinical_summary/features/user/UserDetailsPage.dart';
import 'package:my_clinical_summary/features/user/UserStore.dart';

class AppRoutes {
  static const home = "/home";
  static const user = "/userDetailsPage/:id";

  static List<Router> router() {
    return [
      Router(AppRoutes.home, child: (_, args) => HomePage(Modular.get())),
      Router(AppRoutes.user, child: (_, args) => UserDetailsPage(Modular.get<UserStore>(params: args.params)))
    ];
  }
}
