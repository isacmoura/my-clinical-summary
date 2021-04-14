// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'HomeStore.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeStore on _HomeStore, Store {
  Computed<Either<Failures, List<UserViewModel>>> _$usersComputed;

  @override
  Either<Failures, List<UserViewModel>> get users => (_$usersComputed ??=
          Computed<Either<Failures, List<UserViewModel>>>(() => super.users,
              name: '_HomeStore.users'))
      .value;
  Computed<StoreStatus> _$usersStatusComputed;

  @override
  StoreStatus get usersStatus =>
      (_$usersStatusComputed ??= Computed<StoreStatus>(() => super.usersStatus,
              name: '_HomeStore.usersStatus'))
          .value;
  Computed<bool> _$usersAreEmptyComputed;

  @override
  bool get usersAreEmpty =>
      (_$usersAreEmptyComputed ??= Computed<bool>(() => super.usersAreEmpty,
              name: '_HomeStore.usersAreEmpty'))
          .value;

  final _$_usersAtom = Atom(name: '_HomeStore._users');

  @override
  ObservableList<UserViewModel> get _users {
    _$_usersAtom.reportRead();
    return super._users;
  }

  @override
  set _users(ObservableList<UserViewModel> value) {
    _$_usersAtom.reportWrite(value, super._users, () {
      super._users = value;
    });
  }

  final _$_usersFutureAtom = Atom(name: '_HomeStore._usersFuture');

  @override
  ObservableFuture<Either<Failures, List<UserViewModel>>> get _usersFuture {
    _$_usersFutureAtom.reportRead();
    return super._usersFuture;
  }

  @override
  set _usersFuture(
      ObservableFuture<Either<Failures, List<UserViewModel>>> value) {
    _$_usersFutureAtom.reportWrite(value, super._usersFuture, () {
      super._usersFuture = value;
    });
  }

  final _$_usersFailureAtom = Atom(name: '_HomeStore._usersFailure');

  @override
  Failures get _usersFailure {
    _$_usersFailureAtom.reportRead();
    return super._usersFailure;
  }

  @override
  set _usersFailure(Failures value) {
    _$_usersFailureAtom.reportWrite(value, super._usersFailure, () {
      super._usersFailure = value;
    });
  }

  final _$refreshAsyncAction = AsyncAction('_HomeStore.refresh');

  @override
  Future<dynamic> refresh() {
    return _$refreshAsyncAction.run(() => super.refresh());
  }

  @override
  String toString() {
    return '''
users: ${users},
usersStatus: ${usersStatus},
usersAreEmpty: ${usersAreEmpty}
    ''';
  }
}
