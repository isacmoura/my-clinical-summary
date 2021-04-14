import 'package:flutter_modular/flutter_modular.dart';
import 'package:my_clinical_summary/features/home/HomePage.dart';
import 'package:my_clinical_summary/features/user/UserDetailsPage.dart';
import 'package:my_clinical_summary/features/user/UserStore.dart';

class AppRoutes {
  static const home = "/home";
  static const user = "/userDetailsPage/:id";

  static List<ModularRouter> router() {
    return [
      ModularRouter(AppRoutes.home, child: (_, args) => HomePage(Modular.get())),
      ModularRouter(AppRoutes.user, child: (_, args) => UserDetailsPage(Modular.get<UserStore>(), id: int.parse(args.params['id'])))
    ];
  }
}
