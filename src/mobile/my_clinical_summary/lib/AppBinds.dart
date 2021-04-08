import 'package:flutter_modular/flutter_modular.dart';

abstract class Injector {
  static List<Bind> router() {
    return [...bindRepositories(), ...bindStores()];
  }

  static bindRepositories() {
    return [];
  }

  static bindStores() {
    return [];
  }
}
