import 'package:mobx/mobx.dart';

part 'UserStore.g.dart';

class UserStore = _UserStore with _$UserStore;

abstract class _UserStore with Store {}
