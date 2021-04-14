import 'package:dartz/dartz.dart';
import 'package:mobx/mobx.dart';
import 'package:my_clinical_summary/repositories/UserRepository.dart';
import 'package:my_clinical_summary/repositories/models/viewModels.dart';
import 'package:my_clinical_summary/resources/exceptions/Failures.dart';
import 'package:my_clinical_summary/resources/utils/StoreStatus.dart';
import 'package:my_clinical_summary/resources/extensions/StoresExtensions.dart';

part 'UserStore.g.dart';

class UserStore = _UserStore with _$UserStore;

abstract class _UserStore with Store {
  final UserRepository _repository;

  _UserStore(this._repository);

  @observable
  UserViewModel _user;
  @observable
  ObservableFuture<Either<Failures, UserViewModel>> _userFuture;
  @observable
  Failures _userFailure;

  @observable
  ObservableList<UserAppointmentsViewModel> pastAppointments = ObservableList();
  @observable
  ObservableList<UserAppointmentsViewModel> futureAppointments =
      ObservableList();

  @computed
  Either<Failures, UserViewModel> get user =>
      _userFailure != null ? Left(_userFailure) : Right(_user);
  @computed
  StoreStatus get userStatus => _userFuture.mapFutureStateToStoreState();
  @computed
  bool get userIsEmpty => _user == null;

  @action
  Future getUserInformation(int userId) async {
    this.pastAppointments.clear();
    this.futureAppointments.clear();
    
    _userFuture = ObservableFuture(_repository.getUserInformation(userId));
    final result = await _userFuture;

    result.fold(
      (failure) => Left(_userFailure = failure),
      (data) {
        _userFailure = null;
        _user = data;
        this.getAppointments();
        return Right(_user);
      },
    );
  }

  @action
  void getAppointments() {
    final now = DateTime.now();
    this.user.fold(
        (l) => null,
        (r) => r.appointments
            .map((e) => {
                  if (now.isAfter(e.date))
                    pastAppointments.add(e)
                  else
                    futureAppointments.add(e)
                })
            .toList());
  }
}
