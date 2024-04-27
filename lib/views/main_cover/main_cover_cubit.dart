import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_project/views/main_cover/main_cover_state.dart';

class MainCoverCubit extends Cubit<MainCoverState> {
  MainCoverCubit() : super(MainCoverState(0, false, 0)) {
    Timer(const Duration(milliseconds: 10), () {
      emit(state.copyWith(animationOpacity: 1));
    });
  }

  changeScreen(int index) {
    if (state.tabIndex != index) {
      emit(state.copyWith(animationOpacity: 0));

      Timer(const Duration(milliseconds: 100), () {
        emit(state.copyWith(animationOpacity: 1, tabIndex: index));
      });
    }
  }
}
