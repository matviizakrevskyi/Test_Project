class SettingsState {
  final bool isLoading;

  SettingsState(this.isLoading);

  SettingsState copyWith({bool? isLoading}) => SettingsState(isLoading ?? this.isLoading);
}
