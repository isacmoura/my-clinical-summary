enum StoreStatus { Initial, Loading, Loaded }

extension StoreStatusExtensions on StoreStatus {
  bool get isLoading => this == StoreStatus.Loading;
  bool get isCompleted => this == StoreStatus.Loaded;
  bool get isInitial => this == StoreStatus.Initial;
}
