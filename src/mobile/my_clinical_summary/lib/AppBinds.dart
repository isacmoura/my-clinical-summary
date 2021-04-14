import 'package:flutter_modular/flutter_modular.dart';
import 'package:my_clinical_summary/features/home/HomeStore.dart';
import 'package:my_clinical_summary/features/user/UserStore.dart';
import 'package:my_clinical_summary/repositories/UserRepository.dart';

abstract class Injector {
  static List<Bind> router() {
    return [...bindRepositories(), ...bindStores()];
  }

  static bindRepositories() {
    return [
      Bind((i) => UserRepository()),
    ];
  }

  static bindStores() {
    return [
      Bind((i) => HomeStore(i.get<UserRepository>())),
      Bind((i) => UserStore(i.get<UserRepository>())),
    ];
  }
}
