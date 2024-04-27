class LocationState {
  final bool isLoading;

  LocationState(this.isLoading);

  LocationState copyWith({bool? isLoading}) => LocationState(isLoading ?? this.isLoading);
}
