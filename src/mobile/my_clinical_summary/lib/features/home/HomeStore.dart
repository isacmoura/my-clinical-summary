import 'package:dartz/dartz.dart';
import 'package:mobx/mobx.dart';
import 'package:my_clinical_summary/repositories/UserRepository.dart';
import 'package:my_clinical_summary/repositories/models/viewModels.dart';
import 'package:my_clinical_summary/resources/exceptions/Failures.dart';
import 'package:my_clinical_summary/resources/utils/StoreStatus.dart';
import 'package:my_clinical_summary/resources/extensions/StoresExtensions.dart';

part 'HomeStore.g.dart';

class HomeStore = _HomeStore with _$HomeStore;

abstract class _HomeStore with Store {
  final UserRepository _repository;

  _HomeStore(this._repository);

  @observable
  ObservableList<UserViewModel> _users = ObservableList();
  @observable
  ObservableFuture<Either<Failures, List<UserViewModel>>> _usersFuture;
  @observable
  Failures _usersFailure;

  @computed
  Either<Failures, List<UserViewModel>> get users => _usersFailure != null ? Left(_usersFailure) : Right(_users);
  @computed
  StoreStatus get usersStatus => _usersFuture.mapFutureStateToStoreState();
  @computed
  bool get usersAreEmpty => _users.isEmpty;

  @action
  Future refresh() async {
    _usersFuture = ObservableFuture(_repository.getUsers());
    final result = await _usersFuture;
    result.fold(
      (failure) => Left(_usersFailure = failure),
      (data) {
        _usersFailure = null;
        _users.clear();
        _users.addAll(data);
        return Right(_users);
      },
    );
  }
}
