enum ResourceState {
  initial,
  loading,
  success,
  error;

  bool get isLoading => this == ResourceState.loading;
  bool get isSuccess => this == ResourceState.success;
  bool get isError => this == ResourceState.error;
  bool get isInitial => this == ResourceState.initial;
}
