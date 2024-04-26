class HomeState {
  final int duration;

  HomeState(this.duration);

  HomeState copyWith({int? duration}) => HomeState(duration ?? this.duration);
}
