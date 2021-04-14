// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'UserStore.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$UserStore on _UserStore, Store {
  Computed<Either<Failures, UserViewModel>> _$userComputed;

  @override
  Either<Failures, UserViewModel> get user => (_$userComputed ??=
          Computed<Either<Failures, UserViewModel>>(() => super.user,
              name: '_UserStore.user'))
      .value;
  Computed<StoreStatus> _$userStatusComputed;

  @override
  StoreStatus get userStatus =>
      (_$userStatusComputed ??= Computed<StoreStatus>(() => super.userStatus,
              name: '_UserStore.userStatus'))
          .value;
  Computed<bool> _$userIsEmptyComputed;

  @override
  bool get userIsEmpty =>
      (_$userIsEmptyComputed ??= Computed<bool>(() => super.userIsEmpty,
              name: '_UserStore.userIsEmpty'))
          .value;

  final _$_userAtom = Atom(name: '_UserStore._user');

  @override
  UserViewModel get _user {
    _$_userAtom.reportRead();
    return super._user;
  }

  @override
  set _user(UserViewModel value) {
    _$_userAtom.reportWrite(value, super._user, () {
      super._user = value;
    });
  }

  final _$_userFutureAtom = Atom(name: '_UserStore._userFuture');

  @override
  ObservableFuture<Either<Failures, UserViewModel>> get _userFuture {
    _$_userFutureAtom.reportRead();
    return super._userFuture;
  }

  @override
  set _userFuture(ObservableFuture<Either<Failures, UserViewModel>> value) {
    _$_userFutureAtom.reportWrite(value, super._userFuture, () {
      super._userFuture = value;
    });
  }

  final _$_userFailureAtom = Atom(name: '_UserStore._userFailure');

  @override
  Failures get _userFailure {
    _$_userFailureAtom.reportRead();
    return super._userFailure;
  }

  @override
  set _userFailure(Failures value) {
    _$_userFailureAtom.reportWrite(value, super._userFailure, () {
      super._userFailure = value;
    });
  }

  final _$pastAppointmentsAtom = Atom(name: '_UserStore.pastAppointments');

  @override
  ObservableList<UserAppointmentsViewModel> get pastAppointments {
    _$pastAppointmentsAtom.reportRead();
    return super.pastAppointments;
  }

  @override
  set pastAppointments(ObservableList<UserAppointmentsViewModel> value) {
    _$pastAppointmentsAtom.reportWrite(value, super.pastAppointments, () {
      super.pastAppointments = value;
    });
  }

  final _$futureAppointmentsAtom = Atom(name: '_UserStore.futureAppointments');

  @override
  ObservableList<UserAppointmentsViewModel> get futureAppointments {
    _$futureAppointmentsAtom.reportRead();
    return super.futureAppointments;
  }

  @override
  set futureAppointments(ObservableList<UserAppointmentsViewModel> value) {
    _$futureAppointmentsAtom.reportWrite(value, super.futureAppointments, () {
      super.futureAppointments = value;
    });
  }

  final _$getUserInformationAsyncAction =
      AsyncAction('_UserStore.getUserInformation');

  @override
  Future<dynamic> getUserInformation(int userId) {
    return _$getUserInformationAsyncAction
        .run(() => super.getUserInformation(userId));
  }

  final _$_UserStoreActionController = ActionController(name: '_UserStore');

  @override
  void getAppointments() {
    final _$actionInfo = _$_UserStoreActionController.startAction(
        name: '_UserStore.getAppointments');
    try {
      return super.getAppointments();
    } finally {
      _$_UserStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
pastAppointments: ${pastAppointments},
futureAppointments: ${futureAppointments},
user: ${user},
userStatus: ${userStatus},
userIsEmpty: ${userIsEmpty}
    ''';
  }
}
