class HomeState {
  final int duration;
  final bool isPlaying;

  HomeState(this.duration, this.isPlaying);

  HomeState copyWith({int? duration, bool? isPlaying}) =>
      HomeState(duration ?? this.duration, isPlaying ?? this.isPlaying);
}
