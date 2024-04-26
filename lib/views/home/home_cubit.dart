import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_project/views/home/home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  late Timer _timer;
  int lastSelectedDuration = 60;

  HomeCubit() : super(HomeState(60, false));

  onMainButton() {
    if (state.isPlaying) {
      _pauseTimer();
    } else {
      _playTimer();
    }
  }

  _playTimer() {
    emit(state.copyWith(isPlaying: true, duration: lastSelectedDuration));
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (state.duration == 0) {
        emit(state.copyWith(isPlaying: false));
        _timer.cancel();
      } else {
        emit(state.copyWith(duration: state.duration - 1));
      }
    });
  }

  _pauseTimer() {
    emit(state.copyWith(isPlaying: false, duration: lastSelectedDuration));
    _timer.cancel();
  }

  setDuration(int duration) {
    lastSelectedDuration = duration;
    emit(state.copyWith(duration: duration));
  }

  @override
  Future<void> close() {
    _timer.cancel();
    return super.close();
  }
}
