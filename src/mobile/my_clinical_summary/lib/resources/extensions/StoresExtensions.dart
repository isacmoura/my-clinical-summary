import 'package:mobx/mobx.dart';
import 'package:my_clinical_summary/resources/utils/StoreStatus.dart';

extension StoresExtensions on ObservableFuture {
  StoreStatus mapFutureStateToStoreState() {
    if (this == null || status == FutureStatus.rejected)
      return StoreStatus.Initial;
    else if (status == FutureStatus.pending)
      return StoreStatus.Loading;
    else
      return StoreStatus.Loaded;
  }
}
